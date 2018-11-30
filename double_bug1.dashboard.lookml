- dashboard: double_bug
  title: Double Bug
  layout: grid
  rows:
  - elements: ['hi', 'hello']
    height: 100
  elements:
  - name: "hi"
    explore: flights
    dimensions: flights.depart_hour_of_day
    type: table
  elements:
  - name: "hello"
    explore: flights
    dimensions: flights.depart_hour_of_day
    type: table