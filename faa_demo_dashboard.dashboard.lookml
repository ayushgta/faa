<<<<<<< HEAD
# 
# #--------------------------------------------------
# 
# - dashboard: faa_demo
#   title: Travel Overview
#   layout: tile
#   tile_size: 100
#     
#   filters:
#   - name: date
#     title: "Date"
#     type: date_filter
#     default_value: 2005
#     
#   - name: state
#     title: "Origin State"
#     type: field_filter
#     explore: airports
#     field: airports.state
#      
# 
#   elements:
# 
#   - name: airports_count
#     title: Number of Flights
#     type: single_value
#     model: faa
#     explore: flights
#     measures: [flights.count]
#     total: false
#     font_size: medium
#     listen:
#       state: origin.state
#       date: flights.depart_date
#     width: 4
#     height: 3
# 
#   - name: flights_percent_completed_ontime
#     title: Percent of Flights Completed On Time
#     type: single_value
#     explore: flights
#     measures: [flights.percent_ontime]
#     listen:
#       state: origin.state
#       date: flights.depart_date
#     width: 4
#     height: 3
#       
#   - name: total_routes
#     title: Total Routes
#     type: single_value
#     model: faa
#     explore: flights
#     measures: [flights.routes_count]
#     sorts: [flights.routes_count desc]
#     limit: 500
#     total: false
#     listen:
#       state: origin.state
#       date: flights.depart_date
#     width: 4
#     height: 3
#   
#   - name: add_a_unique_name_869
#     title: Monthly Flights by Status
#     type: looker_area
#     model: faa
#     explore: flights
#     dimensions: [flights.arrival_status, flights.depart_month]
#     pivots: [flights.arrival_status]
#     measures: [flights.count]
#     colors: ['#485963','#fcd15c','#00b2d8','#446c80',orange, redorange]
#     listen:
#       date: flights.depart_date
#       state: origin.state 
#     sorts: [flights.depart_month desc]
#     limit: 500
#     total: false
#     show_null_points: true
#     show_value_labels: false
#     show_view_names: true
#     stacking: normal
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     point_style: none
#     interpolation: linear
# 
#   - name: add_a_unique_name_368
#     title: Monthly Flight Count
#     type: looker_column
#     model: faa
#     explore: flights
#     dimensions: [flights.depart_month]
#     measures: [flights.count]
#     sorts: [flights.depart_month]
#     listen: 
#       date: flights.depart_date
#       state: origin.state 
#     limit: 500
#     reference_lines:
#       - value: [median]
#         label: Median
# #         color: "#Ef7F0F"
#     total: false
#     stacking: ''
#     show_value_labels: false
#     show_null_labels: false
#     show_view_names: true
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_gridlines: true
#     show_dropoff: false
#     hide_legend: true
#     show_null_points: true
#     x_axis_scale: auto
# 
#   - name: add_a_unique_name_638
#     title: Flight Count by Origin State
#     type: looker_geo_choropleth
#     model: faa
#     explore: flights
#     dimensions: [origin.state]
#     measures: [flights.count]
#     sorts: [flights.count desc]
#     listen: 
#       date: flights.depart_date
#       state: origin.state 
#     colors: orange
#     limit: 500
#     total: false
#     map: usa
#     map_projection: ''
#     quantize_colors: false
#     loading: false
#     outer_border_color: orange
#   
#   - name: airport_count_location_geomap
#     title: Airport Count by Location
#     type: looker_geo_coordinates
#     model: faa
#     explore: flights
#     dimensions: [origin.location]
#     measures: [origin.count]
#     point_color: '#00b2d8'
#     sorts: [origin.count desc]
#     limit: 500
#     total: false
#     map: usa
#     map_projection: ''
#     loading: false
#     listen:
#       state: origin.state
#       date: flights.depart_date #needed since airports can be built over time
# 
#   - name: add_a_unique_name_318
#     title: Top 10 Carriers by Flight Count
#     type: looker_column
#     model: faa
#     explore: flights
#     dimensions: [carriers.name]
#     measures: [flights.count, flights.average_seats]
#     sorts: [flights.count desc]
#     colors: ['#485963','#00b2d8','#446c80',orange, redorange]
#     limit: 10
#     listen:
#       state: origin.state
#       date: flights.depart_date
#     total: false
#     stacking: ''
#     show_value_labels: false
#     x_axis_gridlines: false
#     x_axis_label_rotation: -30
#     y_axis_gridlines: true
#     show_view_names: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     show_null_labels: false
# 
#   
#   - name: add_a_unique_name_820
#     title: Carrier Stats
#     type: table
#     model: faa
#     explore: flights
#     dimensions: [carriers.name]
#     measures: [flights.count, flights.percent_ontime, flights.average_seats]
#     sorts: [flights.count desc]
#     limit: 500
#     listen:
#       state: origin.state
#       date: flights.depart_date
#     total: false
# 
# 
# 
# 
# 
# 
=======
#--------------------------------------------------

