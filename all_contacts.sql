WITH myv_contacts AS (
  -- Pull data for AZ
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'AZ' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsazsp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_az.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsazsp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsazsp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for PA
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'PA' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demspasp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_pa.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demspasp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demspasp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for GA
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'GA' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsgasp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_ga.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsgasp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsgasp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for NC
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'NC' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsncsp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_nc.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsncsp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsncsp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for NV
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'NV' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsnvsp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_nv.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsnvsp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsnvsp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for MI
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'MI' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsmisp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_mi.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsmisp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsmisp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only

  UNION ALL

  -- Pull data for OH
  SELECT 
    DISTINCT ccmyv.contacts_contact_id,
    'OH' AS state_code,
    ccmyv.myv_van_id,
    p.person_id,
    p.first_name,
    p.last_name,
    ccmyv.committee_id,
    com.committee_name,
    ccmyv.result_id,
    r.result_short_name,
    ccmyv.input_type_id,
    it.input_type_name,
    ccmyv.contact_type_id,
    ct.contact_type_name,
    ccmyv.canvassed_by_user_id,
    u.username AS canvassed_by_user_name,
    u.first_name AS canvasser_first_name,
    u.last_name AS canvasser_last_name,
    ccmyv.datetime_created,
    ccmyv.datetime_canvassed,
    ccmyv.datetime_modified
  FROM `demsohsp.vansync.contacts_contacts_myv` ccmyv
  LEFT JOIN `democrats.analytics_oh.person` p ON p.myv_van_id = ccmyv.myv_van_id
  LEFT JOIN `demsohsp.vansync.committees` com ON ccmyv.committee_id = com.committee_id 
  LEFT JOIN `democrats.vansync_ref.input_types` it ON it.input_type_id = ccmyv.input_type_id 
  LEFT JOIN `democrats.vansync_ref.contact_types` ct ON ct.contact_type_id = ccmyv.contact_type_id 
  LEFT JOIN `demsohsp.vansync.users` u ON ccmyv.canvassed_by_user_id = u.user_id
  LEFT JOIN `democrats.vansync_ref.results` r ON r.result_id = ccmyv.result_id 
  WHERE EXTRACT(YEAR FROM ccmyv.datetime_canvassed) IN (2016, 2020, 2022, 2024)
    AND EXTRACT(MONTH FROM ccmyv.datetime_canvassed) = 8 -- August data only
),

august_metrics AS (
  SELECT 
    CAST(EXTRACT(YEAR FROM datetime_canvassed) AS STRING) AS cycle, -- Cast year as STRING
    state_code,
    COUNT(DISTINCT CASE WHEN contact_type_name IN ('Phone', 'Distributed Call', 'Auto Dial') THEN contacts_contact_id ELSE NULL END) AS non_paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Call' THEN contacts_contact_id ELSE NULL END) AS paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Walk' THEN contacts_contact_id ELSE NULL END) AS non_paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Walk' THEN contacts_contact_id ELSE NULL END) AS paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'SMS Text' THEN contacts_contact_id ELSE NULL END) AS total_text
  FROM myv_contacts
  WHERE EXTRACT(MONTH FROM datetime_canvassed) = 8 -- August comparison
  GROUP BY cycle, state_code
),

cycle_to_date_metrics AS (
  SELECT 
    '2024_CTD' AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN contact_type_name IN ('Phone', 'Distributed Call', 'Auto Dial') THEN contacts_contact_id ELSE NULL END) AS non_paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Call' THEN contacts_contact_id ELSE NULL END) AS paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Walk' THEN contacts_contact_id ELSE NULL END) AS non_paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Walk' THEN contacts_contact_id ELSE NULL END) AS paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'SMS Text' THEN contacts_contact_id ELSE NULL END) AS total_text
  FROM myv_contacts
  WHERE datetime_canvassed BETWEEN '2023-01-01' AND '2024-08-31'
  GROUP BY state_code

  UNION ALL

  SELECT 
    '2022_CTD' AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN contact_type_name IN ('Phone', 'Distributed Call', 'Auto Dial') THEN contacts_contact_id ELSE NULL END) AS non_paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Call' THEN contacts_contact_id ELSE NULL END) AS paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Walk' THEN contacts_contact_id ELSE NULL END) AS non_paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Walk' THEN contacts_contact_id ELSE NULL END) AS paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'SMS Text' THEN contacts_contact_id ELSE NULL END) AS total_text
  FROM myv_contacts
  WHERE datetime_canvassed BETWEEN '2021-01-01' AND '2022-08-31'
  GROUP BY state_code

  UNION ALL

  SELECT 
    '2020_CTD' AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN contact_type_name IN ('Phone', 'Distributed Call', 'Auto Dial') THEN contacts_contact_id ELSE NULL END) AS non_paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Call' THEN contacts_contact_id ELSE NULL END) AS paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Walk' THEN contacts_contact_id ELSE NULL END) AS non_paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Walk' THEN contacts_contact_id ELSE NULL END) AS paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'SMS Text' THEN contacts_contact_id ELSE NULL END) AS total_text
  FROM myv_contacts
  WHERE datetime_canvassed BETWEEN '2019-01-01' AND '2020-08-31'
  GROUP BY state_code

  UNION ALL

  SELECT 
    '2016_CTD' AS cycle,
    state_code,
    COUNT(DISTINCT CASE WHEN contact_type_name IN ('Phone', 'Distributed Call', 'Auto Dial') THEN contacts_contact_id ELSE NULL END) AS non_paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Call' THEN contacts_contact_id ELSE NULL END) AS paid_phones,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Walk' THEN contacts_contact_id ELSE NULL END) AS non_paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'Paid Walk' THEN contacts_contact_id ELSE NULL END) AS paid_doors,
    COUNT(DISTINCT CASE WHEN contact_type_name = 'SMS Text' THEN contacts_contact_id ELSE NULL END) AS total_text
  FROM myv_contacts
  WHERE datetime_canvassed BETWEEN '2015-01-01' AND '2016-08-31'
  GROUP BY state_code
)

-- Combine metrics for August and Cycle-to-Date
SELECT *
FROM august_metrics

UNION ALL

SELECT *
FROM cycle_to_date_metrics
