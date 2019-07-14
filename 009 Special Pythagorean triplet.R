# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 009 Special Pythagorean triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# (a)square + (b)square = (c)square
# For example, (3)square + (4)square = 9 + 16 = 25 = (5)square.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# https://projecteuler.net/problem=9

a <- 0
b <- 0
c <- 0

Answer <- 0

for (i in (1:999))
{
  if (Answer != 0)
  {
    break
  }
  for (j in (999:1))
  {
    k = 1000 - i - j
    if (i**2 + j**2 == k**2)
    {
      Answer = i*j*k
      print(Answer)
      break
    }
  }
}