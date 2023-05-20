import { db } from "../database/database.connection.js";
import {nanoid} from "nanoid";

export async function shortenUrl(req,res){
    const userId = res.locals.user.id; //recuperar ID por validação do usuário
    const {url} = req.body;
    const shortUrl = nanoid(8);

    try {
        const addUrl = await db.query(
            `INSERT INTO urls ("urlDefault","urlShort","userId","createdAt")
            VALUES ($1,'${shortUrl}',$2,NOW())
            RETURNING id;
            `,[url,userId]);
        const id = addUrl.rows[0].id;
        res.status(201).send({id, shortUrl});
    } catch (err) {
        const message = err.detail ? err.detail : err.message.detail;
        res.status(500).send(message);
    }
}

export async function getShortUrl(req,res){
    const {id:idUrl} = req.params;
    try {
        const objUrl = await db.query(`SELECT * FROM urls WHERE id=$1`,[idUrl]);
        if(!objUrl.rowCount) return res.status(404).send("Url não encontrada!");
        const {id,urlShort:shortUrl,urlDefault:url} = objUrl.rows[0];
        res.send({id, shortUrl,url});
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function openShortUrl(req,res){
    const {shortUrl} = req.params;
    try {
        const objUrl = await db.query(
            `UPDATE urls 
                SET visits=visits+1 
                WHERE "urlShort"=$1 
                RETURNING "urlDefault"`,[shortUrl]);
        if(!objUrl.rowCount) return res.status(404).send("Url não encontrada!");
        res.redirect(objUrl.rows[0].urlDefault);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function deleteShortUrl(req,res){
    try {
        res.send("url diminuida deletada");
    } catch (err) {
        res.status(500).send(err.message);
    }
}
