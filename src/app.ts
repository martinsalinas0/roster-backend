import express, { Request, Response, NextFunction } from "express";
import { pool } from "./db.js";
import { devAuth } from "./middleware/devAuth.js";
import customerRoutes from "./routes/customers.routes.js";

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

//routers

app.use("/api/customers", customerRoutes);

// 404: no route matched (after all routes)
app.use((req: Request, res: Response) => {
  res.status(404).json({ success: false, error: "Not found" });
});

//general 500 status error
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err);
  res.status(500).json({ success: false, error: "Internal server error" });
});

export default app;
