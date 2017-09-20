- connection: red_flight
- persist_for: 2000 hours

#- case_sensitive: false

- include: "*.view.lookml"
- include: "*.dashboard.lookml"

- explore: flights_2
  view: flights
  joins:
    - join: carriers
      sql_on: ${flights.carrier} = ${carriers.code}
      relationship: many_to_one
      
    - join: aircraft_models
      sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code}
      relationship: many_to_one
      
    - join: aircraft
      sql_on: ${flights.tail_num} = ${aircraft.tail_number}
      relationship: many_to_one
      fields: aircraft.export

- explore: flights
  view: flights
  joins:
    - join: carriers
      sql_on: ${flights.carrier} = ${carriers.code}
      relationship: many_to_one

    - join: origin
      from: commercial_airports
      sql_on: ${flights.origin} = ${origin.code}
      relationship: many_to_one

    - join: destination
      from: commercial_airports
      sql_on: ${flights.destination} = ${destination.code}
      relationship: many_to_one

    - join: aircraft
      sql_on: ${flights.tail_num} = ${aircraft.tail_number}
      relationship: many_to_one
      fields: aircraft.export

    - join: aircraft_flights_facts
      sql_on: ${flights.tail_num} = ${aircraft_flights_facts.tail_num}
      relationship: many_to_one

    - join: aircraft_models
      sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code}
      relationship: many_to_one

    - join: aircraft_types
      sql_on: ${aircraft_models.aircraft_type_id} = ${aircraft_types.aircraft_type_id}
      relationship: many_to_one

- explore: airports
  view: airports

- explore: aircraft
  view: aircraft
  joins:
    - join: aircraft_models
      sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code}
      relationship: many_to_one

    - join: aircraft_types
      sql_on: ${aircraft_models.aircraft_type_id} = ${aircraft_types.aircraft_type_id}
      relationship: many_to_one

    - join: aircraft_flights_facts
      sql_on: ${aircraft.tail_number} = ${aircraft_flights_facts.tail_num}
      relationship: many_to_one

- explore: accidents
  view: accidents
  joins:
    - join: aircraft
      sql_on: ${accidents.registration_number} = ${aircraft.tail_number}
      relationship: many_to_one

# look at me adding a comment