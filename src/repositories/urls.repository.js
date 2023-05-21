import { db } from "../database/database.connection.js";

export function insertShortUrlDB(locals, body, shortUrl) {
  const userId = locals.user.id; //recuperar ID por validação do usuário
  const { url } = body;
  return db.query(
    `INSERT INTO urls ("urlDefault","urlShort","userId","createdAt")
        VALUES ($1,'${shortUrl}',$2,NOW())
        RETURNING id;
        `,
    [url, userId]
  );
}

export function getShortUrlByIdDB(params) {
  const { id } = params;
  return db.query(`SELECT * FROM urls WHERE id=$1`, [id]);
}

export function addVisitShortUrlById(params){
    const { shortUrl } = params;
    return  db.query(
        `UPDATE urls 
                  SET visits=visits+1 
                  WHERE "urlShort"=$1 
                  RETURNING "urlDefault"`,
        [shortUrl]
      );
}

export function deleteShortUrlByIdDB(params, locals) {
  const { id } = params;
  const userId = locals.user.id;
  return db.query(
    `DELETE FROM urls 
                  WHERE id=$1 AND "userId"=$2`,
    [id, userId]
  );
}
