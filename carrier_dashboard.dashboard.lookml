#---------------------------------------------------

- dashboard: carrier_dashboard
  title: Carrier Dashboard
  layout: grid
  rows:
    - elements: [carrier_flight_count, carrier_flights_ontime_percent, carrier_flight_averageseats]
      height: 220
    - elements: [test, flight_destination_count_byregion]
      height: 400

  filters:

  - name: date
    title: "Date"
    type: date_filter
    default_value: 2005
  
  - name: carrier
    title: "Carrier"
    type: field_filter
    explore: flights
    field: carriers.name


  elements:
 
  - name: carrier_flight_count
    title: Flight Count By Carrier
    type: single_value
    model: faa
    explore: flights
    measures: [flights.count]
    font_size: medium
    listen: 
      carrier: carriers.name
      date: flights.depart_date
  
  - name: carrier_flights_ontime_percent
    title: Carrier Percent of Flights OnTime
    type: single_value
    model: faa
    explore: flights
    measures: [flights.percent_ontime]
    font_size: medium
    listen:   
      carrier: carriers.name
      date: flights.depart_date
  
  
  - name: carrier_flight_averageseats
    title: Carrier Average Seats per Flight
    type: single_value
    model: faa
    explore: flights
    measures: [flights.average_seats]
    font_size: medium
    listen:   
      carrier: carriers.name
      date: flights.depart_date
      

  - name: test
    title: Flights by Manufacturer
    type: looker_column
    model: faa
    explore: flights
    dimensions: [aircraft_models.manufacturer, flights.depart_month]
    pivots: [aircraft_models.manufacturer]
    measures: [flights.count]
    filters:
      aircraft_models.manufacturer: -NULL
    listen:   
      carrier: carriers.name
      date: flights.depart_date
    sorts: [flights.count desc 0]
    colors: ['#485963','#fcd15c','#00b2d8','#446c80',orange, redorange]
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
    x_axis_scale: auto
    show_null_points: true
    interpolation: linear
    point_style: none
    show_null_labels: false


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
      carrier: carriers.name
      date: flights.depart_date

