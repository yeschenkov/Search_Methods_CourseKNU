Lab3.R
================
v.yeshchenkov
2020-09-29

``` r
## 1.   За допомогою download.file() завантажте любий excel файл з порталу http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

library("readxl")
tmp = tempfile(fileext = ".xls")
url <- 'https://data.gov.ua/dataset/175386f8-fbce-4352-8ec9-44fc8c436aa9/resource/e58e005a-c448-4d97-9d45-813f05b1d737/download/nabir-2020-2022-roki.xls'
download.file(url = url, mode="wb", destfile = tmp)
d <- read_excel(tmp,1,col_names = TRUE)
d <- as.data.frame(d)

head(d, 6)
```

    ##   \271 з/п
    ## 1     1
    ## 2     2
    ## 3     3
    ## 4     4
    ## 5     5
    ## 6     6
    ##                                                                                       Показник
    ## 1                                        Валовий внутрішній продукт номінальний, млрд. гривень
    ## 2                                    Валовий внутрішній продукт відсотків до попереднього року
    ## 3                            Індекс споживчих цін у середньому до попереднього року, відсотків
    ## 4                          Індекс споживчих цін грудень до грудня попереднього року, відсотків
    ## 5 Індекс цін виробників промислової продукції (грудень до грудня попереднього року), відсотків
    ## 6                                              Прибуток прибуткових підприємств, млрд. гривень
    ##   Прогноз 2020 сценарій 1 Прогноз 2020 сценарій 2 Прогноз 2021 сценарій 1
    ## 1      4510.8000000000002                 4 598,8                 5 041,6
    ## 2                   103.7                   104.8                   103.8
    ## 3      106.40000000000001      106.59999999999999      105.59999999999999
    ## 4                   105.5                   105.8                   105.3
    ## 5                   108.2                     109                     108
    ## 6      937.60000000000002      942.39999999999998                 1 050,9
    ##   Прогноз 2021 сценарій 2 Прогноз 2022 сценарій 1 Прогноз 2022 сенарій 2
    ## 1                 5 206,9                 5 593,1                5 886,3
    ## 2                   105.5      104.09999999999999                  106.5
    ## 3                   105.5                   105.3                  105.2
    ## 4                     105      105.09999999999999                    105
    ## 5                     108      106.09999999999999                  105.7
    ## 6                  1080.5      1161.9000000000001                  1 222

``` r
## 2.   За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та завантажте дані в R. Code book, що пояснює значення змінних знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0  Необхідно знайти, скільки property мають value $1000000+

csvTmp <- tempfile()
csvurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(csvurl, destfile = csvTmp)
csvFrame <- read.csv(csvTmp)
length(which(csvFrame$VAL == 24))
```

    ## [1] 53

``` r
## 3.   Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?

require(XML)
xmltmp <- tempfile()
xmlurl <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(xmlurl, xmltmp)
data <- xmlTreeParse(xmltmp, useInternalNodes = TRUE )
rootnode <- xmlRoot(data)
zipcode<-xpathSApply(rootnode,"//zipcode",xmlValue)
sum(zipcode == 21231)
```

    ## [1] 127
