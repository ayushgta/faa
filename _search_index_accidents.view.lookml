- explore: _search_index_accidents
  view: _search_index_accidents

- view: _search_index_accidents
  derived_table:
    sql: |
      (SELECT
        `accidents.event_id` AS string_value,
        'accidents.event_id' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.event_id AS `accidents.event_id`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.registration_number` AS string_value,
        'accidents.registration_number' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.registration_number AS `accidents.registration_number`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.investigation_type` AS string_value,
        'accidents.investigation_type' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.investigation_type AS `accidents.investigation_type`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.event_day_of_week` AS string_value,
        'accidents.event_day_of_week' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        DATE_FORMAT(event_date,'%W') AS `accidents.event_day_of_week`,
        MOD((DAYOFWEEK(event_date) - 1) - 1 + 7, 7) AS `accidents.event_day_of_week_index`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1,2
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.one_off_or_multi` AS string_value,
        'accidents.one_off_or_multi' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        (SELECT IF(COUNT(*) > 1, "Multi", "One off") 
       FROM accidents a 
       WHERE a.model=accidents.model)
       AS `accidents.one_off_or_multi`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.location` AS string_value,
        'accidents.location' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.location AS `accidents.location`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.country` AS string_value,
        'accidents.country' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.country AS `accidents.country`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.coordinates` AS string_value,
        'accidents.coordinates' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        CASE WHEN CASE WHEN accidents.latitude != '' THEN CAST(accidents.latitude AS DECIMAL(10, 5)) ELSE NULL END IS NOT NULL AND CASE WHEN accidents.longitude != '' THEN CAST(accidents.longitude AS DECIMAL(10, 5)) ELSE NULL END IS NOT NULL THEN CAST(CONCAT(
      COALESCE(CASE WHEN accidents.latitude != '' THEN CAST(accidents.latitude AS DECIMAL(10, 5)) ELSE NULL END,''),',',
      COALESCE(CASE WHEN accidents.longitude != '' THEN CAST(accidents.longitude AS DECIMAL(10, 5)) ELSE NULL END,'')) AS CHAR) ELSE NULL END AS `accidents.coordinates`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.airport_code` AS string_value,
        'accidents.airport_code' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.airport_code AS `accidents.airport_code`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.airport_name` AS string_value,
        'accidents.airport_name' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.airport_name AS `accidents.airport_name`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.injury_severity` AS string_value,
        'accidents.injury_severity' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.injury_severity AS `accidents.injury_severity`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.aircraft_damage` AS string_value,
        'accidents.aircraft_damage' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.aircraft_damage AS `accidents.aircraft_damage`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.aircraft_category` AS string_value,
        'accidents.aircraft_category' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.aircraft_category AS `accidents.aircraft_category`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.engine_type` AS string_value,
        'accidents.engine_type' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.engine_type AS `accidents.engine_type`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.far_description` AS string_value,
        'accidents.far_description' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.far_description AS `accidents.far_description`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.schedule` AS string_value,
        'accidents.schedule' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.schedule AS `accidents.schedule`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.purpose_of_flight` AS string_value,
        'accidents.purpose_of_flight' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.purpose_of_flight AS `accidents.purpose_of_flight`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.air_carrier` AS string_value,
        'accidents.air_carrier' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        TRIM(accidents.air_carrier) AS `accidents.air_carrier`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.weather_condition` AS string_value,
        'accidents.weather_condition' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.weather_condition AS `accidents.weather_condition`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.broad_phase_of_flight` AS string_value,
        'accidents.broad_phase_of_flight' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.broad_phase_of_flight AS `accidents.broad_phase_of_flight`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.report_status` AS string_value,
        'accidents.report_status' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.report_status AS `accidents.report_status`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.publication_date` AS string_value,
        'accidents.publication_date' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        accidents.publication_date AS `accidents.publication_date`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `accidents.amateur_built` AS string_value,
        'accidents.amateur_built' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        CASE WHEN amateur_built = "Yes" THEN 'Yes' ELSE 'No' END AS `accidents.amateur_built`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS accidents
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.tail_number` AS string_value,
        'aircraft.tail_number' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.tail_num AS `aircraft.tail_number`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.certification` AS string_value,
        'aircraft.certification' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.certification AS `aircraft.certification`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.status_code` AS string_value,
        'aircraft.status_code' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.status_code AS `aircraft.status_code`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.aircraft_model_code` AS string_value,
        'aircraft.aircraft_model_code' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.aircraft_model_code AS `aircraft.aircraft_model_code`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.mode_s_code` AS string_value,
        'aircraft.mode_s_code' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.mode_s_code AS `aircraft.mode_s_code`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.fract_owner` AS string_value,
        'aircraft.fract_owner' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.fract_owner AS `aircraft.fract_owner`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.owner_name` AS string_value,
        'aircraft.owner_name' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.name AS `aircraft.owner_name`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.city` AS string_value,
        'aircraft.city' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.city AS `aircraft.city`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
        UNION ALL
      (SELECT
        `aircraft.state` AS string_value,
        'aircraft.state' as col,
        COUNT(*) as num_uses,
        SUM(`accidents.count`) as importance
      FROM (SELECT 
        aircraft.state AS `aircraft.state`,
        COUNT(*) AS `accidents.count`
      FROM accidents
      LEFT JOIN aircraft ON accidents.registration_number = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      GROUP BY 1, 2)
      
    persist_for: 48 hours
    indexes: string_value

  fields:
    - dimension: string_value

    - dimension: string_searchable
      sql: ${TABLE}.string_value

    - dimension: col

    - dimension: num_uses
      type: number

    - dimension: importance
      type: number

