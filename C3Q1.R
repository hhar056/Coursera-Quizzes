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
library("rJava")
library("xlsxjars")
library("xlsx")
library("XML")


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
test<-xmlSApply(els,extraFun)
class(test)
head(test)

extraFun<-function(x){
    xmlSApply(x,xmlValue)
}