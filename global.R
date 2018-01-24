library(dplyr)
library(tidyverse)
library(stringr)
library(tidyverse)
library(dplyr)
library(tidyr)
library(reshape)

data <- read_csv("ucr_crime_1975_2015.csv")

paraToChoose <- c("Homicides per 100k" = "homs_per_100k",
                    "Rape per 100k" = "rape_per_100k",
                    "Violent crimes per 100k" = "violent_per_100k",
                    "Roberies per 100k" = "rob_per_100k",
                    "Assaults per 100k" = "agg_ass_per_100k")

# ggplot(data,aes(year,rape_per_100k)) +
#   geom_line(aes(group = department_name),alpha = 0.1) +
#   geom_line(data = data %>% filter(department_name == "Albuquerque, N.M."),mapping = aes(year,rape_per_100k,color = "red")) +
#   xlab("year") + ylab("Chosen parameter") +
#   ggtitle("<Chosen paramter> vs year trend graph") +
#   scale_color_manual(name = "",values = c("red"),labels = c('label'))


# data = separate(data = data, col = department_name, into = c("department_name", "state"), sep = "\\,")
# 
# 
# zip_codes <- read_csv("zip_codes_states.csv")
# zip_codes =  zip_codes[!duplicated(zip_codes[,c("city","state")]),]
# 
# zip_codes = merge(x = zip_codes,y = superzip[,c("city","state","adultpop")],by = c("city","state"),all.x = TRUE)
