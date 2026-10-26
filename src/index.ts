import express from "express";

const app = express();

const PORT = process.env.PORT ?? 8080;

app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({ status: "ok" });
});

const startServer = async (): Promise<void> => {
  try {
    app.listen(PORT, () => {
      console.log(`    Server is running on http://localhost:${PORT}`);
    });
  } catch (error) {
    console.error("Failed to connect to database or start server:", error);
    process.exit(1);
  }
};

startServer();
