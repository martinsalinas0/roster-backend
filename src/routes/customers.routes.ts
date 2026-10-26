import { Request, Response, Router } from "express";
import { pool } from "../db.js";

const router = Router();

//GET customer
// "/api/customers"

router.get("/", async (req: Request, res: Response) => {
  try {
    const result = await pool.query(
      "SELECT * FROM customers WHERE company_id = $1",
      [req.companyId],
    );
    res.status(200).json({ success: true, data: result.rows });
    console.log("console log check");
  } catch (error: any) {
    console.error(error);
    res.status(500).json({ success: false, message: "internal server error" });
  }
});

export default router;
