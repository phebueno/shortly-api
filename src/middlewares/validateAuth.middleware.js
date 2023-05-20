import { db } from "../database/database.connection.js";

export async function validateAuth(req,res,next) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    if (!token) return res.sendStatus(401);
    const session = await db.query(
        `SELECT * FROM users 
            WHERE id=
            (SELECT "userId" FROM sessions 
            WHERE token=$1
    )`,[token])
    if(!session.rowCount) return res.sendStatus(401);
    res.locals = {user:session.rows[0]};
    next();
}