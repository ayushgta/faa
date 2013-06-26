- dashboard: flights_facts
  title: Fun Flight Facts
  layout: tile
  tile_size: 100
  elements:

    - name: table_test
      type: table
      base_view: flights
      dimensions: [flights.depart_hour]
      measures: [flights.count, flights.late_count, flights.verylate_count]
      width: 7
      height: 6

    - name: number_of_flights
      type: single_value
      base_view: flights
      measure: flights.flight_number_count
      filters:
        origin.state: CA
      width: 4
      height: 2

    - name: number_of_accidents
      type: single_value
      base_view: accidents
      measure: accidents.count
      filters:
        accidents.air_carrier: -EMPTY
      width: 4
      height: 2
      
    - name: total_fatalities
      type: single_value
      base_view: accidents
      measure: accidents.total_fatalities
      width: 4
      height: 2

    - name: accidents_by_carrier
      type: line
      base_view: accidents
      dimension: accidents.air_carrier
      measures: [accidents.count, accidents.total_fatalities]
      filters:
        accidents.air_carrier: -EMPTY
      limit: 6
      width: 6
      height: 4


    - name: accidents_by_carrier_2
      type: column
      base_view: accidents
      dimension: accidents.air_carrier
      measures: [accidents.count]
      filters:
        accidents.air_carrier: -EMPTY
      limit: 6
      width: 6
      height: 4
      
    - name: accidents_by_carrier_3
      type: scatter
      base_view: accidents
      dimension: accidents.air_carrier
      measures: [accidents.count]
      filters:
        accidents.air_carrier: -EMPTY
      limit: 6
      width: 6
      height: 4

    - name: flights_by_departure_hour_unstacked
      type: line
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 6
      height: 4
      xAxisLabelsRotation: 45
      
    - name: flights_by_departure_hour_normal
      type: area
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 6
      height: 4
      xAxisLabelsRotation: -45
      stacking: normal
      
    - name: flights_by_departure_hour_percent
      type: area
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 6
      height: 4
      stacking: percent

    - name: airports_by_elevation_tier
      type: pie
      base_view: airports
      group: airports.elevation_tier
      measure: airports.count
      sorts: airports.elevation_tier
      ugly_fish: hello
      width: 3
      height: 3

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
      height: 3

    - name: flights_by_carrier
      type: pie
      base_view: flights
      group: carriers.name
      measure: flights.count
      width: 3
      height: 3

    - name: flights_by_origin
      type: pie
      base_view: flights
      group: origin.city
      measure: flights.count
      width: 3
      height: 3

    - name: california_flights_by_california_destination
      type: pie
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      width: 3
      height: 3
