import app from "./app.js";
import { pool } from "./db.js";

const PORT = process.env.PORT || 8080;

const startServer = async (): Promise<void> => {
  try {
    const result = await pool.query("SELECT NOW()");
    console.log("Connected to database at:", result.rows[0].now);

    app.listen(PORT, () => {
      console.log(`Server running on http://localhost:${PORT}`);
    });
  } catch (error) {
    console.error("Failed to connect to database or start server:", error);
    process.exit(1);
  }
};

startServer();
