library(dbplyr)
library(dplyr)
library(RPostgreSQL)

install.packages('dbplyr')
install.packages('RPostgreSQL')
install.packages('nycflights13')

con <- dbConnect(
  host = 'db',
  port = 5432,
  RPostgreSQL::PostgreSQL(),
  user = 'mhermans',
  password = 'temppwd')

copy_to(
  con, nycflights13::flights, "flights",
  temporary = FALSE, 
  indexes = list(
    c("year", "month", "day"), 
    "carrier", 
    "tailnum",
    "dest"
  )
)

flights_db <- tbl(con, "flights")

flights_db %>% tally()
library(lubridate)
flights_db %>%
  # collect() %>%
  mutate(date = ymd(paste0(year, '-06-15')))

flights_db %>% 
  group_by(dest) %>%
  summarise(delay = mean(dep_time))

db_list_tables(con)

copy_to(
  con, lgs, "leden",
  temporary = FALSE, 
  indexes = list(
    c("selectiemaand", "guid")))

