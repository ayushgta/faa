
- view: airports
  sets:
    detail: [code, city, state, full_name, control_tower, facility_type]
  fields:

    - name: code        
    - name: city
    - name: state
    - name: full_name

    - name: facility_type
      sql: $$.fac_type
      
    - name: control_tower
      type: yesno
      sql: $$.cntl_twr = 'Y'

    - name: elevation
      type: number

    - name: count
      type: count_distinct
      sql: $$.code
      detail: detail

    - name: with_control_tower_count
      type: count_distinct
      sql: $$.code
      detail: detail
      filters:
        control_tower: Yes

    - name: avergae_elevation
      type: average
      sql: $$.elevation

    - name: min_elevation
      type: min
      sql: $$.elevation
      
    - name: max_elevation
      type: max
      sql: $$.elevation

    - name: elevation_range
      sql_case:
        High: ${elevation} > 8000
        Medium: ${elevation} BETWEEN 3000 and 7999
        else: Low
        
    - name: elevation_tier
      type: tier
      sql: ${elevation}
      tiers: [0, 100, 250, 1000, 2000, 3000, 4000, 5000, 6000]

  
  