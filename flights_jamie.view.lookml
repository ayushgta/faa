# Analysis to answer the question, are there more origins than destinations.

- explore: flights_jamie
  extends: [flights]
  view: flights
  from: flights_jamie
  hidden: true
  joins:
  - join: two_numbers
    type: cross
    relationship: one_to_many

- view: flights_jamie
  extends: flights
  fields:
  - dimension: origin_or_dest
    sql: CASE WHEN ${two_numbers.num} = 0 THEN ${origin} ELSE ${destination} END
  - dimension: origin_or_dest_is_origin
    type: yesno
    sql: ${two_numbers.num} = 0
    
- view: two_numbers
  derived_table:
    sql: SELECT 0 as num UNION select 1
  fields:
  - dimension: num
    hidden: true