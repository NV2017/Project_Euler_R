# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 004 Largest palindrome product

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

## https://projecteuler.net/problem=4

Largest_Palindrome <- 0
for (i in (999:100))                                          #Reverse loop order means faster discovery of 'largest'
{
  for (j in (999:i))                                          #The 'i' saves lot of computation
  {
    if (i*j < Largest_Palindrome)
    {
      break
    }
    new <- i*j
    if (new > Largest_Palindrome)                             #this again saves lots of computation
    {
      string <- toString(new)
      string_split <- strsplit(string, split="")              #split into individual pieces
      rev_order <- nchar(string):1                            #this gives a list of length in reverse order
      reversed_string <- string_split[[1]][rev_order]         #elements rearranged in reverse order in a list, but as different elements
      reversed_string <- paste(reversed_string, collapse = "")#all elements combined, now this list has only one element
      if (string == reversed_string)                          #checking for palindrome
      {
        Largest_Palindrome <- as.numeric(string)              #updating when palindrome is found, it has been previously filtered for bigger size
      }
    }
  }
}
print(Largest_Palindrome) #the biggest palindrome is printed