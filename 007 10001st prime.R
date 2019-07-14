# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 007 10001st prime

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

## https://projecteuler.net/problem=7

# Using numbers of the form 6k±1 is certainly one of the most efficient approaches for an unknown upper limit; 
# that is, continuing through good "prime candidates" until you arrive at the nth prime.

Indexer <- 3 # Because for the first two prime: 2 & 3, the 6k +/- 1 rule doesn't work
NaturalNumber <- 1
Switch <- TRUE
while (Indexer <= 10001)
{
  if (Switch == TRUE)
  {
    candidate <- 6*NaturalNumber - 1
    Switch <- FALSE
  }
  else
  {
    candidate <- 6*NaturalNumber + 1
    Switch <- TRUE
    NaturalNumber <- NaturalNumber + 1
  }
  IsItPrime <- TRUE
  StartTester <- 3
  while (StartTester <= ((candidate)**(0.5)))
  {
    if (candidate %% StartTester == 0)
    {
      IsItPrime <- FALSE
    }
    StartTester <- StartTester + 2
  }
  if (IsItPrime == TRUE)
  {
    Indexer <- Indexer + 1
  }
}
print(candidate)