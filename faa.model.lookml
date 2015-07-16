- scoping: true
- connection: red_flight
- persist_for: 2000 hours
- template: liquid
- include: "*.lookml"

- explore: airports
  view: airports
  
- explore: aircraft
  view: aircraft