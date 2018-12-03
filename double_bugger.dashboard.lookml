# - dashboard: double_bugger
#   title: Double Bugger
#   layout: grid
#   rows:
#   - elements: ['hi', 'hello']
#     height: 100
#   elements:
#   - name: "hi"
#     explore: flights
#     dimensions: flights.depart_hour_of_day
#     type: table
#   elements:
#   - name: "hello"
#     explore: flights
#     dimensions: flights.depart_hour_of_day
#     type: table
    
    - name: add_a_unique_name_1543869245
  title: Untitled Visualization
  model: 33352_filters_contains_does_not_respect_case_sensitive_no
  explore: flights
  type: looker_area
  fields: [flights.destination, flights.count]
  filters:
    flights.cancelled: Y
    flights.carrier: AA
    flights.count: ">=2500"
  sorts: [flights.destination]
  limit: 500
  series_types: {}