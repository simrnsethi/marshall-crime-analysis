library('tidyverse')
library('stringr')
library('shinydashboard')
library('plotly')
library('shiny')
library('shinyjs')
library("DT")
library('dplyr')
library('markdown')
library('tidyr')

# reads in and joins the data with the state codes
data <- read_csv("data/ucr_crime_1975_2015.csv") %>% select(-c(ORI,source,url)) %>% separate(department_name,c("city","state_1"),",")

state_and_city <- read_csv("data/city_state.csv")

data  = merge(x = data,y = state_and_city, by = "city",all.x = TRUE)

paraToChoose <- c("Homicides per 100k" = "homs_per_100k",
                    "Rape per 100k" = "rape_per_100k",
                    "Violent crimes per 100k" = "violent_per_100k",
                    "Roberies per 100k" = "rob_per_100k",
                    "Assaults per 100k" = "agg_ass_per_100k")

data
