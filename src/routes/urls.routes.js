import { Router } from "express";
import {
  deleteShortUrl,
  getShortUrl,
  openShortUrl,
  shortenUrl,
} from "../controllers/urls.controllers.js";
import { validateAuth } from "../middlewares/validateAuth.middleware.js";
import { schemaValidation } from "../middlewares/validateSchema.middleware.js";
import { idShortUrlSchema, idUrlSchema, shortUrlSchema } from "../schemas/urls.schemas.js";

const urlsRouter = Router();
urlsRouter.post(
  "/urls/shorten",
  schemaValidation(shortUrlSchema, 'body'),
  validateAuth,
  shortenUrl
);
urlsRouter.get("/urls/:id", schemaValidation(idUrlSchema,'params'), getShortUrl);
urlsRouter.get("/urls/open/:shortUrl",schemaValidation(idShortUrlSchema,'params'), openShortUrl);
urlsRouter.delete("/urls/:id",schemaValidation(idUrlSchema,'params'), validateAuth, deleteShortUrl);

export default urlsRouter;
