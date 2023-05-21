import { db } from "../database/database.connection.js";

export function newUserDB(body, passwordHash) {
  const { name, email } = body;
  return db.query(
    `INSERT INTO users (name,email,password,"createdAt")
              VALUES ($1,$2,$3,NOW())
              ON CONFLICT DO NOTHING`,
    [name, email, passwordHash]
  );
}

export function getUserByEmailDB(body) {
  const { email } = body;
  return db.query(`SELECT * FROM users WHERE email=$1`, [email]);
}

export function newSessionDB(token,login){
    return db.query(
        `INSERT INTO sessions ("userId",token,"createdAt")
              VALUES ($1,$2,NOW())`,
        [login.rows[0].id, token]
      );
}