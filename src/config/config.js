import dotenv from "dotenv";
dotenv.config();

export default {
  database: process.env.DB_DATABASE,
  user: process.env.BD_USER,
  pass: process.env.BD_PASS,
  host: process.env.BD_HOST,
  port: process.env.BD_PORT,
  dialect: process.env.BD_DIALECT,
};
