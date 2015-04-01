- view: commercial_airports
  derived_table:
    persist_for: 500 hours
    sortkeys: [code]
    sql:
      WITH codes AS (
        SELECT DISTINCT origin AS code FROM flights
      )
      SELECT airports.code, city, state, full_name, longitude, latitude 
      FROM airports
      JOIN codes ON codes.code=airports.code
      WHERE codes.code IS NOT NULL
  fields:
    - dimension: code                   # sql defaults to ${TABLE}.code  
      primary_key: true
      
    - dimension: city                   # sql defaults to ${TABLE}.city
    - dimension: state
    - dimension: full_name
    
    - dimension: location
      type: location
      sql_longitude: ${TABLE}.longitude
      sql_latitude: ${TABLE}.latitude
      
    - measure: count
      type: count
      drill_fields: [code, city, state, full_name, flights.count]
 