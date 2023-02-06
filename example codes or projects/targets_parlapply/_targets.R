library(targets)
source("scripts/functions/parallel_functions.R")


# # configuring the script it should run(run it one time and it will create an targets.yaml file in the project folder)
# tar_config_set(script = "scripts/2._targets_pattern.R")

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
  
  #doing with sentiment analysis with parallelization
  tar_target(sentiment_analysis, 
             extract_sentiment(data, cleaning_text)), 
  #doing with sentiment analysis without parallelization
  tar_target(sentiment_analysis_simple, 
             extract_sentiment_simple(data, cleaning_text))
)

