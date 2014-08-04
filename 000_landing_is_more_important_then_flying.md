# Landing is more important than Flying

Who knew there were so many airports in the USA?  I guess, when you need a place to land, you 
need a place to land.  Exactly how many airports are there?  Let's **Looker** and see.  All the queries **[start here](/explore/faa/airports)**:

Let's count airports.  Simply select AIRPORTS Count and run the query.

    Measures:  
      AIRPORTS Airports


<iframe height=150 width=200 src='/embed/private/faa/airports?show=data,fields&fields=airports.count'>
</iframe>

Wow, 19,793.  That's a lot of airports.  Wonder where they are?  Let's see which state they are in.  We'll just group the airports by state and sort by the # Airpors descending (from Largest to Smallest).

    Dimensions: 
      AIRPORT State
    Measures: 
      AIRPORTS Count
    Sort: 
      AIRPORTS Counts (Decending)

Results in:

<iframe height=450 width=300 src='/embed/private/faa/airports?fields=airports.state,airports.count'>
</iframe>

It looks like Texas has almost twice as many airports as california.  Want to see where they are?  If you want to see a list of the airports, just click the number.  For example clicking the 890 across from IL will show you a list of airports.

<iframe height=450 width=700 src='/embed/private/faa/airports?fields=airports.detail*&f[airports.state]=IL&limit=500'>
</iframe>


You will notice that some of the airports are Heliports, some are Airports and some are Seaplane bases.  If you click on any of the types, 
it will modify your query to be limited what you clicked on.  Click on "HELIPORT'.  

<iframe height=450 width=700 src='/embed/private/faa/airports?fields=airports.detail*&f[airports.state]=IL&f[airports.facility_type]=HELIPORT&limit=500'>
</iframe>

Notice what happens? Now we only see heleports in the list.   Could we have written this query directly?  Yes.  
Simply selecting the fields and filters in the explore plage would yeild these results.

In Looker every query leads to many, many more queries. Whenever you click on a link in a table in llooker, you are writing a new query.  The entire query is encoded in the URL of the link.  Looker figures out queries you might want to execute and writes the them all for you so you can have a web browsing like experience when  viewing your data.

Let's go back to our airport State List.

Challenge:  How many of each facility type are there in the US?  

See if you can make a report that looks like this?  Start here  [Explore Airports](/explore/faa/airports)

<iframe height=300 width=300 src='/embed/private/faa/airports?fields=airports.facility_type,airports.count'>
</iframe>

## How do the states compare?

Looker has a powerful feature that lets you turn any grouped attribute into a column.  First, let's add Airport State to the above report.  

<iframe height=450 width=700 src='/embed/private/faa/airports?fields=airports.state,airports.facility_type,airports.count'>
</iframe>

Notice that each of the facility types are repeated for each state (that's what relational grouping does).  It would be much easier 
to read this if the facilities were columns instead of being repeated for for each state. We re-edit the the query so that Facility type 
is a col (pivot facility type).  

<iframe height=450 width=700 src='/embed/private/faa/airports?fields=airports.state,airports.facility_type,airports.count&pivots=airports.facility_type'>
</iframe>


Challenges Queries: ([Start Here](/explore/faa/airports))

How many airports have control towers in the US? [answer](/explore/faa/airports?fields=airports.with_control_tower_count)
What city in texas has the most heliports? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.city,airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&f%5Bairports.state%5D=TX&sorts=airports.count+desc)
How many Heliports have control towers? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&sorts=airports.count+desc&f%5Bairports.control_tower%5D=yes)
Where is the highest facility in the US? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state&limit=5&sorts=airports.elevation+desc)
Where is the highest airport? [amswer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state,airports.facility_type&limit=5&sorts=airports.elevation+desc&f%5Bairports.facility_type%5D=AIRPORT)


