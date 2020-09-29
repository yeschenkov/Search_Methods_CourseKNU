Lab2.R
================
v.yeshchenkov
2020-09-29

``` r
## 1.   Створить список list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2)). Для цього списку знайдіть sum за допомогою lapply.

list1 <- list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))

lapply(list1, sum)
```

    ## $observationA
    ## [1] 40
    ## 
    ## $observationB
    ## [1] 21

``` r
## 2.   Для кожного елементу списку list1 знайдіть максимальне та мінімальне значення (range) за допомогою lapply та sapply.

lapply(list1, range)
```

    ## $observationA
    ## [1] 1 7
    ## 
    ## $observationB
    ## [1] 1 6

``` r
sapply(list1, range)
```

    ##      observationA observationB
    ## [1,]            1            1
    ## [2,]            7            6

``` r
## 3.   Для вбудованого набору даних InsectSprays знайти середнє count для кожного spray.

split_insects <- split(InsectSprays$count,InsectSprays$spray)

lapply(split_insects, mean)
```

    ## $A
    ## [1] 14.5
    ## 
    ## $B
    ## [1] 15.33333
    ## 
    ## $C
    ## [1] 2.083333
    ## 
    ## $D
    ## [1] 4.916667
    ## 
    ## $E
    ## [1] 3.5
    ## 
    ## $F
    ## [1] 16.66667
