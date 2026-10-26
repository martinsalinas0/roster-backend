//GET  /api/customers

import { Request, Response } from "express";
import { pool } from "../db.js";

//GET all customers
//"/api/customers"
export const getCustomers = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(
      "SELECT * FROM customers WHERE company_id = $1 ORDER BY name",
      [req.companyId],
    );
    res.status(200).json({ success: true, data: result.rows });
    console.log("KANGAROO");
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, error: "Internal server error" });
  }
};
