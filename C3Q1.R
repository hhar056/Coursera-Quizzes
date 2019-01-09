getwd()
setwd("Coursera Quizzes")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","2006 Housing Survey")
houseData<-read.csv("2006 Housing Survey")
head(houseData)
houseData$VAL<-as.numeric(houseData$VAL)
head(houseData$VAL>=14)
result<-sum(houseData$VAL>=24,na.rm=TRUE)
result

install.packages("rJava")
install.packages("xlsxjars")
install.packages("xlsx")
install.packages("XML")
install.packages("data.table")
library("rJava")
library("xlsxjars")
library("xlsx")
library("XML")
library("data.table")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","Natural Gas.xlsx", mode="wb")
dat<-read.xlsx("Natural Gas.xlsx",sheetIndex=1,rowIndex=18:23,colIndex=7:15)
head(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml","Restaurants.xml", mode="wb")
dat<-xmlTreeParse("Restaurants.xml", useInternal=TRUE)
head(dat)


topNode <- xmlRoot(dat)
xmlName(topNode)
topNode[1]
topNode[[1]][[1]]

els<-getNodeSet(topNode,"//row/row")
els
xmlSApply(els,function(x)xmlSApply(x,xmlValue))
class(test)
head(test)
t(test)
resultDF<-data.frame(t(test))
head(resultDF)
resultDF$zipcode<-as.numeric(as.character(resultDF$zipcode))
head(resultDF)
sum(as.numeric(resultDF$zipcode==21231))
resultDF$zipcode    


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "Communities.csv",mode="wb")
?fread
