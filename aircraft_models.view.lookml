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
      drill_fields: aircraft_maker_detail* 

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
      drill_fields: detail*
      
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
      aircraft_models.count, origin.count, destination.count]

     
