
- view: airports
  fields:
    - dimension: code
      primary_key: true
      
    - dimension: city
    - dimension: state
    - dimension: full_name

    - dimension: facility_type
      sql: ${TABLE}.fac_type
    
    - dimension: control_tower
      type: yesno
      sql: ${TABLE}.cntl_twr = 'Y'
      
    - dimension: elevation
      type: number
    
    - measure: count
      type: count
      drill_fields: detail
      
    - measure: with_control_tower_count
      type: count
      drill_fields: detail
      filters:
        control_tower: Yes
        
    - measure: average_elevation
      type: average
      sql: ${elevation}
    
    - measure: max_elevation
      type: number
      sql: MAX(${elevation})
  
    - measure: min_elevation
      type: min # can I do this?
      sql: ${elevation}
      
    - dimension: elevation_tier
      type: tier
      sql: ${elevation}
      tiers: [0, 100, 250, 1000, 2000, 3000, 4000, 5000, 6000]
      
    - dimension: elevation_tier2
      type: tier
      sql: ${elevation}
      tiers: [0, 100, 5000, 6000]
      
    - dimension: elevation_range
      sql_case:
        High: ${elevation} > 8000
        Medium: ${elevation} BETWEEN 3000 and 7999
        else: Low
    
    - dimension: location
      type: location
      sql_longitude: ${TABLE}.longitude
      sql_latitude: ${TABLE}.latitude
      
  sets:
    detail: [code, city, state, full_name, control_tower, facility_type, location]