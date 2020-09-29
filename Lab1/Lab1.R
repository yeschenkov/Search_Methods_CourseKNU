## 1.	Створити матрицю mat з 5 стовпцями та 10 строками за допомогою matrix з випадковими даними (функція rnorm(50)).

mat <- matrix(rnorm(50), ncol = 5)
mat 

## 2.	Знайти максимальне значення в кожному стовпці.

apply(mat, 2, max)

## 3.	Знайти середнє (mean) значення кожного стовпця.

apply(mat, 2, mean)

## 4.	Знайти мінімальне значення в кожному рядку.

apply(mat, 1, min)

## 5.	Відсортувати кожен стовбець таблиці.

sorted_mat <- apply(mat, 2, sort, decreasing = F)
sorted_mat

## 6.	Знайти кількість значень < 0 для кожного стовпця. Використати свою функцію.

neg_num_count <- function(x) {
  return(sum(x < 0))
}

apply(mat, 2, neg_num_count)

## 7.	Вивести вектор з булевими значеннями TRUE та FALSE. TRUE, якщо в стовпці є елементи >2, FALSE – якщо немає.

any_el_greater_two <- function (x) {
  return(any(x>2))
}

apply(mat, 2, any_el_greater_two)
