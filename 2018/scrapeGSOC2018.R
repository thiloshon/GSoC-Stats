library(jsonlite)


part01 <- fromJSON("2018/data01.json")
organizations01 <- part01$results

part02 <- fromJSON("2018/data02.json")
organizations02 <- part02$results


organizations2018 <- rbind(organizations01, organizations02)
organizations2018 <- organizations2018[, c(2, 4, 5, 9, 19, 20, 21)]


