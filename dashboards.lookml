- dashboard: flights_facts
  title: Fun Flight Facts
  elements:

    - name: airports_by_facility_type
      type: piechart
      base_view: airports
      group: airports.elevation_tier
      measure: airports.count
      ugly_fish: hello

    - name: airports_by_control_tower
      type: piechart
      base_view: airports
      group: airports.control_tower
      measure: airports.count

    - name: flights_by_carrier
      type: piechart
      base_view: flights
      group: carrier.name
      measure: flights.count

    - name: flights_by_origin
      type: piechart
      base_view: flights
      group: origin.city
      measure: flights.count

    - name: california_flights_by_california_destination
      type: piechart
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA

    - name: california_vs_new_york_vs_texas
      type: piechart
      base_view: flights
      group: origin.state
      measure: flights.count
      filters:
        origin.state: CA,NY,TX


    - name: flights_by_departure_hour
      type: time_series
      base_view: flights
      time_dimension: flights.depart_hour
      measures: [flights.count, flights.late_count,flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days

    # - name: flight_today
    #   type: number
    #   base_view: flights
    #   field: flights.count
    #   filters:
    #     flights.depart_time: "2001-01-01 for 1 days"