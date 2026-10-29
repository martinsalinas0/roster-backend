import bcrypt from "bcryptjs";
import { Request, Response } from "express";
import { pool } from "../db.js";

const SALT_ROUNDS = 12;

//POST create a new company and owner for that company
// --- /api/auth/register
export const register = async (req: Request, res: Response) => {
  const { companyName, email, password } = req.body;

  if (!companyName || !email || !password) {
    res.status(400).json({
      success: false,
      message: "Email, company name, and password are required",
    });
    return;
  }

  if (typeof password !== "string" || password.length < 8) {
    res.status(400).json({
      success: false,
      message: "Password must be at least 8 characters",
    });
    return;
  }

  const normalizedEmail = String(email).trim().toLowerCase();
  const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);

  const client = await pool.connect();

  try {
    await client.query("BEGIN");

    const companyResult = await client.query(
      "INSERT INTO companies (name) VALUES ($1) RETURNING id",
      [companyName],
    );

    const companyId = companyResult.rows[0].id;

    const userResult = await client.query(
      "INSERT INTO users (company_id, email, password_hash, role) VALUES ($1, $2, $3, 'owner') RETURNING id, email, company_id, role",
      [companyId, normalizedEmail, hashedPassword],
    );

    await client.query("cOMMIT");
  } catch (error) {}
};
