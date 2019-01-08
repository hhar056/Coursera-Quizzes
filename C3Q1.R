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


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","C3Q1/Natural Gas.xlsx")
dat<-read.xlsx("C3Q1/Natural Gas.xlsx",sheetIndex=1,rowIndex=18:23,colIndex=7:15)
head(dat)
sum(dat$Zip*dat$Ext,na.rm=T)