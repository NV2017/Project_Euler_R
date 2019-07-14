# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 020 Factorial digit sum

# https://projecteuler.net/problem=20

# n! means n x (n − 1) x... x 3 x 2 x 1
# 
# For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# 
# Find the sum of the digits in the number 100!


libraries_required = c('gmp')

if(sum(libraries_required %in% rownames(installed.packages())) < length(libraries_required))
{
  for(i in seq(libraries_required))
  {
    if(is.na(sum(libraries_required %in% rownames(installed.packages()))[i]))
    {
      try(expr = install.packages('libraries_required[i]'), silent = T)
    }
  }
}

lapply(libraries_required, library, character.only = TRUE)

number <- as.bigz('1') # prod(1:100) doesn't work as it goes through R's approximation

for (i in 1:100)
{
  number <- number*i
}

answer <- sum(as.double(unlist(strsplit(as.character(number),split=''))))

# Answer is 648.

