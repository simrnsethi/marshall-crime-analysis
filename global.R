library(dplyr)
library(tidyverse)
library(stringr)
library(tidyverse)
library(dplyr)
library(tidyr)
library(reshape)
library(shinydashboard)
library(plotly)
library(shiny)
library(shinyjs)
data <- read_csv("data/ucr_crime_1975_2015.csv") %>% select(-c(ORI,source,url))

paraToChoose <- c("Homicides per 100k" = "homs_per_100k",
                    "Rape per 100k" = "rape_per_100k",
                    "Violent crimes per 100k" = "violent_per_100k",
                    "Roberies per 100k" = "rob_per_100k",
                    "Assaults per 100k" = "agg_ass_per_100k")

data 
# ggplot(data,aes(year,rape_per_100k)) +
#   geom_line(aes(group = department_name),alpha = 0.1) +
#   geom_line(data = data %>% filter(department_name %in% c("Albuquerque, N.M.","Arlington, Texas")),mapping = aes(year,rape_per_100k,group = department_name ,color = department_name )) +
#   xlab("year") + ylab("Chosen parameter") +
#   ggtitle("<Chosen paramter> vs year trend graph")


# data = separate(data = data, col = department_name, into = c("department_name", "state"), sep = "\\,")
# 
# 
# zip_codes <- read_csv("zip_codes_states.csv")
# zip_codes =  zip_codes[!duplicated(zip_codes[,c("city","state")]),]
# 
# zip_codes = merge(x = zip_codes,y = superzip[,c("city","state","adultpop")],by = c("city","state"),all.x = TRUE)
