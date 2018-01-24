
# The Marshall Project Dataset Shiny app

The Marshall dataset is crime data for 68 US cities from 1975-2015 covering four types of violent crimes (homicides, rape, robbery, and aggravated assault), both raw and normalized. It was collected and curated by [The Marshall Project](https://www.themarshallproject.org). The fields are

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
