import { db } from "../database/database.connection.js";
import {nanoid} from "nanoid";

export async function shortenUrl(req,res){
    const userId = 1; //recuperar ID por validação do usuário
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
        console.log(err.detail);
        const message = err.detail ? err.detail : err.message.detail;
        res.status(500).send(message);
    }
}

export async function getShortUrl(req,res){
    try {
        res.send("url diminuida recebida");
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function openShortUrl(req,res){
    try {
        res.send("url diminuida aberta");
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
