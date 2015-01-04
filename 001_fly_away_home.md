# Lesson 1.2: Fly Away Home, Safely

To ask great questions, it's important to know what data you have to explore. Let's learn a little bit more about our data. [Somewhere on the net](http://www.ntsb.gov/aviationquery/index.aspx), we found a copy of the FAA database in SQL. This database contains data about:

+ 38M flights
+ 376K airplane registrations
+ 19K airports
+ 70K accidents
+ and more.

Remember, every exploration begins with a question, and here's ours: what's the deal with those 70K airline accidents?

Because we're asking questions about accidents, we select [Explore Accidents](/explore/faa/accidents) to target the data that we are looking at.

## How many accidents are in our database?

This time, we will use a shorthand for writing the queries. In [Example One](000_landing_is_more_important_than_flying.md) we learned about fields. Here, you will see the name of the field you should select. A great way to learn is to enter the queries yourself, instead of just clicking the result  links (finger memory). Check if you got the answers right by clicking the result link below.

Try an easy one. How many accidents are in our database?

    Measures:
      ACCIDENTS Count

results in:

<look height="100" width="200">
  model: faa
  base_view: accidents
  measures: accidents.count
</look>


## Are there more or less accidents over time?

To see this, we want to group the accidents by year (combine all the accident rows with the same year) and compute the number of accidents for each combined group.  Sort the results by year, so we can see this change over time. Below, we have expressed the results as a line graph. A line graph requires one dimension and one measure.

    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
    Sorts: 
      ACCIDENTS Event Year 

Results in:


<look height="400" width="100%">
  model: faa
  type: looker_line
  base_view: accidents
  dimensions: accidents.event_year
  measures: accidents.count
  sorts: accidents.event_year
</look>


## Can we get rid of the useless data?

Good news - it looks like a downward trend, except we don't really have good data before 1982. It would be useful to clean up the query so that we only see data from 1982 to 2010. To do this, we need to filter the data. **Filter** allows us to look only at a subset of the information that exists in the database. Just like pivots, you can filter data by selecting "filter" from the gear icon next to the dimension or by selecting "filter" from next to the field name on the left side of the screen.

    Filters:
      ACCIDENTS Event Year: 1982 to
    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
    Sorts: 
      ACCIDENTS Event Year 
 
Results in:

<look height="400" width="100%">
  model: faa
  type: looker_line
  base_view: accidents
  dimensions: accidents.event_year
  measures: accidents.count
  filters:
    accidents.event_year: 1982 to
  sorts: accidents.event_year
</look>


## Are fatalities following the same trend as accidents?

Let's see if Fatalities have declined the way that accidents have. We can add a couple of measures that might help us: 'Fatal Accidents Count' and 'Total Fatalities'. Note that as we add more measures to a graph, each measure appears separately.

    Filters:
      ACCIDENTS Event Year: 1982 to
    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
      ACCIDENTS Fatal Accidents Count
      ACCIDENTS Total Fatalities
    Sorts: 
      ACCIDENTS Event Year 

Results in:

<look height="400" width="100%">
  model: faa
  type: looker_line
  base_view: accidents
  dimensions: accidents.event_year
  measures: [accidents.count,accidents.total_fatalities,accidents.fatal_accidents_count]
  filters:
    accidents.event_year: 1982 to
  sorts: accidents.event_year
</look>


A nice downward trend for both accidents and fatal accidents!  It does look like 1996 was a bad year to fly, though...


## What about outliers?

Often, times you want to find the 'most' or 'best' or 'busiest' of something. Airplanes can crash more than once (actually, this is an incident database, so many aren't crashes). What is the most times an airplane has crashed?

To solve this, we are going to group the accidents by 'registration_number' (this is also called Tail Number). This is the unique identifier the FAA assigns to airplanes. And we are going to count up the number of accidents. Because most of the planes have just 1 accident, we are going to sort the result set by # accidents descending (from largest to smallest).  We only want to look at the top contenders so we are going to limit the result set to 10 results. A **row limit** constrains the number of lines of results that will be returned from the database. To set the row limit, type a number into the box on the right-hand corner of the bar marked DATA. 

    Dimensions:
      ACCIDENTS Registration Number
    Measures:  
      ACCIDENTS Count
    Sorts: 
      ACCIDENTS Count (decending)
    Row Limit: 10

<look height="400" width="100%">
  model: faa
  base_view: accidents
  dimensions: accidents.registration_number
  measures: accidents.count
  sorts: accidents.count desc
</look>


The first 4 results are junk. In row 1, the tail number is listed as 'None'; in row 2, it has been omitted; in row 3, it is Unknown; and row 4 is some USAF aircraft. At row 5 we get to our first actual plane. Wow - there is an aircraft that has crashed 8 times. Turns out this haunted Cessna has been flying around Alaska injuring people for years. Remember, clicking on (or drilling into) the '8' in row 5 will show additional details. 

<look height="400" width="100%">
  model: faa
  base_view: accidents
  dimensions: accidents.detail*
  filters:
    accidents.registration_number: N20752
</look>


Clicking on any of the triangles will take you to the NTSB accident reports.

Pretty amazing.  This one aircraft has had 8 incidents.  I'm not sure I'd get on that one...
As you can see, sorting is a powerful relational querying tool. Using it, we can put the thing we are most interested in at the top of the report.


[Continue to Lesson 1.3](002_seating_bull.md) or [Return to the Learn Homepage](/stories/lookml_design_patterns/000_index.md)