import { Router } from "express";
import { signup } from "../controllers/auth.controllers.js";
import schemaValidation from "../middlewares/validateSchema.middleware.js";
import { authSchema } from "../schemas/auth.schema.js";

const authRouter = Router();
authRouter.post("/signup", schemaValidation(authSchema), signup);

export default authRouter;
