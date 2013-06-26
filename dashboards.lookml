- dashboard: flights_facts
  title: Fun Flight Facts
  layout: tile
  tile_size: 100
  elements:

    - name: top_5_carriers_by_accidents
      type: column
      base_view: accidents
      dimension: accidents.air_carrier
      measures: [accidents.count, accidents.total_fatalities]
      filters:
        accidents.air_carrier: -EMPTY
      limit: 6
      width: 8
      height: 4

    - name: number_of_flights_from_CA
      type: single_value
      base_view: flights
      measure: flights.flight_number_count
      filters:
        origin.state: CA
      width: 5
      height: 2
      
    - name: total_number_of_accidents
      type: single_value
      base_view: accidents
      measure: accidents.count
      filters:
        accidents.air_carrier: -EMPTY
      width: 5
      height: 2
      
    - name: flights_by_departure_hour
      type: area
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 8
      height: 4
      xAxisLabelsRotation: -45
      stacking: normal

    - name: flight_count_comparison_of_california_vs_new_york_vs_texas
      type: pie
      base_view: flights
      group: origin.state
      measure: flights.count
      filters:
        origin.state: CA,NY,TX
      width: 5
      height: 4




      
#     - name: total_fatalities
#       type: single_value
#       base_view: accidents
#       measure: accidents.total_fatalities
#       width: 5
#       height: 2

# Not sure what this is. - NA
#    - name: state
#      type: lookup
#      base_view: airports
#      dimension: airports.state
#      default: CA,NY
#      height: 1
#      width: 1


#       
#     - name: accidents_by_carrier_3
#       type: scatter
#       base_view: accidents
#       dimension: accidents.air_carrier
#       measures: [accidents.count]
#       filters:
#         accidents.air_carrier: -EMPTY
#       limit: 6
#       width: 6
#       height: 4
# 
#     - name: flights_by_departure_hour_unstacked
#       type: line
#       base_view: flights
#       dimension: flights.depart_hour
#       measures: [flights.count, flights.late_count, flights.verylate_count]
#       filters:
#         flights.depart_time: 2001-01-01 for 1 days
#       linked_filters:
#         origin.state: state
#       sorts: flights.depart_hour
#       width: 6
#       height: 4
#       xAxisLabelsRotation: 45

      
#     - name: flights_by_departure_hour_percent
#       type: area
#       base_view: flights
#       dimension: flights.depart_hour
#       measures: [flights.count, flights.late_count, flights.verylate_count]
#       filters:
#         flights.depart_time: 2001-01-01 for 1 days
#       sorts: flights.depart_hour
#       width: 6
#       height: 4
#       stacking: percent

#     - name: airports_by_elevation_tier
#       type: pie
#       base_view: airports
#       group: airports.elevation_tier
#       measure: airports.count
#       sorts: airports.elevation_tier
#       ugly_fish: hello
#       width: 3
#       height: 3
# 
#     - name: airports_by_control_tower
#       type: pie
#       base_view: airports
#       group: airports.control_tower
#       measure: airports.count
#       width: 3
#       height: 3
# 

# 
#     - name: flights_by_carrier
#       type: pie
#       base_view: flights
#       group: carriers.name
#       measure: flights.count
#       width: 3
#       height: 3
# 
#     - name: flights_by_origin
#       type: pie
#       base_view: flights
#       group: origin.city
#       measure: flights.count
#       width: 3
#       height: 3
# 
    - name: california_flights_by_california_destination
      type: pie
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      width: 6
      height: 5
      
    - name: flight_summary_stats
      type: table
      base_view: flights
      dimensions: [flights.depart_hour]
      measures: [flights.count, flights.late_count, flights.verylate_count]
      width: 7
      height: 5

