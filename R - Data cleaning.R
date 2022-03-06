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

# Create a data frame to further inspect the data

met_summary <- skim_without_charts(met_objects_clean)


# Find null values in selected columns
met_objects_clean %>%
  select(object_number, object_id, link_resource)%>%
  is.na()%>%
  sum()

# Inspect and fix columns values with white spaces

met_objects_clean$dimensions <- trimws(met_objects_clean$dimensions)
met_objects_clean$portfolio <- trimws(met_objects_clean$portfolio)
met_objects_clean$medium <- trimws(met_objects_clean$medium)
met_objects_clean$credit_line <- trimws(met_objects_clean$credit_line)


# Split string values of 'tags' into a list

met_objects_clean$tags <- str_split(met_objects_clean$tags, fixed("|"))


#This adds a column that count the number of tags

met_objects_clean <- met_objects_clean%>%
  mutate(tag_count=lengths(tags))%>%
  relocate(tag_count, .after = tags)
# [FIX] NA values counted as 1





