//DEV ONLY: fake auths so routes can be built prior to real auth;
//replace with real JWT auth middleware before deploy - WEEK 4

import type { Request, Response, NextFunction } from "express";

//company A UUID from DB -> db/seed.sql
const DEV_COMPANY_ID = "00000000-0000-0000-0000-00000000000a";

//NOT REAL, no users seeded in DB yet
const DEV_USER_ID = "00000000-0000-0000-0000-1200000000ff";

export const devAuth = (req: Request, res: Response, next: NextFunction) => {
  if (process.env.NODE_ENV === "production") {
    throw new Error("devAuth must never run in prod");
  }

  req.userId = DEV_USER_ID;
  req.companyId = DEV_COMPANY_ID;
  req.role = "admin";

  next();
};
