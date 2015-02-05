# Lesson 1.3: Seating Bull

We should be able to understand the economies of resort towns (especially relatively isolated ones) by their air traffic. We can do this by looking at the number of seats on planes flying into them on a given day/week/month/year, showing us how much capacity there is to get to that town over time.

In order to find this information, we need data that is stored in a few different tables in the database. 

- The flights table has the list of flights into resort cities
- The aircraft_facts table has the number of seats on each plane

But we can't just pull information from those two tables without relating them to each other first, and in this case we even need a third table to complete the relationship.

These relationships are called **joins** in both SQL and in LookML. In SQL, every time you want to ask a new question that requires information in more than one table, you have to re-write the join for those tables. Luckily, in LookML, you only have to define joins ONCE and they get reused behind the scenes over and over. In this case, these joins were setup when this Looker model was built, so as explorers, all we have to do is start asking questions!

Quick tip: the ALL CAPS word at the beginning of a field name tells you which view a field comes from. Remember that a view name in a Looker model maps to a table in the underlying database.

## Let's count seats.

To play along with this analysis start by selecting **[Explore Flights](/explore/faa/flights)**.

Let's count Flights and Seats.

<look height="100" width="300">
  model: faa
  base_view: flights
  measures: [flights.count, flights.total_seats]
</look>

In our database, we have 38M flights with a total seating capacity of 4B seats. Seating capacity is determined by summing the seating capacity of the individual aircraft on a per flight basis.

The SQL that Looker creates for this query is:

<sql height="200" width="100%">
  model: faa
  base_view: flights
  measures: [flights.count, flights.total_seats]
</sql>

## How do we find airports?

Say we know there is an airport near Vail, Colorado, but we don't know the airport code or remember the name of the airport. We can Looker up the code by filtering the destination state to Colorado, and adding the dimensions for the destination city and destination location.


<look height="250" width="100%">
  model: faa
  base_view: flights
  dimensions: [destination.city, flights.destination, destination.location]
  measures: [flights.count, flights.total_seats]
  filters:
    destination.state: CO
</look>


In our Looker results, there are links to maps. By clicking on them and looking around, we can see that [Eagle is pretty close to Vail](http://osm.org/go/T2ABCb--?node=106849952).

By clicking on the airport code for Eagle, EGE, we are just looking at flights to Vail. For all time there are 7889 flights going into Vail.

<look height="175" width="100%">
  model: faa
  base_view: flights
  dimensions: [destination.city, flights.destination, destination.location]
  measures: [flights.count, flights.total_seats]
  filters:
    destination.state: CO
    flights.destination: EGE
</look>



## What's the busiest day?

Let's checkout different days of the week.  To do so, we'll click on the dimension called Depart DOW Num to group by the day of the week.  

<look height="250" width="100%">
  model: faa
  base_view: flights
  dimensions: flights.depart_dow_num
  measures: [flights.count]
  filters:
    flights.destination: EGE
</look>


We see that Saturday has 2x the number of flights as Wednesday, but 3x the number of seats.  Some big planes must come in Saturdays. We can see that Sunday is also big, but weekdays are pretty small.


## Do seasons matter?

Vale is a ski resort, right? That means we should see seasonal variation in the flight capacities. Let's add in the month number to look at flights for the whole year. Test your pivoting skills by applying pivots for the day of week. Your results should look like the below:


<look height="350" width="100%">
  model: faa
  base_view: flights
  dimensions: [flights.depart_dow_num, flights.depart_month_num]
  pivots: flights.depart_dow_num
  measures: [flights.count]
  filters:
    flights.destination: EGE
</look>


Remember that we can also look at any results that have dimensions and measures as a chart:

<look height="350" width="100%">
  model: faa
  type: looker_column
  base_view: flights
  dimensions: [flights.depart_dow_num, flights.depart_month_num]
  pivots: flights.depart_dow_num
  sorts: [flights.depart_month_num]
  measures: [flights.count]
  filters:
    flights.destination: EGE
</look>


There you go!  We can clearly see that December, January, Febuary and March are when planes fly, and that planes fly most on Saturday.

## Where are all those skiiers coming from?

Let's take a look at where all these Vail lovers come from.  The best way to start a new exploration. We'll select origin city (a dimension) and continue to use flight counts as our measure. By not including a filter that specifies a year, we're inherently looking at all-time data from our database. This means we have a multi year look.

<look height="350" width="100%">
  model: faa
  type: looker_column
  base_view: flights
  dimensions: [origin.city]
  pivots: flights.depart_dow_num
  measures: [flights.count]
  filters:
    flights.destination: EGE
</look>


It looks like the two of the top three origins are from Texas - Dallas and Houston.  Since we don't have complete flight information for each individual, we have to assume that people are flying through hubs like Minneapolis and Atlanta.  

We can see a trend in that there are very few flights from West Coast cities.  Not concrete, but it helps form an opinion.

## Are all cities the same?

Looking at another destination city with the same lens doesn't yield the same trends.  For example, when looking at RNO, we see that winter versus summer doesn't seem to affect the number of seats.

<look height="350" width="100%">
  model: faa
  type: looker_column
  base_view: flights
  dimensions: [flights.depart_dow_num, flights.depart_month_num]
  pivots: flights.depart_dow_num
  measures: [flights.count]
  filters:
    flights.destination: RNO
</look>

[**Continue to Lesson 1.4**](003_411_on_911.md) or [Return to the Learn Homepage](/stories/lookml_design_patterns/000_index.md)
