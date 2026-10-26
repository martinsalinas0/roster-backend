-- db/seed.sql
-- DEV ONLY. Never run this against the prod branch.
-- Wipes every table, then loads 2 companies of test data.
-- Users and employees are added later, once auth can hash passwords.
TRUNCATE jobs,
contractors,
employees,
customers,
refresh_tokens,
users,
companies CASCADE;

-- =========================================================
-- COMPANIES
-- A = ...00a, B = ...00b
-- =========================================================
INSERT INTO
  companies (id, name)
VALUES
  (
    '00000000-0000-0000-0000-00000000000a',
    'Blue Wave Pool Service'
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    'Hill Country Home Repair'
  );

-- =========================================================
-- CUSTOMERS
-- Company A: ...0001-0000000000a1 to a5
-- Company B: ...0001-0000000000b1 to b5
-- =========================================================
INSERT INTO
  customers (
    id,
    company_id,
    name,
    email,
    phone,
    address,
    city,
    zip
  )
VALUES
  -- Company A
  (
    '00000000-0000-0000-0001-0000000000a1',
    '00000000-0000-0000-0000-00000000000a',
    'Dana Ortiz',
    'dana.ortiz@example.com',
    '512-555-0101',
    '1402 S 5th St',
    'Austin',
    '78704'
  ),
  (
    '00000000-0000-0000-0001-0000000000a2',
    '00000000-0000-0000-0000-00000000000a',
    'Greg Holloway',
    'greg.h@example.com',
    '512-555-0102',
    '3811 Balcones Dr',
    'Austin',
    '78731'
  ),
  (
    '00000000-0000-0000-0001-0000000000a3',
    '00000000-0000-0000-0000-00000000000a',
    'Priya Natarajan',
    NULL,
    '512-555-0103',
    '7205 Shoal Creek Blvd',
    'Austin',
    '78757'
  ),
  (
    '00000000-0000-0000-0001-0000000000a4',
    '00000000-0000-0000-0000-00000000000a',
    'Marcus Bell',
    'mbell@example.com',
    '512-555-0104',
    '9900 Great Hills Trl',
    'Austin',
    '78759'
  ),
  (
    '00000000-0000-0000-0001-0000000000a5',
    '00000000-0000-0000-0000-00000000000a',
    'Linda Vasquez',
    'linda.v@example.com',
    NULL,
    '2210 E Cesar Chavez St',
    'Austin',
    '78702'
  ),
  -- Company B
  (
    '00000000-0000-0000-0001-0000000000b1',
    '00000000-0000-0000-0000-00000000000b',
    'Sam Lee',
    'sam.lee@example.com',
    '512-555-0201',
    '6104 Manchaca Rd',
    'Austin',
    '78745'
  ),
  (
    '00000000-0000-0000-0001-0000000000b2',
    '00000000-0000-0000-0000-00000000000b',
    'Rachel Kim',
    'rkim@example.com',
    '512-555-0202',
    '1907 Riverside Dr',
    'Austin',
    '78741'
  ),
  (
    '00000000-0000-0000-0001-0000000000b3',
    '00000000-0000-0000-0000-00000000000b',
    'Tom Whitaker',
    NULL,
    '512-555-0203',
    '4400 Berkman Dr',
    'Austin',
    '78723'
  ),
  (
    '00000000-0000-0000-0001-0000000000b4',
    '00000000-0000-0000-0000-00000000000b',
    'Angela Brooks',
    'angela.brooks@example.com',
    '512-555-0204',
    '10301 Slaughter Creek Dr',
    'Austin',
    '78748'
  ),
  (
    '00000000-0000-0000-0001-0000000000b5',
    '00000000-0000-0000-0000-00000000000b',
    'Jorge Mendoza',
    'jorge.m@example.com',
    '512-555-0205',
    '8601 Spicewood Springs Rd',
    'Austin',
    '78750'
  );

