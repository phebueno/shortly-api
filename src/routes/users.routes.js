import { Router } from "express";
import { getRanking, getUserData } from "../controllers/users.controllers.js";
import { validateAuth } from "../middlewares/validateAuth.middleware.js";

const usersRouter = Router();
usersRouter.get("/users/me", validateAuth, getUserData);
usersRouter.get("/ranking", getRanking);

export default usersRouter;