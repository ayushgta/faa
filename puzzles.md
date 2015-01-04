# Puzzles 

Time to test your skills! 

Start by selecting [Explore Airports](/explore/faa/airports) to complete the following puzzles. 
When you're ready to check your work, click on the answer link below.

How many airports have control towers in the US? [answer](/explore/faa/airports?fields=airports.with_control_tower_count)

What city in Texas has the most heliports? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.city,airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&f%5Bairports.state%5D=TX&sorts=airports.count+desc)

How many heliports have control towers? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&sorts=airports.count+desc&f%5Bairports.control_tower%5D=yes)

Where is the highest facility in the US? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state&limit=5&sorts=airports.elevation+desc)

Where is the highest airport? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state,airports.facility_type&limit=5&sorts=airports.elevation+desc&f%5Bairports.facility_type%5D=AIRPORT)

Which state has the heliport at the highest elevation?
[answer](/x/JW9KmMf)


[**Go on to Module 2**](/stories/lookml_design_patterns/000a_explore_looker.md) or [Return to the Learn Homepage](/stories/lookml_design_patterns/000_index.md)