-- =========================================================
-- CONTRACTORS
-- Company A: ...0002-0000000000a1 to a3
-- Company B: ...0002-0000000000b1 to b3
-- =========================================================
INSERT INTO
  contractors (
    id,
    company_id,
    business_name,
    contact_name,
    trade,
    phone,
    email,
    license_no,
    insurance_expires_at
  )
VALUES
  -- Company A
  (
    '00000000-0000-0000-0002-0000000000a1',
    '00000000-0000-0000-0000-00000000000a',
    'Lone Star Pool Equipment',
    'Ray Dominguez',
    'Pool equipment',
    '512-555-0301',
    'ray@lonestarpool.example',
    'TX-PE-10432',
    '2027-03-31'
  ),
  (
    '00000000-0000-0000-0002-0000000000a2',
    '00000000-0000-0000-0000-00000000000a',
    'Spark Electric Co.',
    'Tina Nguyen',
    'Electrical',
    '512-555-0302',
    'tina@sparkelectric.example',
    'TECL-88213',
    '2026-12-15'
  ),
  (
    '00000000-0000-0000-0002-0000000000a3',
    '00000000-0000-0000-0000-00000000000a',
    'Austin Tile & Plaster',
    'Ben Carter',
    'Tile and plaster',
    '512-555-0303',
    NULL,
    NULL,
    '2027-06-30'
  ),
  -- Company B
  (
    '00000000-0000-0000-0002-0000000000b1',
    '00000000-0000-0000-0000-00000000000b',
    'Capital City Plumbing',
    'Luis Romero',
    'Plumbing',
    '512-555-0401',
    'luis@ccplumbing.example',
    'M-40291',
    '2027-01-31'
  ),
  (
    '00000000-0000-0000-0002-0000000000b2',
    '00000000-0000-0000-0000-00000000000b',
    'Spark Electric Co.',
    'Tina Nguyen',
    'Electrical',
    '512-555-0302',
    'tina@sparkelectric.example',
    'TECL-88213',
    '2026-12-15'
  ),
  (
    '00000000-0000-0000-0002-0000000000b3',
    '00000000-0000-0000-0000-00000000000b',
    'DryOut Restoration',
    'Kelly Shaw',
    'Water damage',
    '512-555-0403',
    'kelly@dryout.example',
    NULL,
    '2027-04-30'
  );

-- =========================================================
-- JOBS (ids generated by Postgres)
-- Varied descriptions on purpose: the Week 7 RAG search runs on these.
-- =========================================================
INSERT INTO
  jobs (
    company_id,
    customer_id,
    contractor_id,
    title,
    description,
    status,
    scheduled_at,
    completed_at
  )
