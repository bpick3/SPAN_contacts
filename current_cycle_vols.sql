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

volunteer_shifts AS (
  -- Pull data for AZ
  SELECT
    'AZ' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsazsp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for GA
  SELECT
    'GA' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsgasp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for NC
  SELECT
    'NC' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsncsp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for NV
  SELECT
    'NV' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsnvsp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for MI
  SELECT
    'MI' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsmisp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for OH
  SELECT
    'OH' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demsohsp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024

  UNION ALL

  -- Pull data for PA
  SELECT
    'PA' AS state_code,
    va.shift_id,
    va.event_date,
    va.volunteer_activity_name,
    va.committee_id,
    va.mrr_status_name
  FROM `demspasp.vansync_derived.event_attendees` va
  WHERE EXTRACT(YEAR FROM va.event_date) BETWEEN 2015 AND 2024
),

-- August Metrics
august_metrics AS (
  SELECT
    CAST(EXTRACT(YEAR FROM event_date) AS STRING) AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN volunteer_activity_name IN ('Phonebanker','Texter','Canvasser','Dialer','Canvassing','Voter Registration') 
      AND mrr_status_name = 'Completed' THEN shift_id END) AS total_vol_shifts,
    COUNT(DISTINCT CASE WHEN volunteer_activity_name IN ('Phonebanker','Texter','Canvasser','Dialer','Canvassing','Voter Registration') 
      AND committee_id IN (SELECT committee_id FROM coordinated_committees)
      AND mrr_status_name = 'Completed' THEN shift_id END) AS coordinated_vol_shifts
  FROM volunteer_shifts
  WHERE EXTRACT(MONTH FROM event_date) = 8  -- August data
    AND EXTRACT(YEAR FROM event_date) IN (2016, 2020, 2022, 2024)
  GROUP BY cycle, state_code
),

-- Cycle-to-Date Metrics
cycle_to_date_metrics AS (
  SELECT
    CASE
      WHEN EXTRACT(YEAR FROM event_date) = 2016 THEN '2016_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2020 THEN '2020_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2022 THEN '2022_CTD'
      WHEN EXTRACT(YEAR FROM event_date) = 2024 THEN '2024_CTD'
    END AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN volunteer_activity_name IN ('Phonebanker','Texter','Canvasser','Dialer','Canvassing','Voter Registration') 
      AND mrr_status_name = 'Completed' THEN shift_id END) AS total_vol_shifts,
    COUNT(DISTINCT CASE WHEN volunteer_activity_name IN ('Phonebanker','Texter','Canvasser','Dialer','Canvassing','Voter Registration') 
      AND committee_id IN (SELECT committee_id FROM coordinated_committees)
      AND mrr_status_name = 'Completed' THEN shift_id END) AS coordinated_vol_shifts
  FROM volunteer_shifts
  WHERE (
    (EXTRACT(YEAR FROM event_date) = 2016 AND event_date BETWEEN '2015-01-01' AND '2016-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2020 AND event_date BETWEEN '2019-01-01' AND '2020-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2022 AND event_date BETWEEN '2021-01-01' AND '2022-08-31') OR
    (EXTRACT(YEAR FROM event_date) = 2024 AND event_date BETWEEN '2023-01-01' AND '2024-08-31')
  )
  GROUP BY cycle, state_code
),

-- Combine August and Cycle-to-Date Metrics
all_metrics AS (
  SELECT * FROM august_metrics
  UNION ALL
  SELECT * FROM cycle_to_date_metrics
)

-- Final Output
SELECT
  cycle,
  state_code,
  total_vol_shifts,
  coordinated_vol_shifts,
  (total_vol_shifts - coordinated_vol_shifts) AS non_coordinated_vol_shifts
FROM all_metrics
ORDER BY cycle, state_code

-- End of SQL Query
