
#
# Accident reporting...
#
# 

- view: accidents
  sets: 
    detail: [event_id, event_date, registration_number, aircraft_models.manufacturer, 
      investigation_type, 
      severity, number_injured, number_fatal_injuries, aircraft_damage,air_carrier]
    
  fields:
    
    - name: event_id
      html: |
        <%= linked_value %> 
        <a href=http://www.ntsb.gov/aviationquery/brief.aspx?ev_id=<%= value %> >
           <img src=/images/arrow-black-right.png></a>

    - name: registration_number
    - name: investigation_type
      
    - name: event
      type: time
      timeframes: [time, date, dow, week, month, month_num, year]
      sql: event_date

    - name: severity
      sql_case: 
        Incident: |
            ${number_fatal_injuries} 
            + ${number_serious_injuries} + ${number_minor_injuries} = 0
        Minor: ${number_fatal_injuries} + ${number_serious_injuries} = 0
        Serious: ${number_fatal_injuries} = 0
        else: Fatal
      
    - name: number_injured
      units: people
      type: number
      sql: ${number_serious_injuries} + ${number_minor_injuries}

    - name: total_injured
      type: sum
      units: people
      sql: ${number_injured}

    - name: uninjured
      sql: $$.number_of_uninjured

    - name: total_uninjured
      type: sum
      units: people
      sql: ${uninjured}

    - name: number_fatal_injuries
      type: number
      units: people
      sql: number_of_fatalities

    - name: total_fatalities
      type: sum
      units: people
      sql: ${number_fatal_injuries}
      
    - name: number_serious_injuries
      type: number
      units: people
      sql: $$.number_of_serious_injuries

    - name: number_minor_injuries
      type: number
      units: people
      sql: $$.number_of_minor_injuries


    # Is there more then one model of this aircraft?
    - name: oneoff_multi
      label: ACCIDENTS One off/Multi
      sql: |
        (SELECT IF(COUNT(*) > 1, "Multi", "One off") 
         FROM accidents a 
         WHERE a.model=accidents.model)
    
    - name: location
    - name: country

    - name: latitude
      type: number
      decimals: 4

    - name: longitude
      type: number
      decimals: 4

    - name: airport_code      
    - name: airport_name
    - name: injury_severity
    - name: aircraft_damage
    - name: aircraft_category
    - name: number_of_engines
    - name: engine_type
    - name: far_description      
    - name: schedule
    - name: purpose_of_flight
    - name: air_carrier
      sql: TRIM($$.air_carrier)
    - name: weather_condition
    - name: broad_phase_of_flight
    - name: report_status
    - name: publication_date

    - name: amateur_built
      type: yesno
      sql: amateur_built = "Yes"

    - name: count
      type: count
      units: accidents
      sets: 
        - aircraft_models.detail
        - aircraft.detail
      detail: detail

    - name: amateur_built_count
      type: count
      units: accidents
      filters: 
        amateur_built: "Yes"
      detail: detail

    - name: country_count
      type: count
      sql: DISTINCT country
      detail: {base: [country, count, total_fatalities]}
  
    - name: percent_amateur_built
      type: percentage
      sql: ${amateur_built_count}/${count}

    - name: us_accidents_count
      type: count
      units: accidents
      filters: 
        country: United States
      detail: [detail*, -country]

    - name: minor_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Minor

    - name: incident_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Incident

    - name: serious_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Serious

    - name: fatal_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Fatal


      

