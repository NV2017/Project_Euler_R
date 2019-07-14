# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# https://projecteuler.net/problem=15

# 015 Lattice paths

# Starting in the top left corner of a 2×2 grid, 
# and only being able to move to the right and down, 
# there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20 x 20 grid?

# Need to move 20 times right, 20 times down.
# Every sequence of right and down is a unique path.

# So we need number of ways to choose 20 from 40.
# This is 40 C 20

# we can use choose function

# choose(40,20)
print(paste0('The required answer from problem #15 is: ', choose(40,20), sep=''))

# Gives answer: 137846528820

# Alternatively write your own nCr function:

nCr <- function(n,r)
{
  if ( is.numeric(n) & is.numeric(r))
  {
    if ( n > 0 & r > 0 )
    {
      if ( n < r )
      {
        print("Please enter positive 'n' and 'r' such that n > r.")
      }
      else
      {
        Numerator <- prod(seq(1,n))
        Denominator <- prod(seq(1,r))*prod(seq(1,n-r))
        return(Numerator/Denominator)
      }
    }else
    {
      print("Please enter positive 'n' and 'r' such that n > r.")
    }
  }else
  {
    print("Please enter positive 'n' and 'r' such that n > r.")
  }
}

print(paste0('The required answer from problem #15 is: ', nCr(40,20), sep=''))
