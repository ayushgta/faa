- explore: _search_index_aircraft
  view: _search_index_aircraft

- view: _search_index_aircraft
  derived_table:
    sql: |
      (SELECT
        `aircraft.tail_number` AS string_value,
        'aircraft.tail_number' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.tail_num AS `aircraft.tail_number`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.tail_number`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.certification` AS string_value,
        'aircraft.certification' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.certification AS `aircraft.certification`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.certification`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.status_code` AS string_value,
        'aircraft.status_code' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.status_code AS `aircraft.status_code`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.status_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.aircraft_model_code` AS string_value,
        'aircraft.aircraft_model_code' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.aircraft_model_code AS `aircraft.aircraft_model_code`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.aircraft_model_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.mode_s_code` AS string_value,
        'aircraft.mode_s_code' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.mode_s_code AS `aircraft.mode_s_code`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.mode_s_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.fract_owner` AS string_value,
        'aircraft.fract_owner' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.fract_owner AS `aircraft.fract_owner`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.fract_owner`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.owner_name` AS string_value,
        'aircraft.owner_name' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.name AS `aircraft.owner_name`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.owner_name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.city` AS string_value,
        'aircraft.city' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.city AS `aircraft.city`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.city`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.state` AS string_value,
        'aircraft.state' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft.state AS `aircraft.state`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft
      WHERE LENGTH(`aircraft.state`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.aircraft_model_code` AS string_value,
        'aircraft_models.aircraft_model_code' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_models.aircraft_model_code AS `aircraft_models.aircraft_model_code`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.aircraft_model_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.manufacturer` AS string_value,
        'aircraft_models.manufacturer' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_models.manufacturer AS `aircraft_models.manufacturer`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.manufacturer`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.name` AS string_value,
        'aircraft_models.name' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_models.manufacturer AS `aircraft_models.manufacturer`,
        aircraft_models.model AS `aircraft_models.name`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1,2
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.amateur` AS string_value,
        'aircraft_models.amateur' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        CASE WHEN aircraft_models.amateur THEN 'Yes' ELSE 'No' END AS `aircraft_models.amateur`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.amateur`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.aircraft_type_id` AS string_value,
        'aircraft_models.aircraft_type_id' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_models.aircraft_type_id AS `aircraft_models.aircraft_type_id`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.aircraft_type_id`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_types.aircraft_type_id` AS string_value,
        'aircraft_types.aircraft_type_id' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_types.aircraft_type_id AS `aircraft_types.aircraft_type_id`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      LEFT JOIN aircraft_types ON aircraft_models.aircraft_type_id = aircraft_types.aircraft_type_id
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_types
      WHERE LENGTH(`aircraft_types.aircraft_type_id`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_types.description` AS string_value,
        'aircraft_types.description' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (SELECT 
        aircraft_types.description AS `aircraft_types.description`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      LEFT JOIN aircraft_types ON aircraft_models.aircraft_type_id = aircraft_types.aircraft_type_id
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_types
      WHERE LENGTH(`aircraft_types.description`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_flights_facts.tail_num` AS string_value,
        'aircraft_flights_facts.tail_num' as col,
        COUNT(*) as num_uses,
        SUM(`aircraft.count`) as importance
      FROM (-- use existing aircraft_flights_facts in ${aircraft_flights_facts.SQL_TABLE_NAME}
      SELECT 
        aircraft_flights_facts.tail_num AS `aircraft_flights_facts.tail_num`,
        COUNT(DISTINCT aircraft.tail_num) AS `aircraft.count`
      FROM aircraft
      LEFT JOIN ${aircraft_flights_facts.SQL_TABLE_NAME} AS aircraft_flights_facts ON aircraft.tail_num = aircraft_flights_facts.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(DISTINCT aircraft.tail_num) DESC) AS aircraft_flights_facts
      WHERE LENGTH(`aircraft_flights_facts.tail_num`) <= 40
      GROUP BY 1, 2)
      
    sql_trigger_value: SELECT CURDATE()
    indexes: string_value

  fields:
    - dimension: string_value

    - dimension: string_searchable
      case_sensitive: true
      sql: ${TABLE}.string_value

    - dimension: col

    - dimension: num_uses
      type: number

    - dimension: importance
      type: number
