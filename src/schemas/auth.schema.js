import joi from "joi";

export const signupSchema = joi.object({
  name: joi.string().required(),
  email: joi.string().email().required(),
  password: joi.string().min(3).required(),
  confirmPassword: joi.any().valid(joi.ref('password')).required().messages({
    "any.only" : "Password must match"
  }),
});

export const signinSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().min(3).required(),
});

