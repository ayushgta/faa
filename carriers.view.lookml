- view: carriers
  
  fields:
    - dimension: code 
      primary_key: true
      sql: |
        CASE WHEN ${TABLE}.code IS NULL THEN 'No Carrier'
        ELSE ${TABLE}.code
        END
      
    - dimension: name
      sql: TRIM(${TABLE}.nickname)
      html: |
        {{ linked_value }}
        <a href="/dashboards/faa/carrier_dashboard?carrier={{ value | encode_uri }}" target="_new" > 
        <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>

    - measure: count
      type: count_distinct
      sql: ${TABLE}.code
      drill_fields: detail
      
  sets:
    detail: [code, name, flights.count, origin.count, destination.count]