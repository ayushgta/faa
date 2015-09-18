- dashboard: example
  title: example
  layout: tile
  tile_size: 100
  elements:
  
  - name: top_5_carriers_by_accidents
    type: looker_column
    explore: accidents
    dimensions: accidents.air_carrier
    measures: [accidents.count, accidents.total_fatalities]
    filters:
      accidents.air_carrier: -EMPTY
    limit: 6
    width: 8
    height: 4