library(targets)
library(future)
library(future.callr)
plan(callr)
source("scripts/functions/parallel_functions.R")
#source("R/different_code.R")

# Set packages.
tar_option_set(packages = c("qs", "dplyr", "stringr", "stringi", "ggplot2", "data.table", "parallel", "tidytext", "stopwords"),
               format = "qs")

# End this file with a list of target objects.
list(
  #reading in the news data
  tar_target(data, 
             read_news()),
  
  #cleaning the text
  tar_target(cleaning_text, 
             clean_text(data)),
  
  #doing with sentiment analysis without parallelization
  tar_target(sentiment_analysis, 
             extract_sentiment(data, cleaning_text))
)

