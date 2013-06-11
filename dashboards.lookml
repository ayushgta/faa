- dashboard: flights_facts
  title: Fun Flight Facts
  layout: tile
  tile_size: 100
  elements:

    - name: flights_by_departure_hour
      type: scatter
      base_view: flights
      dimension: flights.depart_hour
      measures: [flights.count, flights.late_count, flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days
      sorts: flights.depart_hour
      width: 12
      height: 3

    - name: airports_by_elevation_tier
      type: piechart
      base_view: airports
      group: airports.elevation_tier
      measure: airports.count
      sorts: airports.elevation_tier
      ugly_fish: hello
      width: 6
      height: 6

    - name: airports_by_control_tower
      type: piechart
      base_view: airports
      group: airports.control_tower
      measure: airports.count
      width: 3
      height: 3

    - name: california_vs_new_york_vs_texas
      type: piechart
      base_view: flights
      group: origin.state
      measure: flights.count
      filters:
        origin.state: CA,NY,TX
      width: 3
      height: 2

    - name: flights_by_carrier
      type: piechart
      base_view: flights
      group: carriers.name
      measure: flights.count
      width: 6
      height: 3

    - name: flights_by_origin
      type: piechart
      base_view: flights
      group: origin.city
      measure: flights.count
      width: 6
      height: 4

    - name: california_flights_by_california_destination
      type: piechart
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      width: 6
      height: 4


    # - name: flight_today
    #   type: number
    #   base_view: flights
    #   field: flights.count
    #   filters:
    #     flights.depart_time: "2001-01-01 for 1 days"
