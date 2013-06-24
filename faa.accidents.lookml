
#
# Accident reporting...
#
# 

- view: accidents
  fields:
    
    - dimension: event_id
      html: |
        <%= linked_value %> 
        <a href=http://www.ntsb.gov/aviationquery/brief.aspx?ev_id=<%= value %> >
           <img src=/images/arrow-black-right.png></a>

    - dimension: registration_number
    - dimension: investigation_type
      
    - dimension_group: event
      type: time
      timeframes: [time, date, dow, week, month, month_num, year]
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
      units: people
      type: number
      sql: ${number_serious_injuries} + ${number_minor_injuries}

    - measure: total_injured
      type: sum
      units: people
      sql: ${number_injured}

    - dimension: uninjured
      sql: ${TABLE}.number_of_uninjured

    - measure: total_uninjured
      type: sum
      units: people
      sql: ${uninjured}

    - dimension: number_fatal_injuries
      type: number
      units: people
      sql: number_of_fatalities

    - measure: total_fatalities
      label: Total Fatalities
      type: sum
      units: people
      sql: ${number_fatal_injuries}
      
      
    - dimension: number_serious_injuries
      type: number
      units: people
      sql: ${TABLE}.number_of_serious_injuries

    - dimension: number_minor_injuries
      type: number
      units: people
      sql: ${TABLE}.number_of_minor_injuries


    # Is there more then one model of this aircraft?
    - dimension: oneoff_multi
      label: ACCIDENTS One off/Multi
      sql: |
        (SELECT IF(COUNT(*) > 1, "Multi", "One off") 
         FROM accidents a 
         WHERE a.model=accidents.model)
    
    - dimension: location
    - dimension: country

    - dimension: latitude
      type: number
      decimals: 4

    - dimension: longitude
      type: number
      decimals: 4

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
      sql: amateur_built = "Yes"

    - measure: count
      label: Number of Accidents
      type: count
      units: accidents
      sets: 
        - aircraft_models.detail
        - aircraft.detail
      detail: detail

    - measure: amateur_built_count
      type: count
      units: accidents
      filters: 
        amateur_built: "Yes"
      detail: detail

    - measure: country_count
      type: count
      sql: DISTINCT country
      detail: {base: [country, count, total_fatalities]}
  
    - measure: percent_amateur_built
      type: percentage
      sql: ${amateur_built_count}/${count}

    - measure: us_accidents_count
      type: count
      units: accidents
      filters: 
        country: United States
      detail: [detail*, -country]

    - measure: minor_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Minor

    - measure: incident_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Incident

    - measure: serious_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Serious

    - measure: fatal_accidents_count
      type: count
      units: accidents
      detail: detail
      filters: 
        severity: Fatal

  sets: 
    detail: [event_id, event_date, registration_number, aircraft_models.manufacturer, 
      investigation_type, 
      severity, number_injured, number_fatal_injuries, aircraft_damage,air_carrier]
    

      





















- dashboard: flights_facts_too
  title: Fun Flight Facts TOO
  layout: tile
  tile_size: 100
  elements:

    - name: accidents_by_carrier
      type: bar
      base_view: accidents
      dimension: accidents.air_carrier
      measures: [accidents.count]
      filters:
        accidents.air_carrier: -EMPTY
      limit: 5
      width: 4
      height: 4
      stacking: normal

    - name: flights_by_departure_hour
      type: area
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 4
      height: 4
      xAxisLabelsRotation: 45

    - name: flights_by_departure_hour
      type: area
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 4
      height: 4
      xAxisLabelsRotation: -45
      stacking: percent

    - name: flights_by_departure_hour
      type: bar
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 12
      height: 4
      stacking: normal

    - name: airports_by_elevation_tier
      type: pie
      base_view: airports
      group: airports.elevation_tier
      measure: airports.count
      sorts: airports.elevation_tier
      ugly_fish: hello
      width: 6
      height: 6

    - name: airports_by_control_tower
      type: pie
      base_view: airports
      group: airports.control_tower
      measure: airports.count
      width: 3
      height: 3

    - name: california_vs_new_york_vs_texas
      type: pie
      base_view: flights
      group: origin.state
      measure: flights.count
      filters:
        origin.state: CA,NY,TX
      width: 3
      height: 2

    - name: flights_by_carrier
      type: pie
      base_view: flights
      group: carriers.name
      measure: flights.count
      width: 6
      height: 3

    - name: flights_by_origin
      type: pie
      base_view: flights
      group: origin.city
      measure: flights.count
      width: 6
      height: 4

    - name: california_flights_by_california_destination
      type: pie
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      width: 6
      height: 4

    # - name: flight_today
    #   type: number
    #   base_view: flights
    #   field: flights.count
    #   filters:
    #     flights.depart_time: "2001-01-01 for 1 days"





