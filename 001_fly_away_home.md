# Fly Away Home, Safely

You have to love the Freedom of Information Act.

The NTSB makes all of its data freely available. [Somewhere on the net](http://www.ntsb.gov/aviationquery/index.aspx), I found a copy of the FAA database in SQL. This database contains data about

+ 38M flights
+ 376K airplane registrations
+ 19K airports
+ 70K accidents
+ and more.

This is an awesome database for build test queries. The flight database is large enough to be challenging 
to query. The data is inter-related enough to make challenging joins (flights have joins for both 
origin and destination airports). And asking questions about aircraft accidents is both terrifying and fun.

Follow along with the queries below. 

## [Explore Airports](/explore/faa/accidents)


## How many accidents are in our database?

We will use a shorthand for writing the queries. You will see the name of the field you 
should select and (if its a filter or a sort, the expression you should use to filter 
the query). A great way to learn is to enter the queries yourself, instead of just clicking the 
result  links (finger memory). Result link is presented below to see if you got it right.

Try an easy one.

    Measures:
      ACCIDENTS Count

results in:

<iframe height=150 width=200 src='/embed/private/faa/accidents?show=data,fields&vis=%7B"type":"table"%7D&fields=accidents.count&sorts=accidents.count+desc'>
</iframe>


## Are there more or less accidents over time?

To see this, we want to group the accidents by year (combine all the accident rows with the same year) and compute the measure '# Accidents' for each combined group.  We'll sort the results by year so we can see this change over time.

    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
    Sort: 
      ACCIDENTS Event Year 

Results in:

<iframe height=400 width=700 src='/embed/private/faa/accidents?show=vis,data,fields&vis=%7B"type":"looker_line","show_null_labels":false,"show_null_points":true%7D&fields=accidents.event_year,accidents.count&sorts=accidents.event_year'>
</iframe>

## Get rid of the noise?

Good news, it looks like a downward trend. It looks like we don't have good data before 1982 so lets modify the query to only look at data from 1982 to 2010:

    Filter:
      ACCIDENTS Event Year: 1982 to
    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
    Sort: 
      ACCIDENTS Event Year 
 
Results in:

<iframe height=400 width=700 src='/embed/private/faa/accidents?show=vis,data,fields&vis=%7B"type":"looker_line","show_null_labels":false,"show_null_points":true%7D&fields=accidents.event_year,accidents.count&sorts=accidents.event_year&f%5Baccidents.event_year%5D=1982+to'>
</iframe>

## Nice downward trend, but are we safer? Let's look at fatalities.

Let's see if Fatalities are down to as well as accidents. We can add a couple of measures 
that might help us: 'Fatal Accidents Count' and 'Total Fatalities'.

    Filter:
      ACCIDENTS Event Year: 1982 to
    Dimensions: 
      ACCIDENTS Event Year
    Measures: 
      ACCIDENTS Count
      ACCIDENTS Fatal Accidents Count
      ACCIDENTS Total Fatalities
    Sort: 
      ACCIDENTS Event Year 

Results in:

<iframe height=400 width=700 src='/embed/private/faa/accidents?show=vis,data,fields&vis=%7B"type":"looker_line","show_null_labels":false,"show_null_points":true%7D&fields=accidents.event_year,accidents.count,accidents.total_fatalities,accidents.fatal_accidents_count&sorts=accidents.event_year&f%5Baccidents.event_year%5D=1982+to'>
</iframe>

Looks like a nice downward trend of both accidents and fatal accidents.  But it does 
look like 1996 was a bad year to fly.


## Find outliers with sorting

Often, times you want to find the 'most' or 'best' or 'busiest' of something. Airplanes 
can crash more then once (actually, this is an incident database, so many aren't 
crashes). What is the most time an airplane has crashed?

To solve this, we are going to group the accidents by 'registration_number' 
(this is also called Tail Number). This is the unique identifier the FAA assigns to airplanes. 
And we are going to count up the '# Accidents'. Because most of the planes have just 
1 accident, we are going to sort the result set by # accidents descending (from largest 
to smallest).  We only want to look at the top contenders so we are going to limit the 
result set to 10 results.

    Dimensions:
      ACCIDENTS Registration Number
    Measures:  
      ACCIDENTS Count
    Sort: 
      ACCIDENTS Count (decending)
    Limit: 10

<iframe height=300 width=300 src='/embed/private/faa/accidents?fields=accidents.registration_number,accidents.count&limit=10&sorts=accidents.count+desc&show=data,fields&vis=%7B"type":"table","show_null_labels":false%7D'>
</iframe>

The first 4 results are junk. Row #1, tail number is listed as 'None', Row #2 it has 
been omitted, Row #3, is Unknown, Row #4 is some USAF aircraft, but starting with row #5 
we get to our first actual plane. Yes, there is an aircraft that has crashed 8 times. 
urns out this haunted Cessna has been flying around Alaska injuring people for years. 
Clicking on the '8' in row 5 to see the detail.

<iframe height=400 width=700 src='/embed/private/faa/accidents?fields=accidents.event_id,accidents.event_date,accidents.registration_number,accidents.location,accidents.investigation_type,accidents.severity&f%5Baccidents.registration_number%5D=N20752&limit=500&show=data,fields&vis=%7B"type":"table"%7D&sorts=accidents.event_date+desc'>
</iframe>


Clicking on any of the triangles will take you to the NTSB accident reports.

Pretty amazing.  This one aircraft has had 8 incidents.  I'm not sure I'd get on that one.
It looks like its all happening in Alaska.  I guess that's understandable.

Sorting is a powerful relational querying tool. Using it, we can put the thing we are most 
interested in at the top of the report.

Later, we'll talk about how to eliminate 'Junk' from our queries.

