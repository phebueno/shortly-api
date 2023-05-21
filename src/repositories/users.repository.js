import { db } from "../database/database.connection.js";

export function getUserUrlsInfoDB(user){
    const { id, name } = user;
    return db.query(
        `
      SELECT json_build_object(
          'id',$1::integer,
          'name',$2::text,
          'visitCount',(SELECT COALESCE(SUM(visits), 0) FROM urls WHERE "userId"=$1::integer),	
          'shortenedUrls', 
              COALESCE((SELECT json_agg(row_to_json("urls")) 
                  FROM 
                      (SELECT id,
                          "urlShort" AS "shortUrl",
                          "urlDefault" AS url,	  
                          "visits" AS "visitCount" 
                              FROM "urls" WHERE "userId"=$1::integer) AS urls), '[]'::json)		
      )`,
        [id, name]
      );
}

export function getUsersRankingDB(){
    return db.query(
        `SELECT users.id, users.name,  
          COUNT(urls.id) AS "linksCount", 
          COALESCE(SUM(urls.visits),0) AS "visitCount"
              FROM users 
                  LEFT JOIN urls ON users.id=urls."userId" 
                  GROUP BY users.id
                  ORDER BY "visitCount" DESC
                  LIMIT 10`
      );
}