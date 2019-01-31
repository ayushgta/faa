- dashboard: faa_merge_dash
  title: FAA Merge Dash
  layout: newspaper
  elements:
  - name: FAA merge tile dash
    title: FAA merge tile dash
    merged_queries:
    - model: thelook
      explore: order_items
      type: table
      fields:
      - users.city
      - users.count
      sorts:
      - users.count desc
      limit: 500
      query_timezone: America/Los_Angeles
      rank: 0
    - model: faa
      explore: flights
      type: table
      fields:
      - origin.city
      - origin.count
      limit: 500
      query_timezone: America/Los_Angeles
      rank: 1
      join_fields:
      - source_field_name: users.city
        field_name: origin.city
    type: table
    row: 0
    col: 0
    width: 16
    height: 8
