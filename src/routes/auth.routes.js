import { Router } from "express";
import { signin, signup } from "../controllers/auth.controllers.js";
import schemaValidation from "../middlewares/validateSchema.middleware.js";
import { signinSchema, signupSchema } from "../schemas/auth.schema.js";

const authRouter = Router();
authRouter.post("/signup", schemaValidation(signupSchema), signup);
authRouter.post("/signin", schemaValidation(signinSchema), signin);

export default authRouter;
