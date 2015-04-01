- explore: airport_codes
  hidden: true
  
- view: airport_codes
  derived_table:
    sql: |
      SELECT DISTINCT origin AS code FROM flights
    persist_for: 500 hours
    sortkeys: [code]
      
  fields:
  - dimension: code
  
  
- explore: carrier_codes
  hidden: true
- view: carrier_codes
  derived_table:
    sql: |
      SELECT DISTINCT carrier AS code FROM flights
    persist_for: 500 hours
    sortkeys: [code]
      
  fields:
  - dimension: code
  
  
