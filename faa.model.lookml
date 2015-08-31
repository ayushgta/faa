- scoping: true
- connection: red_flight
- persist_for: 2000 hours
- template: liquid
#- case_sensitive: false

- include: "*.view.lookml"
- include: "*.dashboard.lookml"

- explore: flights
  view: flights
  joins:
    - join: carriers
      foreign_key: flights.carrier

    - join: origin
      from: commercial_airports
      foreign_key: origin

    - join: destination
      from: commercial_airports
      foreign_key: destination

    - join: aircraft
      foreign_key: flights.tail_num
      fields: aircraft.export

    - join: aircraft_flights_facts
      foreign_key: flights.tail_num

    - join: aircraft_models
      foreign_key: aircraft.aircraft_model_code

    - join: aircraft_types
      foreign_key: aircraft_models.aircraft_type_id
 
     
- explore: airports
  view: airports
  
- explore: aircraft
  view: aircraft
  joins:
    - join: aircraft_models
      foreign_key: aircraft.aircraft_model_code

    - join: aircraft_types
      foreign_key: aircraft_models.aircraft_type_id
 
    - join: aircraft_flights_facts
      foreign_key: aircraft.tail_number

- explore: accidents
#   connection: faa
  view: accidents
  joins:
    - join: aircraft
      foreign_key: registration_number