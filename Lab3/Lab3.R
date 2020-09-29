## 1.	За допомогою download.file() завантажте любий excel файл з порталу http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

library("readxl")
tmp = tempfile(fileext = ".xls")
url <- 'https://data.gov.ua/dataset/175386f8-fbce-4352-8ec9-44fc8c436aa9/resource/e58e005a-c448-4d97-9d45-813f05b1d737/download/nabir-2020-2022-roki.xls'
download.file(url = url, mode="wb", destfile = tmp)
d <- read_excel(tmp,1,col_names = TRUE)
d <- as.data.frame(d)

head(d, 6)

## 2.	За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та завантажте дані в R. Code book, що пояснює значення змінних знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0  Необхідно знайти, скільки property мають value $1000000+

csvTmp <- tempfile()
csvurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(csvurl, destfile = csvTmp)
csvFrame <- read.csv(csvTmp)
length(which(csvFrame$VAL == 24))

## 3.	Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?

require(XML)
xmltmp <- tempfile()
xmlurl <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(xmlurl, xmltmp)
data <- xmlTreeParse(xmltmp, useInternalNodes = TRUE )
rootnode <- xmlRoot(data)
zipcode<-xpathSApply(rootnode,"//zipcode",xmlValue)
sum(zipcode == 21231)
