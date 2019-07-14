# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# https://projecteuler.net/problem=16

# 016 Power digit sum

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26

# What is the sum of the digits of the number 2^1000

# We utilize library(gmp) for the function as.bigz() to store big numbers

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

number <- as.bigz(2^1000)

sum(as.numeric(strsplit(x = as.character(number),split='')[[1]]))

# Answer is 1366


