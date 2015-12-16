
- view: aircraft
  fields:
    - dimension: tail_number
      sql: ${TABLE}.tail_num 
      primary_key: true

    - dimension: plane_year
      type: int
      sql: aircraft.year_built+0    # defeat the JDBC automatic conversion to date because of the word 'year'
    
#     - dimension: had_incident
#       type: yesno
#       sql: |
#         (
#           SELECT event_id 
#           FROM accidents 
#           WHERE aircraft.tail_num=accidents.registration_number 
#           LIMIT 1)
    
    - measure: count
      type: count_distinct
      sql: ${TABLE}.tail_num
      drill_fields: detail*

    - dimension: certification
            
    - dimension: status_code
    - dimension: aircraft_model_code
    - dimension: mode_s_code
    - dimension: fract_owner
    - dimension: owner_name
      sql: ${TABLE}.name      
    - dimension: city
    - dimension: state
      
  sets:
    detail: [tail_number, aircraft_models.detail*, plane_year]
    export: [plane_year, tail_number, count, aircraft_model_code]



    
    
    
    
