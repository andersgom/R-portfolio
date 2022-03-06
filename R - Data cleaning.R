# Data cleaning in R

library(tidyverse)
library(dplyr)
library(skimr)
library(janitor)


# Summary of the dataset
skim_without_charts(met_objects)
summary(met_objects)
colnames(met_objects)


# Clean column names
met_objects_clean <- clean_names(met_objects)

# Convert data type

met_objects_clean$object_id <- as.character(met_objects_clean$object_id)
met_objects_clean$constituent_id <- as.character(met_objects_clean$constituent_id)


# Find null values in selected columns
met_objects_clean %>%
  select(object_number, object_id, link_resource)%>%
  is.na()%>%
  sum()

# Find duplicates





# Tasks after checking the summary:
# - Clean column names
# - Change the data type of 'object_id' and 'constituent_id'
# 
# - Delete white spaces in several columns ('portfolio', 'medium', 'dimensions' and 'credit_line')
# - Split the values in 'tags' into multiple columns








