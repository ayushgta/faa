- view: accidents
  fields:
    
    - dimension: event_id
      primary_key: true
     # html: |
    #    {{ linked_value }}
    #    <a href="http://www.ntsb.gov/aviationquery/brief.aspx?ev_id={{ value }}" >
    #       <img src=/images/arrow-black-right.png></a>

    - dimension: registration_number
    - dimension: investigation_type
      
    - dimension_group: event
      type: time
      timeframes: [time, date, day_of_week, week, month, month_num, year]
      sql: event_date

    - dimension: severity
      sql_case: 
        Incident: |
            ${number_fatal_injuries} 
            + ${number_serious_injuries} + ${number_minor_injuries} = 0
        Minor: ${number_fatal_injuries} + ${number_serious_injuries} = 0
        Serious: ${number_fatal_injuries} = 0
        else: Fatal
      
    - dimension: number_injured
      type: number
      sql: ${number_serious_injuries} + ${number_minor_injuries}
    
    - dimension: uninjured
      sql: ${TABLE}.number_of_uninjured

    - dimension: number_fatal_injuries
      type: number
      sql: NULLIF(${TABLE}.number_of_fatalities, '')
#       sql: ${TABLE}.number_of_fatalities
    
    - dimension: number_serious_injuries
      type: number
      sql: ${TABLE}.number_of_serious_injuries

    - dimension: number_minor_injuries
      type: number
      sql: ${TABLE}.number_of_minor_injuries


    # Is there more than one model of this aircraft?
    - dimension: one_off_or_multi
      sql: |
        (SELECT IF(COUNT(*) > 1, "Multi", "One off") 
         FROM accidents a 
         WHERE a.model=accidents.model)
    
    - dimension: location
    - dimension: country

    - dimension: latitude
      type: number
      value_format_name: decimal_4
#       hidden: true

    - dimension: longitude
      type: number
      value_format_name: decimal_4
#       hidden: true
      
    - dimension: coordinates
      type: location
      sql_latitude: CASE WHEN ${TABLE}.latitude != '' THEN ${TABLE}.latitude::float ELSE NULL END
      sql_longitude: CASE WHEN ${TABLE}.longitude != '' THEN ${TABLE}.longitude::float ELSE NULL END

    - dimension: airport_code      
    - dimension: airport_name
    - dimension: injury_severity
    - dimension: aircraft_damage
    - dimension: aircraft_category
    - dimension: number_of_engines
    - dimension: engine_type
    - dimension: far_description      
    - dimension: schedule
    - dimension: purpose_of_flight
    - dimension: air_carrier
      sql: TRIM(${TABLE}.air_carrier)
    - dimension: weather_condition
    - dimension: broad_phase_of_flight
    - dimension: report_status
    - dimension: publication_date

    - dimension: amateur_built
      type: yesno
      sql: amateur_built = 'Yes'
      
    - measure: total_fatalities
      label: Total Fatalities
      type: sum
      sql: ${number_fatal_injuries}
      
    - measure: total_injured
      type: sum
      sql: ${number_injured}

    - measure: total_uninjured
      type: sum
      sql: ${uninjured}

    - measure: count
      type: count
      drill_fields: detail*

    - measure: amateur_built_count
      type: count
      filters: 
        amateur_built: "Yes"
      drill_fields: detail*

    - measure: country_count
      type: count_distinct
      sql: ${country}
      drill_fields: {base: [country, count, total_fatalities]}
  
    - measure: percent_amateur_built
      type: number
      sql: 100.0* ${amateur_built_count}/NULLIF(${count},0)

    - measure: us_accidents_count
      type: count
      filters: 
        country: United States
      drill_fields: [detail*, -country]

    - measure: minor_accidents_count
      type: count
      drill_fields: detail*
      filters: 
        severity: Minor

    - measure: incident_accidents_count
      type: count
      drill_fields: detail*
      filters: 
        severity: Incident

    - measure: serious_accidents_count
      type: count
      drill_fields: detail*
      filters: 
        severity: Serious

    - measure: fatal_accidents_count
      type: count
      drill_fields: detail*
      filters: 
        severity: Fatal

  sets: 
    detail: 
      - event_id
      - event_date
      - registration_number
      - location
      - aircraft_models.manufacturer
      - investigation_type
      - severity