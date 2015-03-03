
#--------------------------------------------------

- dashboard: faa_demo
  title: FAA Demo Dashboard
  layout: grid
  rows:
    - elements: [airports_count,flights_percent_completed_ontime, airports_max_elevation]
      height: 220
    - elements: [accident_count_by_state_geomap, airport_count_location_geomap]
      height: 400
    - elements: [flights_count_carriers_top10, flightcount_manuafacturer_pivotflights_topten]
      height: 400
    - elements: [accidents_purpose_of_flight, flight_count_depart_year]
      height: 400 
    - elements: [flightcount_carrier_pivotflights_table, flightcount_carrier_pivotflights]
      height: 400
    - elements: [flightcount_manuafacturer_pivotflights]
      height: 600
    
  filters:
  - name: date
    title: "Date"
    type: date_filter
    #default_value: Last 90 Days
    #can't specify a default value -- no recent data from DB 
    
  - name: state
    title: "State / Region"
    type: field_filter
    explore: airports
    field: airports.state
     

  elements:

  - name: airports_count
    title: Number of Airports
    type: single_value
    model: faa
    explore: airports
    measures: [airports.count]
    total: false
    font_size: medium
    listen:
      state: airports.state

  - name: flights_percent_completed_ontime
    title: Percent of Flights Completed On Time
    type: single_value
    explore: flights
    measures: [flights.percent_ontime]
    listen:
      #state: flights.destination_state
      state: origin.state
      date: flights.depart_date
      
  - name: airports_max_elevation
    title: Airport Max Elevation
    type: single_value
    model: faa
    explore: airports
    measures: [airports.max_elevation]
    sorts: [airports.max_elevation desc]
    limit: 500
    total: false
    listen:
      state: airports.state
  
  - name: accident_count_by_state_geomap
    title: Accident Count by State
    type: looker_geo_choropleth
    model: faa
    explore: accidents
    dimensions: [aircraft.state]
    measures: [accidents.count]
    sorts: [accidents.count desc]
    limit: 500
    total: false
    quantize_colors: false
    inner_border_color: ''
    empty_color: ''
    colors: ['#ff0000']
    map: usa
    map_projection: ''
    loading: false
    listen:
      state: aircraft.state
      date: accidents.event_date
  
  
  
  - name: airport_count_location_geomap
    title: Airport Count by Location
    type: looker_geo_coordinates
    model: faa
    explore: airports
    dimensions: [airports.location]
    measures: [airports.count]
    sorts: [airports.count desc]
    limit: 500
    total: false
    map: usa
    map_projection: ''
    loading: false
    listen:
      state: airports.state



  - name: flights_count_carriers_top10
    title: Flight Count for the Top 10 Carriers
    type: looker_pie
    model: faa
    explore: flights
    dimensions: [carriers.name]
    measures: [flights.count]
    filters:
      carriers.name: ''
    sorts: [flights.count desc]
    limit: 10
    total: false
    show_null_points: true
    inner_radius: 50
    hide_legend: false
    listen:
      state: origin.state
      date: flights.depart_date



  - name: flight_count_depart_year
    title: Flight Count By Year
    type: looker_column
    model: faa
    explore: flights
    dimensions: [flights.depart_year]
    measures: [flights.count]
    sorts: [flights.depart_year]
    limit: 500
    total: false
    stacking: ''
    show_value_labels: false
    show_null_labels: false
    show_view_names: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    show_dropoff: true
    hide_legend: true
    show_null_points: true
    x_axis_scale: auto
    listen:
      state: origin.state
      date: flights.depart_date
      
  
  - name: accidents_purpose_of_flight
    title: Fight Accidents by Reason
    type: looker_donut_multiples
    model: faa
    explore: accidents
    dimensions: [accidents.purpose_of_flight, accidents.severity]
    pivots: [accidents.severity]
    measures: [accidents.count]
    filters:
      accidents.purpose_of_flight: -EMPTY
    sorts: [accidents.count desc 2]
    limit: 6
    total: false
    show_null_labels: false
    show_value_labels: false
    show_view_names: true
    stacking: normal
    show_null_points: true
    listen: 
      state: aircraft.state 
      date: accidents.event_date
    

  - name: flightcount_manuafacturer_pivotflights
    title: Flight Count By Aircraft Manaufacturer on Lifetime Flights
    type: table
    model: faa
    explore: flights
    dimensions: [aircraft_models.manufacturer, aircraft_flights_facts.lifetime_flights_tier]
    pivots: [aircraft_flights_facts.lifetime_flights_tier]
    measures: [flights.count]
    filters:
      flights.depart_month: 10 years ago for 1 year
    sorts: [flights.count desc 0]
    limit: 25
    total: false
    row_total: right
    listen: 
      state: origin.state 
      date: flights.depart_date
      
  - name: flightcount_carrier_pivotflights
    title: Carrier Flight Count by Flight Distance 
    type: looker_column
    model: faa
    explore: flights
    dimensions: [aircraft_flights_facts.distance_per_flight_tier, carriers.name]
    pivots: [aircraft_flights_facts.distance_per_flight_tier]
    measures: [flights.count]
    sorts: [flights.count desc 0]
    limit: 500
    total: false
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    listen: 
      state: origin.state 
      date: flights.depart_date

  - name: flightcount_carrier_pivotflights_table
    title: Carrier Flight Count by Flight Distance 
    type: table
    model: faa
    explore: flights
    dimensions: [aircraft_flights_facts.distance_per_flight_tier, carriers.name]
    pivots: [aircraft_flights_facts.distance_per_flight_tier]
    measures: [flights.count]
    sorts: [flights.count desc 0]
    limit: 500
    total: false
    listen: 
      state: origin.state 
      date: flights.depart_date


  - name: flightcount_manuafacturer_pivotflights_topten
    title: Flight Count For Top Ten Aircraft Manaufacturers on Lifetime Flights
    type: looker_area
    model: faa
    explore: flights
    dimensions: [aircraft_models.manufacturer, aircraft_flights_facts.lifetime_flights_tier]
    pivots: [aircraft_flights_facts.lifetime_flights_tier]
    measures: [flights.count]
    filters:
      flights.depart_month: 10 years ago for 1 year
    sorts: [flights.count desc 0]
    limit: 10
    total: false
    stacking: normal
    show_value_labels: false
    show_view_names: true
    x_axis_gridlines: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_null_points: true
    interpolation: linear
    x_axis_scale: auto
    point_style: none
    listen: 
      state: origin.state 
      date: flights.depart_date


