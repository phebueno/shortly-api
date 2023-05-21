import { getUsersRankingDB, getUserUrlsInfoDB } from "../repositories/users.repository.js";

export async function getUserData(req, res) {
  try {
    const userData = await getUserUrlsInfoDB(res.locals.user);
    if (!userData.rows[0].json_build_object.name)
      return res.status(404).send("Usuário não encontrado.");
    res.send(userData.rows[0].json_build_object);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getRanking(req, res) {
  try {
    const usersRanking = await getUsersRankingDB();
    res.send(usersRanking.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
