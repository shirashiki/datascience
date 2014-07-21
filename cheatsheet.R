## R Cheat sheet
# Silvio Hirashiki 2014

# Check if value is numeric
myVector <- c("1","a","3")
is.numeric(myVector) # this returns false as vector is not numeric
is.numeric(myVector[1]) # False as the whole vector is numeric

myVector <- c(1, 23, 99, NA)
is.numeric(myVector)
# element 4 is both numeric and NA
is.numeric(myVector[4])
is.na(myVector[4])


# Download data from external source
# https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g
if(!file.exists("./data")){
	dir.create("./data")
}
library(httpuv)
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv") # in mac add: method="curl"
restData <- read.csv("./data/restaurants.csv")


# display structure of the object
str(restData)


# shows beginning and end of the dataset
head(restData,n=3)

tail(restData,n=5)

# Showing some data using SQL
library(sqldf)
sqldf("select count(*) from restData")

# Check if columns have NA: this returns the quantity of NA's per column
colSums(is.na(restData))

# brings a summary
summary(restData)

# gets value with specific characteristics, select in...
table(restData$zipCode %in% c("21212","21213"))

# the same using SQL
sqldf("select count(*) as count_in from restData where zipCode in ('21212', '21213')")
sqldf("select count(*) as count_not from restData where zipCode not in ('21212', '21213')")

# filter the data
restData[restData$zipCode %in% c("21212","21213"),]