#---------------------------------------------------

- dashboard: carrier_dashboard
  title: Carrier Dashboard
  layout: grid
  rows:
    - elements: [carrier_flight_count, carrier_flights_ontime_percent, carrier_flight_averageseats]
      height: 220
    - elements: [flightcount_manuafacturer_pivotflights_topten, flight_destination_count_byregion]
      height: 400

  filters:
  - name: carrier_filter
    title: "Carrier"
    type: field_filter
    explore: flights
    field: carriers.name
 
  - name: carrier_state
    title: "Carrier"
    type: field_filter
    explore: flights
    field: origin.state


  elements:
 
  - name: carrier_flight_count
    title: Flight Count By Carrier
    type: single_value
    model: faa
    explore: flights
    measures: [flights.count]
    font_size: medium
    listen: 
      carrier_filter: carriers.name
      carrier_state: carriers.name

  
  - name: carrier_flights_ontime_percent
    title: Carrier Percent of Flights OnTime
    type: single_value
    model: faa
    explore: flights
    measures: [flights.percent_ontime]
    font_size: medium
    listen: 
      carrier_filter: carriers.name
  
  
  - name: carrier_flight_averageseats
    title: Carrier Average Seats per Flight
    type: single_value
    model: faa
    explore: flights
    measures: [flights.average_seats]
    font_size: medium
    listen: 
      carrier_filter: carriers.name
      

  - name: flightcount_manuafacturer_pivotflights_topten
    title: Flight Count For Top Ten Aircraft Manaufacturers on Lifetime Flights
    type: looker_area
    model: faa
    explore: flights
    dimensions: [aircraft_models.manufacturer, aircraft_flights_facts.lifetime_flights_tier]
    pivots: [aircraft_flights_facts.lifetime_flights_tier]
    measures: [flights.count]
    filters:
      flights.depart_month: 10 years ago for 1 year
    sorts: [flights.count desc 0]
    limit: 10
    total: false
    stacking: normal
    show_value_labels: false
    show_view_names: true
    x_axis_gridlines: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_null_points: true
    interpolation: linear
    x_axis_scale: auto
    point_style: none
    listen: 
      carrier_filter: carriers.name

  - name: flight_destination_count_byregion
    title: Regional Flight Destination Count
    type: looker_geo_coordinates
    model: faa
    explore: flights
    dimensions: [destination.location]
    measures: [flights.count]
    sorts: [flights.count desc]
    limit: 500
    total: false
    map: usa
    map_projection: ''
    loading: false
    listen: 
      carrier_filter: carriers.name





#-----------------------------------------
- dashboard: manufacturer
  title: Manufacturer
  layout: grid
  rows:
    - elements: [flight_count_by_manufacturer]
      height: 220

  filters:
  - name: manufacturer
    title: "Manufacturer"
    type: field_filter
    explore: flights
    field: aircraft_models.manufacturer

  elements:
  - name: flight_count_by_manufacturer
    title: Flight Count
    type: single_value
    model: faa
    explore: flights
    measures: [flights.count]
    listen: 
      manufacturer: aircraft_models.manufacturer
