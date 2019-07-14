# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 005 Smallest multiple

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

## https://projecteuler.net/problem=5

# Notice that 2520 includes the highest power of the primes that is less than 10
# Each number till 10 can be represent as either a prime or some powers of primes
# Multiply all the highest powers of those primes to get the answer, a number divisible by anything till 10

# This is the most basic Prime number finding algorithm, not very energy efficient

PrimeNumbers <- function(UpperNumber)
{
  PrimeList <- list() #Will house the prime numbers
  k <- 1 #Index starting for the prime number list index
  for (i in (2:UpperNumber)) #Note: 'UpperNumber' is also checked in this way in R. In Python, a +1 is required
  {
    IsIt <- TRUE
    for (j in (1:(i-1))) #j = 1 required to prevent the loop from running backwards when i = 2
    { #(i-1) has brackets necessary, other R is misinterpreting the -1
      if (j > 1 && i%%j == 0)
      { # j > 1 as for prime number divisibility test starts from 2 onwards
        IsIt <- FALSE #One instance proves this is nota prime number
      }
    }
    if (IsIt == TRUE)
    {
      PrimeList[k] <- i
      k <- k + 1
    }
  }
  return(PrimeList)
}



Problem5 <- PrimeNumbers(20) #Prime number till the argument, inclusive
Problem5Powers <- list() #Now to find the power for the prime factors

n <- 1 #Indexer for Problem5Powers
for (l in 1:length(Problem5))
{
  m <- 1
  while (Problem5[[l]] ** m < 20)
  {
    m <- m + 1
  }
  Problem5Powers[n] <- (m-1) #The max require power for the corresponding prime number, in same order
  n <- n + 1
}

answer = 1

for (o in (1:length(Problem5)))
{
  answer = answer*(Problem5[[o]]**Problem5Powers[[o]])
}

print(answer)