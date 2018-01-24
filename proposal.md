# 1. Overview

I propose to build a shiny app to visualize the marshall data set on crime data across different cities inside the US, in order for someone to assess the change in rates of crimes such as homicides, assaults, rapes, violent crimes, and robberies across different cities. 

# 2. Description of the data

The Marshall dataset is crime data for 68 US cities from 1975-2015 covering four types of violent crimes (homicides, rape, robbery, and aggravated assault), both raw and normalized. It was collected and curated by [The Marshall Project](https://www.themarshallproject.org). I have fetched the dataset from this site The fields are:

* ORI (unique identifier)
* year
* department_name (city name)
* total_pop (population of the city)
* homs_sum
* rape_sum
* rob_sum
* agg_ass_sum
* violent_crime (rollup of all four crime types)
* months_reported
* violent_per_100k
* homs_per_100k
* rape_per_100k
* rob_per_100k
* agg_ass_per_100k
* source
* url

You can find a detailed description of the dataset and its provenance at [The Marshall Project's GitHub page](https://github.com/themarshallproject/city-crime).

I will try and render a shiny app on this dataset.



# 3. Usage scenario & tasks


Tim is a regular US citizen who wants to change his city and start his new life with his new family (he got married recently and has a baby now). Also he is employed with the police department in his current city. He wants to know which city has a growing or a declining number of murders, robbers, rapisits and other violent criminals. He can do this with this app which will help him understand the current trends in the criminal activity.


# 4. Description of app & initial sketch

The app contains a landing page would contain a graph that would help to analyze the trend of the selected parameters such as assaults, rapes, robberies, homicides per capita vs year. The user will then be able to select a city for which he can analyze the trend versus the other cities in the data.

![](proposal.png)

Presented above is the initial sketch of the app.
