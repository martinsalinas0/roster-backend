--COMPANIES
--USERS
--REFRESH_TOKENS
--CUSTOMERS 
--EMPLOYEES
--CONTRACTORS 
--JOBS
CREATE TABLE
  companies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    company_id UUID NOT NULL REFERENCES companies (id),
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL CHECK (
      role IN (
        'owner',
        'employee',
        'customer',
        'contractor',
        'admin'
      )
    ),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  refresh_tokens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    user_id UUID NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    token_hash TEXT NOT NULL UNIQUE,
    expires_at TIMESTAMPTZ NOT NULL,
    revoked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  customers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    company_id UUID NOT NULL REFERENCES companies (id),
    user_id UUID UNIQUE REFERENCES users (id),
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    address TEXT,
    city TEXT,
    zip TEXT,
    stripe_customer_id TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  employees (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    company_id UUID NOT NULL REFERENCES companies (id),
    user_id UUID NOT NULL UNIQUE REFERECNES users (id),
    name TEXT NOT NULL,
    title TEXT,
    phone TEXT,
    hourly_rate NUMERIC(10, 2),
    hired_at DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  contractors (
    id UUID,
    company_id,
    user_id,
    business_name,
    contact_name,
    trade,
    phone TEXT,
    email TEXT UNIQUE,
    license_no TEXT,
    insurance_expires_at DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );

CREATE TABLE
  contractors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    company_id UUID NOT NULL REFERENCES companies (id),
    user_id UUID UNIQUE REFERENCES users (id),
    business_name TEXT NOT NULL,
    contact_name TEXT,
    trade TEXT,
    phone TEXT,
    email TEXT,
    license_no TEXT,
    insurance_expires_at DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now (),
    UNIQUE (company_id, email)
  );

CREATE TABLE
  jobs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    company_id UUID NOT NULL REFERENCES companies (id),
    customer_id UUID NOT NULL REFERENCES customers (id),
    contractor_id UUID REFERENCES contractors (id) ON DELETE SET NULL,
    assigned_employee_id UUID REFERENCES employees (id) ON DELETE SET NULL,
    title TEXT NOT NULL,
    description TEXT,
    status TEXT NOT NULL DEFAULT 'new' CHECK (
      status IN (
        'new',
        'scheduled',
        'in_progress',
        'completed',
        'cancelled'
      )
    ),
    scheduled_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now (),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now ()
  );