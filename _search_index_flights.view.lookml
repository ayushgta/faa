- explore: _search_index_flights
  view: _search_index_flights

- view: _search_index_flights
  derived_table:
    sql: |
      (SELECT
        `flights.tail_num` AS string_value,
        'flights.tail_num' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.tail_num AS `flights.tail_num`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.tail_num`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.depart_day_of_week` AS string_value,
        'flights.depart_day_of_week' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        DATE_FORMAT(flights.dep_time,'%W') AS `flights.depart_day_of_week`,
        MOD((DAYOFWEEK(flights.dep_time) - 1) - 1 + 7, 7) AS `flights.depart_day_of_week_index`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1,2
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.depart_day_of_week`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.depart_time_of_day` AS string_value,
        'flights.depart_time_of_day' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        DATE_FORMAT(flights.dep_time,'%H:%i') AS `flights.depart_time_of_day`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.depart_time_of_day`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.date_filter_test` AS string_value,
        'flights.date_filter_test' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN ((1=1 -- no filter on 'flights.date_filter' 
       OR NULL
      )) THEN 'Yes' ELSE 'No' END AS `flights.date_filter_test`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.date_filter_test`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.day_of_week_depart` AS string_value,
        'flights.day_of_week_depart' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        (DATE_FORMAT(flights.dep_time,'%W')) AS `flights.day_of_week_depart`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.day_of_week_depart`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.intended_depart_day_of_week` AS string_value,
        'flights.intended_depart_day_of_week' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        DATE_FORMAT(DATEADD(min, -flights.dep_delay, flights.dep_time),'%W') AS `flights.intended_depart_day_of_week`,
        MOD((DAYOFWEEK(DATEADD(min, -flights.dep_delay, flights.dep_time)) - 1) - 1 + 7, 7) AS `flights.intended_depart_day_of_week_index`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1,2
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.intended_depart_day_of_week`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.intended_depart_time_of_day` AS string_value,
        'flights.intended_depart_time_of_day' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        DATE_FORMAT(DATEADD(min, -flights.dep_delay, flights.dep_time),'%H:%i') AS `flights.intended_depart_time_of_day`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.intended_depart_time_of_day`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.origin` AS string_value,
        'flights.origin' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.origin AS `flights.origin`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.origin`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.destination` AS string_value,
        'flights.destination' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.destination AS `flights.destination`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.destination`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.route` AS string_value,
        'flights.route' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.origin ||'-->'|| flights.destination AS `flights.route`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.route`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.carrier` AS string_value,
        'flights.carrier' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.carrier AS `flights.carrier`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.carrier`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.flight_number` AS string_value,
        'flights.flight_number' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        flights.carrier || flights.flight_num AS `flights.flight_number`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.flight_number`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `flights.cancelled` AS string_value,
        'flights.cancelled' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN CASE
      WHEN flights.cancelled='Y' THEN 'Cancelled' 
      WHEN flights.diverted='Y' THEN 'Diverted' 
      WHEN flights.arr_delay > 60 THEN 'Very Late' 
      WHEN flights.arr_delay BETWEEN -10 and 10 THEN 'OnTime' 
      WHEN flights.arr_delay > 10 THEN 'Late' 
      ELSE 'Early' 
      END = 'Cancelled' THEN 'Yes' ELSE 'No' END AS `flights.cancelled`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS flights
      WHERE LENGTH(`flights.cancelled`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `carriers.code` AS string_value,
        'carriers.code' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN carriers.code IS NULL THEN 'No Carrier'
      ELSE carriers.code
      END
       AS `carriers.code`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN carriers ON flights.carrier = CASE WHEN carriers.code IS NULL THEN 'No Carrier'
      ELSE carriers.code
      END
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS carriers
      WHERE LENGTH(`carriers.code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `carriers.name` AS string_value,
        'carriers.name' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        TRIM(carriers.nickname) AS `carriers.name`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN carriers ON flights.carrier = CASE WHEN carriers.code IS NULL THEN 'No Carrier'
      ELSE carriers.code
      END
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS carriers
      WHERE LENGTH(`carriers.name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `origin.code` AS string_value,
        'origin.code' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        origin.code AS `origin.code`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS origin ON flights.origin = origin.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS origin
      WHERE LENGTH(`origin.code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `origin.city` AS string_value,
        'origin.city' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        origin.city AS `origin.city`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS origin ON flights.origin = origin.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS origin
      WHERE LENGTH(`origin.city`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `origin.state` AS string_value,
        'origin.state' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        origin.state AS `origin.state`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS origin ON flights.origin = origin.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS origin
      WHERE LENGTH(`origin.state`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `origin.full_name` AS string_value,
        'origin.full_name' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        origin.full_name AS `origin.full_name`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS origin ON flights.origin = origin.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS origin
      WHERE LENGTH(`origin.full_name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `origin.location` AS string_value,
        'origin.location' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN origin.latitude IS NOT NULL AND origin.longitude IS NOT NULL THEN CAST(CONCAT(
      COALESCE(origin.latitude,''),',',
      COALESCE(origin.longitude,'')) AS CHAR) ELSE NULL END AS `origin.location`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS origin ON flights.origin = origin.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS origin
      WHERE LENGTH(`origin.location`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `destination.code` AS string_value,
        'destination.code' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        destination.code AS `destination.code`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS destination ON flights.destination = destination.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS destination
      WHERE LENGTH(`destination.code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `destination.city` AS string_value,
        'destination.city' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        destination.city AS `destination.city`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS destination ON flights.destination = destination.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS destination
      WHERE LENGTH(`destination.city`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `destination.state` AS string_value,
        'destination.state' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        destination.state AS `destination.state`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS destination ON flights.destination = destination.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS destination
      WHERE LENGTH(`destination.state`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `destination.full_name` AS string_value,
        'destination.full_name' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        destination.full_name AS `destination.full_name`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS destination ON flights.destination = destination.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS destination
      WHERE LENGTH(`destination.full_name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `destination.location` AS string_value,
        'destination.location' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN destination.latitude IS NOT NULL AND destination.longitude IS NOT NULL THEN CAST(CONCAT(
      COALESCE(destination.latitude,''),',',
      COALESCE(destination.longitude,'')) AS CHAR) ELSE NULL END AS `destination.location`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${commercial_airports.SQL_TABLE_NAME} AS destination ON flights.destination = destination.code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS destination
      WHERE LENGTH(`destination.location`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.tail_number` AS string_value,
        'aircraft.tail_number' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft.tail_num AS `aircraft.tail_number`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      WHERE LENGTH(`aircraft.tail_number`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft.aircraft_model_code` AS string_value,
        'aircraft.aircraft_model_code' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft.aircraft_model_code AS `aircraft.aircraft_model_code`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft
      WHERE LENGTH(`aircraft.aircraft_model_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_flights_facts.tail_num` AS string_value,
        'aircraft_flights_facts.tail_num' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      -- use existing aircraft_flights_facts in ${aircraft_flights_facts.SQL_TABLE_NAME}
      SELECT 
        aircraft_flights_facts.tail_num AS `aircraft_flights_facts.tail_num`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN ${aircraft_flights_facts.SQL_TABLE_NAME} AS aircraft_flights_facts ON flights.tail_num = aircraft_flights_facts.tail_num
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_flights_facts
      WHERE LENGTH(`aircraft_flights_facts.tail_num`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.aircraft_model_code` AS string_value,
        'aircraft_models.aircraft_model_code' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_models.aircraft_model_code AS `aircraft_models.aircraft_model_code`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.aircraft_model_code`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.manufacturer` AS string_value,
        'aircraft_models.manufacturer' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_models.manufacturer AS `aircraft_models.manufacturer`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.manufacturer`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.name` AS string_value,
        'aircraft_models.name' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_models.manufacturer AS `aircraft_models.manufacturer`,
        aircraft_models.model AS `aircraft_models.name`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1,2
      ORDER BY COUNT(*) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.name`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.amateur` AS string_value,
        'aircraft_models.amateur' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        CASE WHEN aircraft_models.amateur THEN 'Yes' ELSE 'No' END AS `aircraft_models.amateur`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.amateur`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_models.aircraft_type_id` AS string_value,
        'aircraft_models.aircraft_type_id' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_models.aircraft_type_id AS `aircraft_models.aircraft_type_id`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_models
      WHERE LENGTH(`aircraft_models.aircraft_type_id`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_types.aircraft_type_id` AS string_value,
        'aircraft_types.aircraft_type_id' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_types.aircraft_type_id AS `aircraft_types.aircraft_type_id`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      LEFT JOIN aircraft_types ON aircraft_models.aircraft_type_id = aircraft_types.aircraft_type_id
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_types
      WHERE LENGTH(`aircraft_types.aircraft_type_id`) <= 40
      GROUP BY 1, 2)
       UNION ALL (SELECT
        `aircraft_types.description` AS string_value,
        'aircraft_types.description' as col,
        COUNT(*) as num_uses,
        SUM(`flights.count`) as importance
      FROM (
      SELECT 
        aircraft_types.description AS `aircraft_types.description`,
        COUNT(*) AS `flights.count`
      FROM ${flights.SQL_TABLE_NAME} AS flights
      LEFT JOIN tmp.aircraft AS aircraft ON flights.tail_num = aircraft.tail_num
      LEFT JOIN aircraft_models ON aircraft.aircraft_model_code = aircraft_models.aircraft_model_code
      LEFT JOIN aircraft_types ON aircraft_models.aircraft_type_id = aircraft_types.aircraft_type_id
      
      GROUP BY 1
      ORDER BY COUNT(*) DESC) AS aircraft_types
      WHERE LENGTH(`aircraft_types.description`) <= 40
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
