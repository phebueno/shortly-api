import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function signup(req, res) {
  const { name, email, password } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    const addUser = await db.query(
      `INSERT INTO users (name,email,password,"createdAt")
            VALUES ($1,$2,$3,NOW())
            ON CONFLICT DO NOTHING`,
      [name, email, passwordHash]
    );
    if (!addUser.rowCount) return res.status(409).send("Email já cadastrado!");
    res.status(201).send("Usuário cadastrado!");
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function signin(req, res) {
  const { email, password } = req.body;
  try {
    const login = await db.query(`SELECT * FROM users WHERE email=$1`, [email]);

    if (!login.rowCount) return res.status(401).send("Email não cadastrado.");
    if (!bcrypt.compareSync(password, login.rows[0].password))
      return res.status(401).send("Senha incorreta.");
      
    //Criação de sessão
    const token = uuid();
    await db.query(
      `INSERT INTO sessions ("userId",token,"createdAt")
            VALUES ($1,$2,NOW())`,
      [login.rows[0].id, token]
    );
    res.send({ token });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
