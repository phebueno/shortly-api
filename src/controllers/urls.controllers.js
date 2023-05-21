import { db } from "../database/database.connection.js";
import { nanoid } from "nanoid";
import { addVisitShortUrlById, deleteShortUrlByIdDB, getShortUrlByIdDB, insertShortUrlDB } from "../repositories/urls.repository.js";

export async function shortenUrl(req, res) {
  const shortUrl = nanoid(8);
  try {
    const addUrl = await insertShortUrlDB(res.locals, req.body, shortUrl);
    const id = addUrl.rows[0].id;
    res.status(201).send({ id, shortUrl });
  } catch (err) {
    const message = err.detail ? err.detail : err.message;
    res.status(500).send(message);
  }
}

export async function getShortUrl(req, res) {
  try {
    const objUrl = await getShortUrlByIdDB(req.params);
    if (!objUrl.rowCount) return res.status(404).send("Url não encontrada!");
    const { id, urlShort: shortUrl, urlDefault: url } = objUrl.rows[0];
    res.send({ id, shortUrl, url });
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function openShortUrl(req, res) {  
  try {
    const objUrl = await addVisitShortUrlById(req.params);
    if (!objUrl.rowCount) return res.status(404).send("Url não encontrada!");
    res.redirect(objUrl.rows[0].urlDefault);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function deleteShortUrl(req, res) {
  const { id: idUrl } = req.params;
  try {
    const objUrl = await deleteShortUrlByIdDB(req.params,res.locals);
    if (!objUrl.rowCount) {
      const checkUrl = await db.query(`SELECT * FROM urls WHERE id=$1`, [
        idUrl,
      ]);
      if (checkUrl.rowCount) return res.sendStatus(401);
      else return res.status(404).send("Url não encontrada!");
    }
    res.sendStatus(204);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
