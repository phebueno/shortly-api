import { db } from "../database/database.connection.js";

export async function getUserData(req,res){
    const {id,name} = res.locals.user;

    const userData = await db.query(`
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
    )`,[id,name]);
    if(!userData.rows[0].json_build_object.name) return res.status(404).send("Usuário não encontrado.")
    res.send(userData.rows[0].json_build_object);
};

export async function getRanking(req,res){
    res.send("enviando ranking de usuários");
};