- dashboard: faa_demo
  title: Travel Overview
  layout: tile
  tile_size: 100

  filters:
  - name: date
    title: "Date"
    type: date_filter
    default_value: 2005

  - name: state
    title: "Origin State"
    type: field_filter
    explore: airports
    field: airports.state
    
  - name: city_filter
    title: "Origin City"
    type: field_filter
    explore: airports
    field: airports.city
    listens_to_filters: [state]


  elements:

  - name: airports_count
    title: Number of Flights
    type: single_value
    model: faa
    explore: flights
    measures: [flights.count]
    total: false
    font_size: medium
    listen:
      state: origin.state
      date: flights.depart_date
    width: 4
    height: 3

  - name: flights_percent_completed_ontime
    title: Percent of Flights Completed On Time
    type: single_value
    explore: flights
    measures: [flights.percent_ontime]
    listen:
      state: origin.state
      date: flights.depart_date
    width: 4
    height: 3

  - name: total_routes
    title: Total Routes
    type: single_value
    model: faa
    explore: flights
    measures: [flights.routes_count]
    sorts: [flights.routes_count desc]
    limit: 500
    total: false
    listen:
      state: origin.state
      date: flights.depart_date
    width: 4
    height: 3

  - name: add_a_unique_name_869
    title: Monthly Flights by Status
    type: looker_area
    model: faa
    explore: flights
    dimensions: [flights.arrival_status, flights.depart_month]
    pivots: [flights.arrival_status]
    measures: [flights.count]
    colors: ['#485963','#fcd15c','#00b2d8','#446c80',orange, redorange]
    listen:
      date: flights.depart_date
      state: origin.state
    sorts: [flights.depart_month desc]
    limit: 500
    total: false
    show_null_points: true
    show_value_labels: false
    show_view_names: true
    stacking: normal
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    point_style: none
    interpolation: linear

  - name: add_a_unique_name_368
    title: Monthly Flight Count
    type: looker_column
    model: faa
    explore: flights
    dimensions: [flights.depart_month]
    measures: [flights.count]
    sorts: [flights.depart_month]
    listen:
      date: flights.depart_date
      state: origin.state
    limit: 500
    reference_lines:
      - value: [median]
        label: Median
#         color: "#Ef7F0F"
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
    show_dropoff: false
    hide_legend: true
    show_null_points: true
    x_axis_scale: auto

  - name: add_a_unique_name_638
    title: Flight Count by Origin State
    type: looker_geo_choropleth
    model: faa
    explore: flights
    dimensions: [origin.state]
    measures: [flights.count]
    sorts: [flights.count desc]
    listen:
      date: flights.depart_date
      state: origin.state
    colors: orange
    limit: 500
    total: false
    map: usa
    map_projection: ''
    quantize_colors: false
    loading: false
    outer_border_color: orange

  - name: airport_count_location_geomap
    title: Airport Count by Location
    type: looker_geo_coordinates
    model: faa
    explore: flights
    dimensions: [origin.location]
    measures: [origin.count]
    point_color: '#00b2d8'
    sorts: [origin.count desc]
    limit: 500
    total: false
    map: usa
    map_projection: ''
    loading: false
    listen:
      state: origin.state
      date: flights.depart_date #needed since airports can be built over time

  - name: add_a_unique_name_318
    title: Top 10 Carriers by Flight Count
    type: looker_column
    model: faa
    explore: flights
    dimensions: [carriers.name]
    measures: [flights.count, flights.average_seats]
    sorts: [flights.count desc]
    colors: ['#485963','#00b2d8','#446c80',orange, redorange]
    limit: 10
    listen:
      state: origin.state
      date: flights.depart_date
    total: false
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    x_axis_label_rotation: -30
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false


  - name: add_a_unique_name_820
    title: Carrier Stats
    type: table
    model: faa
    explore: flights
    dimensions: [carriers.name]
    measures: [flights.count, flights.percent_ontime, flights.average_seats]
    sorts: [flights.count desc]
    limit: 500
    listen:
      state: origin.state
      date: flights.depart_date
    total: false



>>>>>>> branch 'master' of git@github.com:looker/faa.git
