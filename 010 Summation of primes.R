# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 010 Summation of primes
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# https://projecteuler.net/problem=10
SieveOfEratosthenes <- function(UpperEnd) #Enter greater than Zero
{
  PrimeBoolean <- rep(TRUE, UpperEnd) #The last remaining TRUEs will be primes
  PrimeBoolean[1] <- FALSE #'1' is not a prime
  PreviousPrime <- 2  #first prime
  for(i in PreviousPrime:sqrt(UpperEnd)) #This loops to the point of the biggest prime factor: sqrt(num)
  {
    PrimeBoolean[seq.int(2 * PreviousPrime, UpperEnd, PreviousPrime)] <- FALSE 
    PreviousPrime <- PreviousPrime + min(which(PrimeBoolean[(PreviousPrime + 1) : UpperEnd])) #This does what in Python does in for(Start,End,StepSize)
  }
  return(which(PrimeBoolean))
}
#SieveOfEratosthenes(UpperEnd)
UpperEnd <- 2000000
sum(as.numeric(SieveOfEratosthenes(UpperEnd)))