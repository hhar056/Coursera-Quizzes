getwd()
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
library("rJava")
library("xlsxjars")
library("xlsx")


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","Natural Gas")
dat<-read.xlsx("Natural Gas.xlsx",startRow=18,endRow=23,)
