# Lesson 1.1: Landing is more important than Flying

In Looker, all questions start on the explore page. Each **explore** starts from one **view** in the model, which is the same as saying one table in the underlying database. The explore that we are in matters - it dictates what information is available to us. 

Here, we start by selecting **[Explore Airports](/explore/faa/airports)**. That means all the information we are about to look at comes from the airports table in the FAA's database. By starting here, we'll be able to see any information that pertains to an airport in the FAA database - takeoffs, landings, and so forth. We won't see any information pertaining to airports *outside* of the FAA database. In this case, that means foreign airports. 

### Important Terms in Looker
Knowing the following terms will make navigating Looker much easier. Throughout these pages, important terms that you should know will be **bolded.**

- A **field** is either a dimension or a measure.
- A **dimension** is what you group or slice data by; 
- A **measure** is an aggregate, like a count, sum or average
- The **field picker**, a column found on the left side of the page, contains all of the available dimensions and measures in the current explore

Now let's get to it! We'll start where any good exploration begins - with a question, also called a **query**:
<br />

## How many American airports are there?

To find out, we'll count airports. Remember, a count is a measure. We simply select AIRPORTS Count and **run** the query.

    Measures:  
      AIRPORTS Count


<look height="75">
  model: faa
  base_view: airports
  measures: airports.count
</look>

Wow, 19,793.  That's a lot of airports.  Where are all of those?  Let's see which state they are in.  

## How many airports are in each state & which has the most? 

To do this, we select a dimension called AIRPORT State, which adds that dimension into our table. When we run the query, we see the 19,793 airports broken out over different states.

Then, to find out which state has the most airports, we simply **sort** the data. All we need to do is click on the column header for amount that we want to sort by. In this case, that is the AIRPORTS Count column, which will sort by the number of airports, descending (from largest to smallest).

    Dimensions: 
      AIRPORTS State
    Measures: 
      AIRPORTS Count  
    Sorts: 
      AIRPORTS Count (Descending)
 

<look height="200">
  model: faa
  base_view: airports
  dimensions: airports.state
  measures: airports.count
</look>


It looks like Texas has almost twice as many airports as California! Where do they keep all those?  You can see the list of airports in any state by clicking the corresponding number in the AIRPORTS Count column. For example clicking the 890 across from IL will show you a list of airports there. Showing this additional information about a part of a returned query is also called a **drill** into the data.


<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: airports.detail*
  filters:
    airports.state: IL
</look>

## Can we just see a specific type of airport?

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

In Looker, every query leads to many, many more queries. Whenever you click on a link in a table in Looker, you are writing a new query.  The entire query is encoded in the URL of the link.  Looker figures out queries you might want to execute and writes them all for you so you can have a web browsing experience when viewing your data.

## What's the breakdown of airport types?

To answer this question, we have to clear our Explore page. We can do this by using the gear icon in the upper right and select "Remove Fields and Filters" or we can use a keyboard shortcut - command and "K". 

*Pro Tip: Pressing the question mark key ("?") on the Explore page brings up all shortcuts!* 

Now let's find out how many of each type of airport there are:

    Dimensions: 
      AIRPORTS Facility Type
    Measures: 
      AIRPORTS Count
 

<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: airports.facility_type
  measures: airports.count
</look>

But what if, as above, we want to know how these are broken down by state? Add AIRPORTS State to the above report:

<look height="200" width="100%">
  model: faa
  base_view: airports
  dimensions: [airports.state, airports.facility_type]
  measures: airports.count
</look>

Notice that each of the facility types are repeated for each state (that's what relational grouping does).  It would be much easier to read this if the facilities were columns instead of being repeated for each state. Re-edit the the query so that facility type is a column (hint: pivot by facility type).  

<look height="300" width="100%">
  model: faa
  base_view: airports
  dimensions: [airports.state, airports.facility_type]
  pivots: airports.facility_type
  measures: airports.count
</look>

You just learned a new skill! **Pivot** is a way to sort data to make viewing tables easier. You can pivot by any dimension in the query by clicking on the gear icon next to the field name (it appears when you hover) and selecting pivot or by clicking on "pivot" next to the field name in the field picker.


 [**Continue to Lesson 1.2**](001_fly_away_home.md) or [Return to the Learn Homepage](/stories/lookml_design_patterns/000_index.md)
