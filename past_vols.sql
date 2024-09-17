-- Begin SQL Query

-- Define the coordinated committee IDs
WITH coordinated_committees AS (
  SELECT '54746' AS committee_id UNION ALL  -- 2016 Coordinated
  SELECT '81204' UNION ALL                 -- 2020 Coordinated
  SELECT '91632' UNION ALL                 -- 2022 Coordinated
  SELECT '101249' UNION ALL                -- 2022 Coordinated - PAID
  SELECT '107800' UNION ALL                -- 2024 Coordinated
  SELECT '107801'                          -- 2024 Coordinated - PAID
),

events_all_states AS (
  -- Pull data for AZ
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/Phoenix') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'AZ' AS state_code
  FROM `demsazsp.vansync.event_signups` es
  LEFT JOIN `demsazsp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsazsp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsazsp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsazsp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsazsp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsazsp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsazsp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsazsp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsazsp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsazsp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsazsp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/Phoenix') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for GA
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'GA' AS state_code
  FROM `demsgasp.vansync.event_signups` es
  LEFT JOIN `demsgasp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsgasp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsgasp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsgasp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsgasp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsgasp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsgasp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsgasp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsgasp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsgasp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsgasp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for NC
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'NC' AS state_code
  FROM `demsncsp.vansync.event_signups` es
  LEFT JOIN `demsncsp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsncsp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsncsp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsncsp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsncsp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsncsp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsncsp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsncsp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsncsp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsncsp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsncsp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for NV
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/Los_Angeles') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'NV' AS state_code
  FROM `demsnvsp.vansync.event_signups` es
  LEFT JOIN `demsnvsp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsnvsp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsnvsp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsnvsp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsnvsp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsnvsp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsnvsp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsnvsp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsnvsp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsnvsp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsnvsp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/Los_Angeles') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for MI
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'MI' AS state_code
  FROM `demsmisp.vansync.event_signups` es
  LEFT JOIN `demsmisp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsmisp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsmisp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsmisp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsmisp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsmisp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsmisp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsmisp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsmisp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsmisp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsmisp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for OH
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'OH' AS state_code
  FROM `demsohsp.vansync.event_signups` es
  LEFT JOIN `demsohsp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demsohsp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demsohsp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demsohsp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demsohsp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demsohsp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demsohsp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demsohsp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demsohsp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demsohsp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demsohsp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'

  UNION ALL

  -- Pull data for PA
  SELECT
    es.event_signup_id,
    es.myc_van_id,
    pr.myv_van_id,
    pr.first_name,
    pr.last_name,
    cp.phone_number,
    cp.phone_type_id,
    ce.email,
    pr.contacts_address_id,
    camyc.address,
    camyc.city,
    camyc.zip,
    es.event_id,
    e.event_name,
    e.event_type_id,
    et.event_type_name,
    es.event_role_id,
    er.event_role_name,
    es.event_shift_id,
    esh.event_shift_name,
    ess.event_status_id,
    esref.event_status_name,
    ess.datetime_modified AS datetime_status_modified,
    CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) AS event_date,
    es.location_id,
    l.location_name,
    es.created_by_committee_id,
    c.committee_name,
    'PA' AS state_code
  FROM `demspasp.vansync.event_signups` es
  LEFT JOIN `demspasp.vansync.person_records_myc` pr ON pr.myc_van_id = es.myc_van_id
  LEFT JOIN `demspasp.vansync.contacts_phones_myc` cp ON cp.contacts_phone_id = pr.phone_id
  LEFT JOIN `demspasp.vansync.contacts_emails_myc` ce ON ce.contacts_email_id = pr.email_id
  LEFT JOIN `demspasp.vansync.events` e ON e.event_id = es.event_id
  LEFT JOIN `demspasp.vansync.event_types` et ON et.event_type_id = e.event_type_id
  LEFT JOIN `demspasp.vansync.event_roles` er ON er.event_role_id = es.event_role_id
  LEFT JOIN `demspasp.vansync.event_shifts` esh ON esh.event_shift_id = es.event_shift_id
  LEFT JOIN `demspasp.vansync.event_signups_statuses` ess ON es.current_event_signups_event_status_id = ess.event_signups_event_status_id
  LEFT JOIN `democrats.vansync_ref.event_statuses` esref ON esref.event_status_id = ess.event_status_id
  LEFT JOIN `demspasp.vansync.locations` l ON l.location_id = es.location_id
  LEFT JOIN `demspasp.vansync.committees` c ON c.committee_id = es.created_by_committee_id
  LEFT JOIN `demspasp.vansync.contacts_addresses_myc` camyc ON camyc.contacts_address_id = pr.contacts_address_id
  WHERE es.datetime_suppressed IS NULL
    AND CAST(DATETIME(es.datetime_offset_begin, 'America/New_York') AS DATE) BETWEEN '2015-01-01' AND '2024-08-31'
),

