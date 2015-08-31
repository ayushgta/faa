- view: flights
  derived_table:
    # remove some bogus flights.
    sql: |
        SELECT * 
        FROM ontime 
        WHERE dep_time > '1960-01-01'
    sortkeys: [dep_time]
    persist_for: 5000 hours
#     sql_trigger_value: SELECT COUNT(*) FROM ontime
    
  fields:

    - dimension: tail_num
      # primary_key: true
      # testtesttest
  
    - dimension_group: depart
      type: time
      timeframes: [time, date, hour, hour_of_day, day_of_week, day_of_week_index, time_of_day, week, month_num, month, year]
      sql: ${TABLE}.dep_time
      
    - filter: date_filter
      
    - dimension: date_filter_test
      type: yesno
      sql: |
        {% condition date_filter %} ${depart_date} {% endcondition %} OR NULL
      
    - dimension: day_of_week_depart
      sql: ${depart_day_of_week}
  
    - dimension_group: intended_depart
      type: time
      timeframes: [time, date, hour, hour_of_day, day_of_week, day_of_week_index, time_of_day, week, month_num, month, year]
      sql: DATEADD(min, -${depart_delay}, ${TABLE}.dep_time)

    - dimension: arr_time
      type: datetime
  
    - dimension: origin
      sql: ${TABLE}.origin
      suggest_dimension: origin.code
      description: the three letter code (in CAPs) of the airport
    
    - dimension: destination
      sql: ${TABLE}.destination
      suggest_dimension: destination.code
      description: the three letter code (in CAPs) of the airport

    - dimension: route
      sql: ${origin} ||'-->'|| ${destination}
      
    - measure: routes_count
      type: count_distinct
      sql: ${route}
      drill_fields: route_detail*

    - dimension: carrier
      sql: ${TABLE}.carrier
      suggest_dimension: carriers.code
      html: |
        {{ linked_value }}
        <a href="/dashboards/faa/carrier_dashboard?carrier_filter={{ value | encode_uri }}" target="_new" > 
        <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>

    - dimension: flight_number
      sql: ${TABLE}.carrier || ${TABLE}.flight_num
    
    - measure: flight_number_count
      type: count_distinct
      sql: ${flight_number}
      drill_fields: flight_num_detail*

    - dimension: time
      type: number
      sql: ${TABLE}.flight_time

    - measure: average_flight_time
      type: average
      sql: ${TABLE}.flight_time

    - measure: total_flight_time
      type: sum
      sql: ${TABLE}.flight_time

    - dimension: distance
      sql: ${TABLE}.distance
      
    - dimension: distance_tiered
      type: tier
      sql: ${distance}
      tiers: [100,200,400,600,800,1200,1600,3200]
      
    - measure: total_distance
      type: sum
      sql: ${TABLE}.distance

    - dimension: arrival_status
      sql_case:
        Cancelled: ${TABLE}.cancelled='Y'
        Diverted: ${TABLE}.diverted='Y'
        Very Late: ${TABLE}.arr_delay > 60
        OnTime: ${TABLE}.arr_delay BETWEEN -10 and 10
        Late: ${TABLE}.arr_delay > 10
        else: Early
        
    - measure: count
      type: count
      drill_fields: detail*

    - measure: ontime_count
      type: count
      drill_fields: detail*
      filters: 
        arrival_status: OnTime

    - measure: percent_ontime
      type: number
      value_format: '#.00\%'
      sql: 100.0 * ${ontime_count}/NULLIF(${count},0)

    - measure: ontime_facts
      type: number
      sql: ${percent_ontime}
      html: | 
        <div style="width:100%; text-align: right;">
          Ontime Count: {{ ontime_count._linked_value }}
          <br/>
          Percent Ontime: {{ percent_ontime._linked_value }}
        </div> 
        
    - measure: late_count
      type: count
      drill_fields: detail*
      filters: 
        arrival_status: Late

    - measure: percent_late
      type: number
      sql: 100.0 * ${late_count}/NULLIF(${count},0)
      value_format: '#.00\%'

    - measure: verylate_count
      type: count
      drill_fields: detail
      filters: 
        arrival_status: Very Late  

    - measure: percent_verylate
      type: number
      value_format: '#.00\%'
      sql: 100.0 * ${verylate_count}/NULLIF(${count},0)
      decimals: 2
      
    - dimension: cancelled
      type: yesno
      sql: ${arrival_status} = 'Cancelled'
  
    - measure: cancelled_count
      type: count
      drill_fields: detail
      filters: 
        cancelled: Yes  

    - measure: not_cancelled_count
      type: count
      drill_fields: detail*
      filters: 
        cancelled: No 

    - measure: percent_cancelled
      type: number
      decimals: 2
      sql: 100.00 * ${cancelled_count}/${count}
      value_format: '#.00\%'

    - measure: percent_complete
      type: number
      decimals: 2
      sql: 100.00 - ${percent_cancelled}
      value_format: '#.00\%'

    - measure: diverted_count
      type: count
      drill_fields: detail*
      filters: 
        arrival_status: Diverted
        
    - measure: percent_diverted
      type: number
      decimals: 2
      sql: 100.0 * ${diverted_count}/${count}

    - measure: average_seats
      type: average
      sql: aircraft_models.seats
      required_joins: [aircraft_models]

    - measure: total_seats
      type: sum
      sql: aircraft_models.seats
      required_joins: [aircraft_models]

    - dimension: depart_delay
      type: number
      sql: ${TABLE}.dep_delay

    - dimension: arr_delay
      type: number

    - dimension: taxi_out_time
      type: number
      sql: ${TABLE}.taxi_out

    - dimension: taxi_in_time
      type: number
      sql: ${TABLE}.taxi_in
      
    - measure: percent_of_total_late
      type: percent_of_total
      direction: column 
      sql: ${late_count}
      
    - measure: percent_of_previous_late
      type: percent_of_previous
      sql: ${late_count}
      
 
     
  sets:
    origin.detail: [origin count, aircraft,count, carriers.count, .aircraft_models.count, 
        aircraft_models.manufacturer_count]
    destination.detail: [count, aircraft.count, carriers.count, .aircraft_models.count, 
        aircraft_models.manufacturer_count]
    detail: [tail_num, flight_number, depart_time, carriers.name,  origin, origin.city, destination,  
      destination.city,]
    route_detail: [origin, origin.city, destination, destination.city, carriers.count,
      count]
       
      
#a change
      
