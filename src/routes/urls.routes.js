import { Router } from "express";
import { deleteShortUrl, getShortUrl, openShortUrl, shortenUrl } from "../controllers/urls.controllers.js";
import schemaValidation from "../middlewares/validateSchema.middleware.js";
import { shortUrlSchema } from "../schemas/urls.schemas.js";

const urlsRouter = Router();
urlsRouter.post("/urls/shorten", schemaValidation(shortUrlSchema), shortenUrl);
urlsRouter.get("/urls/:id", getShortUrl);
urlsRouter.get("/urls/open/:shortUrl", openShortUrl);
urlsRouter.delete("/urls/:id", deleteShortUrl);


export default urlsRouter;
