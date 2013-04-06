
- view: aircraft
  sets:
    detail: [tail_number, aircraft_models.detail* plane_year,]
    export: [plane_year, tail_number, aircraft_models.detail*, count]

  fields:
    - name: tail_number
      sql: $$.tail_num 

    - name: plane_year
      type: int
      sql: aircraft.year_built+0    # defeat the JDBC automatic conversion to date because of the word 'year'
    
    - name: had_incident
      type: yesno
      sql: |
        (
          SELECT event_id 
          FROM accidents 
          WHERE aircraft.tail_num=accidents.registration_number 
          LIMIT 1)
    
    - name: count
      type: count_distinct
      sets:
        - origin.detail
        - destination.detail
        - carriers.detail
        - models_detail
      sql: $$.tail_num
      detail: detail

    - name: certification
            
    - name: status_code
    - name: mode_s_code
    - name: fract_owner
    - name: owner_name
      sql: $$.name      
    - name: city
    - name: state
      
    - join: aircraft_models
      using: aircraft_model_code
      
- view: aircraft_models
  sets:
    detail: [name, manufacturer, seats, engines, count]
    aircraft_maker_detail: [manufacturer, flights.count, carriers.count,
      aircraft_models.count, origin.count, destinaiton.count]
  fields:
    - name: manufacturer

    - name: manufacturer_count
      type: count_distinct
      sets:
        - carriers.detail
      sql: $$.manufacturer
      detail: aircraft_maker_detail 

      # show how to create a like to google.
    - name: name
      sql: $$.model
      required_fields: [manufacturer]
      html: |
          <%= linked_value %> 
          <% if row["manufacturer"] %>
            <a href='http://www.google.com/search?q=<%= 
              row["aircraft_models.manufacturer"] + "+" + value 
            %>'>
            <img src=http://www.google.com/favicon.ico></a>
          <% end %>

    - name: seats
      type: number

    - name: count
      type: count_distinct
      sets:
        - origin.detail
        - destination.detail
        - carriers.detail
        - models_detail
      sql: $$.model
      detail: detail
      
    - name: engines
      type: number

    - name: amateur
      type: yesno
      sql: $$.amateur

    - name: weight
      type: number

    - join: aircraft_types
      sql_on: $$.aircraft_type_id = aircraft_types.aircraft_type_id
      
- view: aircraft_types
  label: AIRCRAFT MODELS
  fields:
    - name: description