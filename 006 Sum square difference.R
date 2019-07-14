# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 006 Sum square difference

#The sum of the squares of the first ten natural numbers is,

# 1square + 2square + ... + 10square = 385

# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)square = 552 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# https://projecteuler.net/problem=6

sum_of_sqaures <- 0
square_of_sum <- 0
summation <- 0

for (i in 1:100)
{
  summation <- summation + i
  sum_of_sqaures <- sum_of_sqaures + i**2
}

square_of_sum <- (summation)**2

print(square_of_sum - sum_of_sqaures)