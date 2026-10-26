import { Request, Response, Router } from "express";
import { pool } from "../db.js";

const router = Router();

//GET customer
// "/api/customers"

router.get("/", async (req: Request, res: Response) => {
  const result = await pool.query(
    "SELECT * FROM customers WHERE company_id = $1 ORDER BY NAME",
    [req.companyId],
  );
  res.json({ success: true, data: result.rows });
  console.log("just a console log check");
});

export default router;
