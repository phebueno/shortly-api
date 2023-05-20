import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";

export async function signup(req, res) {
  const { name, email, password } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    const addUser = await db.query(
        `INSERT INTO users (name,email,password,"createdAt")
            VALUES ($1,$2,$3,NOW())
            ON CONFLICT DO NOTHING`,
            [name,email,passwordHash]);
    if(!addUser.rowCount) return res.status(409).send("Email já cadastrado!");
    res.status(201).send("Usuário cadastrado!");
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function signin(req, res) {
  res.send("signin");
}