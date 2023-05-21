import joi from "joi";

export const shortUrlSchema = joi.object({
  url: joi.string().uri().required(),
});

export const idUrlSchema = joi.object({
  id: joi.number().integer().positive(),
});

export const idShortUrlSchema = joi.object({
  shortUrl: joi
    .string()
    .regex(/^[^-\s][a-zA-Z0-9_-]+$/)
    .messages({ "string.pattern.base": `ShortUrl allows only alphanum, - or _ characters.` })
    .required(),
});