-- Metrics Calculation
volunteer_metrics AS (
  -- August Metrics
  SELECT
    CAST(EXTRACT(YEAR FROM event_date) AS STRING) AS cycle,
    state_code,
    'August' AS date_range,
    COUNT(DISTINCT CASE WHEN event_role_name IN ('Phonebanker', 'Texter', 'Canvasser', 'Dialer', 'Canvassing', 'Voter Registration')
                        AND event_status_name = 'Completed' THEN event_shift_id END) AS total_vol_shifts,
    COUNT(DISTINCT CASE WHEN event_role_name IN ('Phonebanker', 'Texter', 'Canvasser', 'Dialer', 'Canvassing', 'Voter Registration')
                        AND created_by_committee_id IN (SELECT committee_id FROM coordinated_committees)
                        AND event_status_name = 'Completed' THEN event_shift_id END) AS coordinated_vol_shifts
  FROM events_all_states
  WHERE EXTRACT(MONTH FROM event_date) = 8  -- August data
    AND EXTRACT(YEAR FROM event_date) IN (2016, 2020, 2022, 2024)
  GROUP BY cycle, state_code, date_range

  UNION ALL

  -- Cycle-to-Date Metrics
  SELECT
    CASE
      WHEN EXTRACT(YEAR FROM event_date) = 2016 THEN '2016_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2020 THEN '2020_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2022 THEN '2022_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2024 THEN '2024_CTD'
    END AS cycle,
    state_code,
    'Cycle-to-Date' AS date_range,
    COUNT(DISTINCT CASE WHEN event_role_name IN ('Phonebanker', 'Texter', 'Canvasser', 'Dialer', 'Canvassing', 'Voter Registration')
                        AND event_status_name = 'Completed' THEN event_shift_id END) AS total_vol_shifts,
    COUNT(DISTINCT CASE WHEN event_role_name IN ('Phonebanker', 'Texter', 'Canvasser', 'Dialer', 'Canvassing', 'Voter Registration')
                        AND created_by_committee_id IN (SELECT committee_id FROM coordinated_committees)
                        AND event_status_name = 'Completed' THEN event_shift_id END) AS coordinated_vol_shifts
  FROM events_all_states
  WHERE (
    (EXTRACT(YEAR FROM event_date) = 2016 AND event_date BETWEEN '2015-01-01' AND '2016-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2020 AND event_date BETWEEN '2019-01-01' AND '2020-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2022 AND event_date BETWEEN '2021-01-01' AND '2022-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2024 AND event_date BETWEEN '2023-01-01' AND '2024-08-31')
  )
  GROUP BY cycle, state_code, date_range
)

-- Final Output
SELECT
  cycle,
  state_code,
  date_range,
  total_vol_shifts,
  coordinated_vol_shifts,
  (total_vol_shifts - coordinated_vol_shifts) AS non_coordinated_vol_shifts
FROM volunteer_metrics
ORDER BY cycle, state_code, date_range

-- End of SQL Query
