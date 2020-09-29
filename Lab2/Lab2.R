## 1.	Створить список list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2)). Для цього списку знайдіть sum за допомогою lapply.

list1 <- list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))

lapply(list1, sum)

## 2.	Для кожного елементу списку list1 знайдіть максимальне та мінімальне значення (range) за допомогою lapply та sapply.

lapply(list1, range)

sapply(list1, range)

## 3.	Для вбудованого набору даних InsectSprays знайти середнє count для кожного spray.

split_insects <- split(InsectSprays$count,InsectSprays$spray)

lapply(split_insects, mean)
