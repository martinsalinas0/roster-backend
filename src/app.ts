import express, { Request, Response } from "express";
import { pool } from "./db.js";
import { devAuth } from "./middleware/devAuth.js";

const app = express();

app.use(express.json());

//no auth
app.get("/health", async (req: Request, res: Response) => {
  try {
    await pool.query("SELECT 1");
    res.json({ ok: true, db: "connected" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ ok: false, db: "unreachable" });
  }
});

//all must go through devAuth first now

app.use(devAuth);
app.get("/api", (req: Request, res: Response) => {
  res.json({ success: true, message: "Roster API is running" });
});

export default app;
