
- view: aircraft

  fields:
    - dimension: city
    - dimension: state
    - dimension: aircraft_model_code
    - dimension: certification
    - dimension: fract_owner
    - dimension: mode_s_code
    - dimension: status_code
    
    - dimension: tail_number
      sql: ${TABLE}.tail_num
    
    - dimension: owner_name
      sql: ${TABLE}.name
      
#     - dimension: had_incident
#       type: yesno
#       sql: |
#         (
#           SELECT event_id
#           FROM accidents
#           WHERE aircraft.tail_num=accidents.registration_number
#           LIMIT 1)
#       
    - dimension: plane_year
      type: int
      sql: ${TABLE}.year_built+0