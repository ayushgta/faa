# Example 1: Landing is more important than Flying

In Looker, all questions start on the explore page. Each **explore** starts from one **view** in the model, which is the same as saying one table in the underlying database. The explore that we are in matters - it dictates what information is available to us. 

Here, we start by selecting **[Explore Airports](/explore/faa/airports)**. That means all the information we are about to look at comes from the airports table in the FAA's database. By starting here, we'll be able to see any information that pertains to a U.S. airport - takeoffs, landings, and so forth. What we WON'T be able to see, for example,  are airlines that don't operate flights in the USA. That's because they won't have any data related to a U.S. airport.

A few more terms to know: 

- A **field** is either a dimension or a measure. 
- A **dimension** is what you group or slice data by; 
- A **measure** is an aggregate, like a count, sum or average

Now let's get to it! We'll start where any good exploration begins - with a question: Exactly how many airports are there?

## How Many Airports Are In the US?

To find out, we'll count airports. Remember, a count is a measure. We simply select AIRPORTS Count and **run** the query.

    Measures:  
      AIRPORTS Airports


<look height="75">
  model: faa
  base_view: airports
  measures: airports.count
</look>

Wow, 19,793.  That's a lot of airports.  Where are all of those?  Let's see which state they are in.  

To do this, we select a dimension called AIRPORT State. This will group the airports by state. It would also be fun to know which state has the most airports, so we'll click on the column header for the AIRPORTS Count to sort by the number of airports, descending (from largest to smallest).

    Dimensions: 
      AIRPORTS State
    Measures: 
      AIRPORTS Count
    Sort: 
      AIRPORTS Count (Descending)


<look height="200">
  model: faa
  base_view: airports
  dimensions: airports.state
  measures: airports.count
</look>

It looks like Texas has almost twice as many airports as California! Where do they keep all those?  You can see the list of airports in any state by clicking the number across from it in the AIRPORTS Count column.  For example clicking the 890 across from IL will show you a list of airports there. Showing this additional information about a part of a returned query is also called a **drill** into the data.

<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: airports.detail*
  filters:
    airports.state: IL
</look>


You will notice that some of the airports are Heliports, some are Airports and some are Seaplane bases.  If you click on any of the types,  it will modify your query to be limited by what you clicked on.  Click on "HELIPORT'.  
 
<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: airports.detail*
  filters:
    airports.state: IL
    airports.facility_type: HELIPORT
</look>


Notice what happens? Now we only see heliports in the list.   Could we have written this query directly?  Yes!  
Simply selecting the fields and filters in the explore plage would also yield these results.

In Looker, every query leads to many, many more queries. Whenever you click on a link in a table in Looker, you are writing a new query.  The entire query is encoded in the URL of the link.  Looker figures out queries you might want to execute and writes the them all for you so you can have a web browsing experience when viewing your data.



### Test Your Skills

Guided Challenge:  How many of each facility type are there in the US?  

See if you can make a report that looks like the one below.  Start here:  [Explore Airports](/explore/faa/airports)

<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: airports.facility_type
  measures: airports.count
</look>

Looker has a powerful feature that lets you turn any grouped attribute into a column.  Add Airport State to the above report.  

<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: [airports.state, airports.facility_type]
  measures: airports.count
</look>

Notice that each of the facility types are repeated for each state (that's what relational grouping does).  It would be much easier to read this if the facilities were columns instead of being repeated for each state. Re-edit the the query so that facility type is a column (hint: pivot facility type).  

<look height="300" width="100%">
  model: faa
  base_view: airports
  dimensions: [airports.state, airports.facility_type]
  pivots: airports.facility_type
  measures: airports.count
</look>

You just learned a new skill! **Pivot** is a way to sort data to make viewing tables easier. You can pivot by any dimension in the query by clicking on the gear icon next to the field name and selecting pivot or by clicking on "pivot" next to the field name on the left of the screen.

### Challenge Queries: ([Start Here](/explore/faa/airports))

How many airports have control towers in the US? [answer](/explore/faa/airports?fields=airports.with_control_tower_count)
What city in texas has the most heliports? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.city,airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&f%5Bairports.state%5D=TX&sorts=airports.count+desc)
How many Heliports have control towers? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.count&f%5Bairports.facility_type%5D=HELIPORT++++++&sorts=airports.count+desc&f%5Bairports.control_tower%5D=yes)
Where is the highest facility in the US? [answer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state&limit=5&sorts=airports.elevation+desc)
Where is the highest airport? [amswer](/explore/faa/airports?show=data,fields&vis=%7B"type":"looker_column"%7D&fields=airports.code,airports.full_name,airports.elevation,airports.state,airports.facility_type&limit=5&sorts=airports.elevation+desc&f%5Bairports.facility_type%5D=AIRPORT)


 [Continue to Example 2](001_fly_away_home.md) or [Return to the Learn Homepage](000_index.md)  
