import express, { Request, Response } from "express";
import { pool } from "./db.js";

const app = express();

app.use(express.json());

app.get("/health", async (req: Request, res: Response) => {
  try {
    await pool.query("SELECT 1");
    res.json({ ok: true, db: "connected" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ ok: false, db: "unreachable" });
  }
});

export default app;