VALUES
  -- Company A: Blue Wave Pool Service
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a1',
    '00000000-0000-0000-0002-0000000000a1',
    'Pump not priming',
    'Pool pump runs but will not prime. Customer hears air in the strainer basket. Check lid O-ring and suction-side leaks.',
    'scheduled',
    '2026-10-28 09:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a1',
    NULL,
    'Green pool after rain',
    'Algae bloom after heavy rain. Needs shock treatment, brushing, and a filter clean.',
    'completed',
    '2026-10-05 10:00-05',
    '2026-10-05 12:30-05'
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a2',
    '00000000-0000-0000-0002-0000000000a2',
    'Pool light flickering',
    'Underwater light flickers and trips the GFCI breaker. Possible water in the light niche.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a2',
    NULL,
    'Weekly cleaning',
    'Recurring weekly service: skim, vacuum, brush walls, test and balance chemicals.',
    'in_progress',
    '2026-10-25 08:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a3',
    '00000000-0000-0000-0002-0000000000a3',
    'Cracked tile at waterline',
    'Several waterline tiles cracked and loose on the deep end. Customer wants them replaced before winter.',
    'scheduled',
    '2026-11-03 13:00-06',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a3',
    NULL,
    'Losing water daily',
    'Pool losing about an inch of water per day. Possible leak in the return line or skimmer. Needs a dye test.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a4',
    '00000000-0000-0000-0002-0000000000a1',
    'Heater not igniting',
    'Gas pool heater clicks but does not ignite. Error code IF on the display.',
    'scheduled',
    '2026-10-30 11:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a4',
    NULL,
    'Filter pressure high',
    'Cartridge filter pressure reads 30 psi, about 10 over clean. Cartridges need cleaning or replacement.',
    'completed',
    '2026-10-12 09:30-05',
    '2026-10-12 10:45-05'
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a5',
    '00000000-0000-0000-0002-0000000000a3',
    'Plaster staining',
    'Brown stains on the plaster near the steps. Likely metal staining. Customer asked for a quote to acid wash.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a5',
    '00000000-0000-0000-0002-0000000000a2',
    'Timer box burned out',
    'Pump timer box has scorch marks and the pump will not turn on. Possible failed relay.',
    'in_progress',
    '2026-10-24 14:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a2',
    NULL,
    'Winterize equipment',
    'Customer wants freeze protection checked before the first cold front.',
    'cancelled',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000a',
    '00000000-0000-0000-0001-0000000000a1',
    '00000000-0000-0000-0002-0000000000a1',
    'Salt cell replacement',
    'Salt chlorine generator shows a check cell warning. Cell is five years old and heavily scaled.',
    'new',
    NULL,
    NULL
  ),
  -- Company B: Hill Country Home Repair
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b1',
    '00000000-0000-0000-0002-0000000000b1',
    'Water heater leak',
    'Water pooling under the 50 gallon gas water heater in the garage. Tank is twelve years old.',
    'scheduled',
    '2026-10-27 08:30-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b1',
    NULL,
    'Garbage disposal jammed',
    'Disposal hums but does not spin. Customer already tried the reset button.',
    'completed',
    '2026-10-08 15:00-05',
    '2026-10-08 15:40-05'
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b2',
    '00000000-0000-0000-0002-0000000000b3',
    'Water damage under kitchen sink',
    'Cabinet floor is soft and swollen from a slow leak under the kitchen sink. Visible mold spots.',
    'in_progress',
    '2026-10-23 10:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b2',
    '00000000-0000-0000-0002-0000000000b1',
    'Supply line replacement',
    'Replace the leaking supply line that caused the kitchen water damage.',
    'scheduled',
    '2026-10-29 09:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b3',
    '00000000-0000-0000-0002-0000000000b2',
    'Outlets dead in bedroom',
    'Two outlets in the back bedroom stopped working. Breaker is not tripped. Possible loose connection or failed GFCI upstream.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b3',
    NULL,
    'Ceiling fan install',
    'Install a customer-supplied ceiling fan in the living room. Existing light fixture box.',
    'completed',
    '2026-10-15 13:00-05',
    '2026-10-15 14:30-05'
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b4',
    '00000000-0000-0000-0002-0000000000b3',
    'Roof leak water stain',
    'Brown water stain spreading on the hallway ceiling after storms. Attic insulation is wet.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b4',
    NULL,
    'Drywall patch',
    'Patch and paint a fist-sized hole in the hallway drywall.',
    'scheduled',
    '2026-11-04 10:00-06',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b5',
    '00000000-0000-0000-0002-0000000000b1',
    'Toilet running constantly',
    'Upstairs toilet runs nonstop. Flapper likely worn. Water bill doubled last month.',
    'new',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b5',
    '00000000-0000-0000-0002-0000000000b2',
    'Breaker keeps tripping',
    'Kitchen circuit breaker trips when the microwave and toaster run together. May need a dedicated circuit.',
    'in_progress',
    '2026-10-25 16:00-05',
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b1',
    NULL,
    'Gutter cleaning',
    'Gutters overflowing at the front corner. Clean gutters and check downspouts.',
    'cancelled',
    NULL,
    NULL
  ),
  (
    '00000000-0000-0000-0000-00000000000b',
    '00000000-0000-0000-0001-0000000000b2',
    '00000000-0000-0000-0002-0000000000b3',
    'Flooded laundry room',
    'Washing machine hose burst. Standing water in the laundry room and hallway. Needs water extraction and drying.',
    'completed',
    '2026-10-01 07:30-05',
    '2026-10-03 17:00-05'
  );