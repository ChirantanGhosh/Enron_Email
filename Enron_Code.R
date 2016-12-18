library(readr)
library(ggplot2)
library(stringr)
library(plyr)
library(dplyr)
  

data <- read_csv("C:\\Users\\Chirantan\\Desktop\\ds\\emails.csv")

splitfile <- distinct(data[,1])
head(splitfile)

filesplit <- str_split_fixed(splitfile$file, "-", 2)

unique_user <- unique(filesplit[,1])

All_user_repeated <- filesplit[,1]

user <- table(All_user_repeated)

sortuser <- sort(user, decreasing = T)
top20user <- sortuser[1:20]


From <- str_extract_all(data$message, "From:.*")
split_from <- str_split_fixed(From, ",", 2)
From_user <- str_sub(split_from[,1], start=9, end=-2L)

Freq_From_user <- table(From_user)
sort_From_user <- sort(Freq_From_user, decreasing = T)
Top20_From_user <- sort_From_user[1:20]
Top20_From_user


To <- str_extract_all(data$message, "To:.*")
split_To <- str_split_fixed(To, ",", 2)
To_user <- str_sub(split_To[,1], start = 7, end = -2L)

Freq_To_user <- table(To_user)
sort_To_user <- sort(Freq_To_user, decreasing = T)
Top20_To_user <- sort_To_user[1:20]
Top20_To_user


Date <- str_extract_all(data$message, "Date:.*")
Day <- str_sub(Date, start=6, end=9)
Date_split <- str_split_fixed(Date, ",", 2)
Again_split <- str_split_fixed(Date_split[,2], ",", 2)

Date1 <- str_sub(Again_split[,1], start =1, end =-21L)
year <- str_sub(Date1, start = -5L, end = -1L)
bb <- as.matrix(year)
Freq_year <- table(year)
sort_year <- sort(Freq_year, decreasing = T)
Top5_year <- sort_year[1:4]


time <- str_sub(Again_split[,1], start = 14L, end = -16L)

Freq_time <- table(time)


   

          
