import pg from "pg";

const { Pool } = pg;

if (!process.env.DATABASE_DEV_URL) {
  throw new Error("DATABASE_DEV_URL is not set");
}

export const pool = new Pool({
  connectionString: process.env.DATABASE_DEV_URL,
});
