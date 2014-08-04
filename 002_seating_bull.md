# Seating Bull

We should be able to tell the economies of resort towns (especially relatively isolated ones) by their air traffic. 
Particularly, the number of seats on planes in a given day/week/month/year should be able to tell us how 
much air capacity there is to get there and over time.


We get from Flights to the registered aircraft via the plane's tail number and particular aircraft to 
aircraft model via the aircraft model code, we can know the number of seats on a given plane. 

Adding up these seats should give us the total air capacity going into or out of a city at any given
time.

Looker's flights database has 3 tables that need to be combined to give us this data. Flights, Aircraft and 
Aircraft Models.

flights -> aircraft-> aircraft->model-> # seats.

These relations were setup when the flight Looker was built so we don't need to other then select 
the measure.

## Let's count seats.

To play along with this analysis  start **[from here](/explore/faa/flights)**.

We select flights.  Let's count Flights and Seats.

    Measures:
      FLIGHTS Counts 
      FLIGHTS Total Seats
      

<iframe height=175 width=300 src='/embed/private/faa/flights?fields=flights.count,flights.total_seats'>
</iframe>

We can see, for all time we have 38M flights with a total seating capacity for the time of our data is about 
4B seats. Seating capacity is determined by summng the seating capacity of the individual aircraft on
a per flight basis.

The SQL that Looker for this query is:

<iframe height=200 width=700 src='/explore/faa/flights.sql?fields=flights.count,flights.total_seats'>
</iframe>

## Where is my Vail?

I know there is an airport near Vail, Colorado , but I don't know the code or remember the name. I can 
Looker the code up by filtering flights to Colorado and looking for Destinations and the full name of the 
airport and city and location.

<iframe height=300 width=700 src='/embed/private/faa/flights?f%5Bdestination.state%5D=CO&fields=destination.city,flights.destination,destination.location,flights.count'>
</iframe>

Clicking on the map links and looking around, I see that (Eagle is pretty close to Vale)[http://osm.org/go/T2ABCb--?node=106849952].

I click on EGE and we are looking at just Vail flights. For all time there are 7889 flights going into Vail.

<iframe height=175 width=300 src='/embed/private/faa/flights?fields=destination.city,flights.destination,destination.location,flights.count&f%5Bdestination.state%5D=CO&limit=500&graph=spline,column&f%5Bflights.destination%5D=EGE&sorts=flights.count+desc'>
</iframe>


## Not all days are created equal

Let's checkout different days of the week.  Lets look forward a week and group by Day of the week.  
We should be able to see if there are any differences. 
it for good measure.

## Saturday is big

<iframe height=300 width=700 src='/embed/private/faa/flights?fields=flights.depart_dow_num,flights.count&f%5Bdestination.state%5D=CO&limit=500&graph=spline,column&f%5Bflights.destination%5D=EGE&sorts=flights.count+desc'>
</iframe>

We see that saturday has 2x the number of flights as wednesday (the smallest day), but 3x the number of seats.  There must be some big planes come in saturday.  Sunday is also big.  The other weekdays are also pretty small.


#### Add a little seasoning?

Vale is a ski resort, right?  Let's look at flights by week for the whole year.  Lets pivot the day of week and pivot 
pivot the month number.

<iframe height=400 width=700 src='/embed/private/faa/flights?fields=flights.depart_dow_num,flights.depart_month_num,flights.count&f%5Bdestination.state%5D=CO&limit=500&graph=spline,column&f%5Bflights.destination%5D=EGE&sorts=flights.depart_month_num&pivots=flights.depart_dow_num'>
</iframe>

And as a Graph:

<iframe height=400 width=700 src='/embed/private/faa/flights?fields=flights.depart_dow_num,flights.depart_month_num,flights.count&f%5Bdestination.state%5D=CO&limit=500&graph=spline,column&f%5Bflights.destination%5D=EGE&sorts=flights.depart_month_num&pivots=flights.depart_dow_num&vis=%7B"type":"looker_column","show_null_points":true,"show_null_labels":false%7D'>
</iframe>

Look at that!  We can clearly se that in December, January, Febuary and March are when the planes fly, and the
And the planes fly most on Saturday.

## Daddy, Where do I come from?

Let's take a look at where all these Vail lovers come from.  Groping by Origin City.  And we'll get a multi year look.

<iframe height=350 width=700 src='/embed/private/faa/flights?fields=origin.city,flights.count&f%5Bdestination.state%5D=CO&limit=500&graph=spline,column&f%5Bflights.destination%5D=EGE&sorts=flights.count+desc&vis=%7B"type":"looker_column","show_null_points":true,"show_null_labels":false%7D'>
</iframe>

Don't mess with Texas.  Looks like the two of the top three origins are from Texas (Dallas and Houston).  Since we don't have complete flight information for each individual, we have to assume that people are flying though hubs like Minneapolis and Atlanta.  

We can see a trend in that there are very few flights from west coast cities.  Not concrete, but it helps form an opinion.

## Vale really is special.

Looking at another city with the same lens doesn't yeild the same trends.  Looking at RNO for example, 
winter/summer doesn't seem to effect the number of seats.

<iframe height=400 width=700 src='/embed/private/faa/flights?fields=flights.depart_dow_num,flights.depart_month_num,flights.count&pivots=flights.depart_dow_num&f%5Bflights.destination%5D=RNO&sorts=flights.depart_month_num&limit=500&show=vis,data,fields&vis=%7B"type":"looker_column","show_null_labels":false%7D'>
</iframe>




