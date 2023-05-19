import { db } from "../database/database.connection.js";

export async function signup(req,res){
    try {
        const user = await db.query(`SELECT * FROM users`);
        res.send(user.rows);
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function signin(req,res){
    res.send("signin");
}