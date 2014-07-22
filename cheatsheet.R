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


#Creating sequences
s1 <- seq(1,10,by=2) ; s1
# result: [1] 1 3 5 7 9
s2 <- seq(1,10,length=3); s2
#result: [1]  1.0  5.5 10.0

x <- c(1,3,8,25,100); seq(along = x)
# creates a sequence aligned with vector x: [1] 1 2 3 4 5




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

# gets object size
object.size(restData)
print(object.size(restData), units="Mb")

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



## creating some variables and adding to data frame

# converts zipCode column to factor and adds to data frame 
restData$zipf <- factor(restData$zipCode)
restData$zipf[1:10]


## Reshaping data

library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)

# the melt function puts data in a key/value format
carMelt[carMelt$carname=="Mazda RX4",]
