# #-----------------------------------------
# - dashboard: manufacturer
#   title: Manufacturer
#   layout: grid
#   rows:
#     - elements: [flight_count_by_manufacturer]
#       height: 220
# 
#   filters:
#   - name: manufacturer
#     title: "Manufacturer"
#     type: field_filter
#     explore: flights
#     field: aircraft_models.manufacturer
# 
#   elements:
#   - name: flight_count_by_manufacturer
#     title: Flight Count
#     type: single_value
#     model: faa
#     explore: flights
#     measures: [flights.count]
#     listen: 
#       manufacturer: aircraft_models.manufacturer