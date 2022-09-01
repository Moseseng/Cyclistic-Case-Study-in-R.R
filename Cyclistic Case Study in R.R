library(tidyverse)
library(readr)
library(dplyr)
library(lubridate)
library(magrittr)



library(readr)
##link of databse (https://divvy-tripdata.s3.amazonaws.com/index.html)
X202004_divvy_tripdata <- read_csv("New folder/202004-divvy-tripdata.csv")
X202005_divvy_tripdata <- read_csv("New folder/202005-divvy-tripdata.csv")
X202006_divvy_tripdata <- read_csv("New folder/202006-divvy-tripdata.csv")
X202007_divvy_tripdata <- read_csv("New folder/202007-divvy-tripdata.csv")
X202006_divvy_tripdata <- read_csv("New folder/202006-divvy-tripdata.csv")
##we repeat this code to all file for upload
colnames(X202004_divvy_tripdata) ##we repeat this code to all file formake sure the column names of the datasets are consistent

## We combine the datasets vertically using rbind()

total_data_v1 <- rbind(X202004_divvy_tripdata, X202005_divvy_tripdata,X202006_divvy_tripdata,X202007_divvy_tripdata,X202008_divvy_tripdata,X202009_divvy_tripdata,X202010_divvy_tripdata,X202011_divvy_tripdata,X202012_divvy_tripdata,X202101_divvy_tripdata,X202102_divvy_tripdata,X202103_divvy_tripdata,X202104_divvy_tripdata)

head(total_data_v1)
str(total_data_v1)
#Cleaning the Dataset 

#started_at an ended_at columns are type chr. We will convert them to the proper date column type. We will convert dates to the calender time format

total_data_v1$started_at <- as.POSIXct(total_data_v1$started_at, format = "%Y-%m-%d %H:%M:%S")
total_data_v1$ended_at <- as.POSIXct(total_data_v1$ended_at, format = "%Y-%m-%d %H:%M:%S")
str(total_data_v1)

##To remove NA/null values from our dataset we will run the following code and assign the resulting dataset as v2.

total_data_v2 <- na.omit(total_data_v1)

##We must construct additional variables or columns with information that will help with analysis in order to get our data ready for analysis.
#To display the entire duration of each ride, we must establish a variable. This calculation is not by default present in our dataset. Therefore, we must produce this by deducting end time from start time. We'll refer to this column as
#We also need to add a date column, followed by day and month columns. These will enable us to evaluate travel on a daily and monthly basis. Our date column currently displays the complete date and local time. We'll make separate columns for the day and the month.

total_data_v3 <- mutate(total_data_v2, ride_length = difftime(ended_at, started_at, units = "mins"))
str(total_data_v3)







































