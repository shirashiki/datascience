## R Cheat sheet
# Silvio Hirashiki 2014

# Download data from external source
# https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g
if(!file.exists("./data")){
	dir.create("./data")
}
library(httpuv)
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv") # in mac add: method="curl"
restData <- read.csv("./data/restaurants.csv")

# shows beginning and end of the dataset
head(restData,n=3)

tail(restData,n=5)

# Showing some data using SQL
library(sqldf)
sqldf("select count(*) from restData")