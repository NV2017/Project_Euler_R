# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# https://projecteuler.net/problem=14

# 014 Longest Collatz sequence
# The following iterative sequence is defined for the set of positive integers:
#   n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
#   NOTE: Once the chain starts the terms are allowed to go above one million.

# Many calculations of part higher terms will be repeat of some lower terms.
# Thus, recording those will speed. This requires checking each new entry with match of a data base
# This can be a list with index as number & values as number of number of terms in the series

# This is not designed to work starting from negative terms

NextCollatzTerm <- function(n)
{
  if (n %% 2 == 0)
  {
    return(as.integer(n/2))
  }
  else
  {
    return(as.integer(3*n + 1))
  }
}

History = c(1, 2) # '1' is already at target, '2' reaches in 1 step- thus two members in sequence

Counter <- 0
GreatestCounter <- 0
BiggestNumber <- 0

library(gmp)

for (i in 3:1000000)
{
  Counter <- 0
  dummyi <- as.bigz(i)
  #dummyi <- i
  
  while (dummyi != 1)
  {
    if (dummyi < 1000000 & is.na(History[dummyi]) != TRUE)
    {
      Counter <- Counter + History[dummyi] #index out of range
      dummyi <- 1
      break
    }
    else
    {
      dummyi = NextCollatzTerm(dummyi)
      Counter <- Counter + 1
    }
  }
  History[i] <- Counter
  
  if (Counter > GreatestCounter)
  {
    GreatestCounter <- Counter
    BiggestNumber <- i
  }
}
print(paste('Biggest number is', BiggestNumber, 'with # of terms:', GreatestCounter + 1))