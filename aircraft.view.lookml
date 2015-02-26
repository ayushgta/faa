- view: aircraft
  fields:
    - dimension: tail_number
      sql: ${TABLE}.tail_num 
      primary_key: true

    - dimension: plane_year
      type: int
      sql: aircraft.year_built+0    # defeat the JDBC automatic conversion to date because of the word 'year'
    
    - dimension: had_incident
      type: yesno
      sql: |
        (
          SELECT event_id 
          FROM accidents 
          WHERE aircraft.tail_num=accidents.registration_number 
          LIMIT 1)
    
    - measure: count
      type: count_distinct
      sql: ${TABLE}.tail_num
      drill_fields: detail

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
    detail: [tail_number, aircraft_models.detail* plane_year,]
    export: [plane_year, tail_number, count, aircraft_model_code]


- view: aircraft_models
  fields:
    - dimension: aircraft_model_code
      primary_key: true
      
    - dimension: manufacturer

    - measure: manufacturer_count
      type: count_distinct
      sets:
        - carriers.detail
      sql: ${TABLE}.manufacturer
      drill_fields: aircraft_maker_detail 

      # show how to create a link to google.
    - dimension: name
      sql: ${TABLE}.model
      required_fields: [manufacturer]
      html: |
        {{ linked_value }}
        {% if value %}
          <a style="color:#bbb;float:right;" target="_blank" href='http://www.google.com/search?q={{row["aircraft_models.manufacturer"]}}+{{value}}'>
            Google
          </a>
        {% endif %}

    - dimension: seats
      type: number

    - measure: count
      type: count_distinct
      sql: ${TABLE}.model
      drill_fields: detail
      
    - dimension: engines
      type: number

    - dimension: amateur
      type: yesno
      sql: ${TABLE}.amateur

    - dimension: weight
      type: number
      
    - dimension: aircraft_type_id

  sets:
    detail: [name, manufacturer, seats, engines, count]
    aircraft_maker_detail: [manufacturer, flights.count, carriers.count,
      aircraft_models.count, origin.count, destinaiton.count]

     
- view: aircraft_types
  label: AIRCRAFT MODELS
  fields:
    - dimension: aircraft_type_id
      primary_key: true
    - dimension: description
    
    
    
    