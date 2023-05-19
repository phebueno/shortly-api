import { Router } from "express";
import { signup } from "../controllers/users.controllers.js";

const usersRouter = Router();
usersRouter.get("/signup", signup);

export default usersRouter;
