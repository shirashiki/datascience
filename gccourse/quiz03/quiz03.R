# Code for Quiz 03

## Question 1

# Download data from external source
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
if(!file.exists("./data")){
    dir.create("./data")
}
library(httpuv)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/acssurvey.csv", method="curl") 
acsData <- read.csv("./data/acssurvey.csv")

## creates a logical vector when household > 10 acres
logVector <- (acsData$ACR==3 & acsData$AGS==6)

which(logVector)

## Question 2
install.packages("jpeg")
library(jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./data/jeff.jpg", method="curl") 
imageData <- readJPEG("./data/jeff.jpg", native=TRUE)
quantile(imageData, probs=c(0.3, 0.8))

## Question 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,destfile="./data/fgdp.csv", method="curl")
fgdp <- read.csv("./data/fgdp.csv")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,destfile="./data/educ.csv", method="curl")
educ <- read.csv("./data/educ.csv")

library(sqldf)
# cannot select column named as Gross.domestic.product.2012,
# so I will change column name
colnames(fgdp)[2] = "gdp2012"

# generates a new data frame only with the 190 ranked
f <- 1:190
lv <- (fgdp$gdp2012 %in% f)
nfgdp <-fgdp[lv,]


sqldf("select count(educ.CountryCode) from educ inner join
    nfgdp on educ.CountryCode = nfgdp.X")


sqldf("select CountryCode from educ where CountryCode not in
(select X from fgdp)")



colnames(nfgdp)[4] = "country"
# 189

countries <- sqldf("select * from nfgdp where X in 
                   (select CountryCode from educ) ")

# Spain




# Question 4
colnames(educ)[3] = "IncomeGroup"
sqldf("select avg(nfgdp.gdp2012) 
        from educ inner join
        nfgdp on educ.CountryCode = nfgdp.X
        and educ.IncomeGroup='High income: OECD'")

sqldf("select avg(nfgdp.gdp2012) 
        from educ inner join
        nfgdp on educ.CountryCode = nfgdp.X
        and educ.IncomeGroup='High income: nonOECD'")


# Question 5
colnames(nfgdp)[5] = "income"

#removes commas
nfgdp$income <- gsub(",","",nfgdp$income)
nfgdp$income <- gsub(" ","",nfgdp$income)

quantile(as.numeric(as.character(nfgdp$income)), probs=c(0.2, 0.4, 0.6, 0.8,1))
#      20%        40%        60%        80%       100% 
# 4256.2    15709.8    50529.2   262644.0 16244600.0 

sqldf("select * from nfgdp where income < 15709.8 and gdp2012 >= 38 ")