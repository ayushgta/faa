
- view: flights
  sets:
    origin.detail: [count, .aircraft_count, .carriers_count, .aircraft_models_count, 
        .aircraft_models_manufacturer_count]
    destination.detail: [count, .aircraft_count, .carriers_count, .aircraft_models_count, 
        .aircraft_models_manufacturer_count]
    detail: [tail_num, flight_number, depart_time, carriers.name,  origin, origin.city, destination,  
      destination.city,]
    route_detail: [origin, origin.city, destination, destination.city, carriers.count,
      count]
    
  fields:
    - name: tail_num    
  
    - name: depart
      type: time
      timeframes: [time, date, hour, hod, dow, dow_num, tod, week, month_num, month, year]
      sql: $$.dep_time

    - name: arr_time
      type: datetime
  
    - name: scheduled_duration
      type: duration
      interval: hour
      sql_start: $$.dep_time
      sql_end: $$.arr_time
         
    - name: flight_id
      sql:  $$.id

    # if you want to join a table from another database, use sql: parameter.
    
    - join: carriers
      sql_on: $$.carrier=carriers.code
      #sql: LEFT JOIN flightstats.carriers as carriers ON ontime.carrier=carriers.code

    - name: origin
      sets:
        - origin.detail

    - join: origin
      from: airports
      sql_on: $$.origin=origin.code
      fields: [origin.full_name, origin.city, origin.state, origin.count]
          
    - name: destination
      sets:
        - destination.detail

    - name: destinations_list
      type: list
      list_field: destination

    - join: destination
      from: airports
      sql_on: $$.destination=destination.code
      fields: [destinaiton.full_name, destination.city, destination.state,
        destination.count]
      
    - name: destination_cities
      type: list
      list_field: destination.city
      required_joins: [destination]

    - name: routes_count
      type: count_distinct
      sql: CONCAT_WS("|", origin, destination)
      detail: route_detail

    - name: carrier

    - name: flight_number
      postgres_sql: $$.carrier || $$.flight_num
      mysql_sql: CONCAT($$.carrier, $$.flight_num)

    - name: flight_number_count
      type: count_distinct
      sql: ${flight_number}
      detail: flight_num_detail 

    - name: time
      type: number
      sets:
        - detail
      sql: $$.flight_time

    - name: average_flight_time
      type: average
      sql: $$.flight_time

    - name: total_flight_time
      type: sum
      sql: $$.flight_time

    - name: distance
      type: number
      sets:
        - detail
      sql: $$.distance

    - name: total_distance
      type: sum
      sql: $$.distance

    - join: aircraft
      sql_on: $$.tail_num = aircraft.tail_num
      #fields: aircraft.export
      
    - name: plane_age_at_flight
      type: number
      required_joins: [aircraft]
      sql: IF(aircraft.year_built>1950, (YEAR(dep_time)*1.0 - aircraft.year_built), NULL)
      
    - name: page_age_at_flight_tier
      type: tier
      sql: ${plane_age_at_flight}
      tiers: [2,4,8,16,32]
      
    - name: weighted_plane_age
      type: average
      sql: ${plane_age_at_flight}

    - name: arrival_status
      sql_case:
        Cancelled: $$.cancelled='Y'
        Diverted: $$.diverted='Y'
        Very Late: $$.arr_delay > 60
        OnTime: $$.arr_delay BETWEEN -10 and 10
        Late: $$.arr_delay > 10
        else: Early
        
    - name: count
      type: count
      sets:
        - origin.detail
        - destination.detail
        - carrier.detail
        - aircraft_models_detail
        - aircraft_maker_detail
        - aircraft_detail
      units: flights
      detail: detail

    - name: ontime_count
      type: count
      units: flights
      detail: detail
      filters: 
        arrival_status: OnTime

    - name: percent_ontime
      type: percentage
      sql: ${ontime_count}/${count}

    - name: late_count
      type: count
      units: flights
      detail: detail
      filters: 
        arrival_status: Late

    - name: percent_late
      type: percentage
      sql: ${late_count}/${count}

    - name: verylate_count
      type: count
      units: flights
      detail: detail
      filters: 
        arrival_status: Very Late  

    - name: percent_verylate
      type: percentage
      sql: ${verylate_count}/${count}
  
    - name: cancelled
      type: yesno
      sql: ${arrival_status} = 'Cancelled'
  
    - name: cancelled_count
      type: count
      units: flights
      detail: detail
      filters: 
        cancelled: Yes  

    - name: not_cancelled_count
      type: count
      units: flights
      detail: detail
      filters: 
        cancelled: No 

    - name: percent_cancelled
      type: percentage
      sql: ${cancelled_count}/${count}

    - name: percent_complete
      type: percentage
      sql: 1 - ${percent_cancelled}

    - name: diverted_count
      type: count
      units: flights
      detail: detail
      filters: 
        arrival_status: Diverted
        
    - name: percent_diverted
      type: percentage
      sql: ${diverted_count}/${count}

    - name: average_seats
      type: average
      sql: aircraft_models.seats
      required_joins: [aircraft_models]

    - name: total_seats
      type: sum
      sql: aircraft_models.seats
      required_joins: [aircraft_models]

    - name: depart_delay
      type: number
      sql: $$.dep_delay

    - name: arr_delay
      type: number

    - name: taxi_out_time
      type: number
      sql: $$.taxi_out

    - name: taxi_in_time
      type: number
      sql: $$.taxi_in
      
- view: carriers
  sets:
    detail: [code, name]

  fields:
    - name: code      
    - name: name
      sql: $$.nickname

    - name: names
      type: list
      list_field: name

    - name: count
      type: count_distinct
      sets:
        - origin.detail
        - destination.detail
        - aircraft_models_detail
        - aircraft_detail
        - airports_detail
        - aircraft_maker_detail
      sql: $$.code
      detail: detail
