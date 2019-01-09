setwd("Coursera Quizzes")

install.packages("RMySQL")
library("RMySQL")

ucscDb<- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);


##Q1

install.packages("httr")
install.packages("httpuv")

library(httr)
library(httpuv)


oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "6f62e59c40d76cc57500",
                   secret = "77b9a20f6be97862fbad34709f3b9b30ea73728b",
                   redirect_uri="http://localhost:1410"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1<-content(req)
json2<-jsonlite::fromJSON(toJSON(json1))
head(json2)

##Answer
json2$created_at[json2$name=="datasharing"]



##Q2

install.packages("sqldf")

library(sqldf)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","ACS Data.csv",mode="wb")

acs<-read.csv("ACS Data.csv")
sqldf("select * from acs where AGEP < 50 and pwgtp1")


##Q4

con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode<-readLines(con)
close(con)
class(htmlCode)
htmlCode
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])


##Q5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","Fortran.for",mode="wb")

fortran<-read.fortran("Fortran.for", format=c("1A10","1A5","2A4","1A5","2A4","1A5","2A4","1A5","2A4"),skip=3)
head(fortran)

cleanedFortran<-fortran[,c(1,3,4,6,7,9,10,12,13)]
head(cleanedFortran)
names(cleanedFortran)<-cleanedFortran[1,]
cleanedFortran<-cleanedFortran[-1,]
cleanedFortran[,2:9]<-as.numeric(as.character(cleanedFortran[,2:9]))
head(cleanedFortran)
sum(as.numeric(cleanedFortran[,4]))
sum(as.numeric(cleanedFortran[,5]))
