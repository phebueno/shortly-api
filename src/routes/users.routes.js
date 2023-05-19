import { Router } from "express";
import { signup } from "../controllers/users.controllers.js";

const usersRouter = Router();
usersRouter.post("/signup", signup);

export default usersRouter;
