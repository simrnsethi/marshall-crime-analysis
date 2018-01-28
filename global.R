library('tidyverse')
library('stringr')
library('shinydashboard')
library('plotly')
library('shiny')
library('shinyjs')
library("DT")
library('dplyr')
library('markdown')

data <- read_csv("data/ucr_crime_1975_2015.csv") %>% select(-c(ORI,source,url))

paraToChoose <- c("Homicides per 100k" = "homs_per_100k",
                    "Rape per 100k" = "rape_per_100k",
                    "Violent crimes per 100k" = "violent_per_100k",
                    "Roberies per 100k" = "rob_per_100k",
                    "Assaults per 100k" = "agg_ass_per_100k")

data
