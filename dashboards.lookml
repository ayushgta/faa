- dashboard: flights_facts
  title: Fun Flight Facts
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
      width: 10
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
      width: 8
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
      width: 5
      height: 4
      xAxisLabelsRotation: -45
      stacking: percent

    - name: flights_by_departure_hour
      type: column
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 13
      height: 4
      stacking: percent

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
      height: 3

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
      height: 3

    - name: california_flights_by_california_destination
      type: pie
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      width: 6
      height: 3

    # - name: flight_today
    #   type: number
    #   base_view: flights
    #   field: flights.count
    #   filters:
    #     flights.depart_time: "2001-01-01 for 1 days"
