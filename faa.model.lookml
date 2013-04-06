- scoping: true
- connection: faa
- include: faa.airports
- include: faa.aircraft
- include: faa.accidents
- include: faa.flights


- base_view: flights
  view: flights
  sql_table: ontime as flights
  english: flights
  desc: Query flights between 2001/01/01 until 2005/01/01
  index_fields: [flights.flight_id, flights.tail_num, flights.depart_time]
  default_filters: {flights.depart_time: 2001/01/01 for 1 day}
  cancel_grouping_fields: [flights.flight_id]
  
- base_view: airports
  view: airports
  
- base_view: aircraft
  view: aircraft
  
- base_view: accidents
  view: accidents