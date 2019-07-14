# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 018 Maximum path sum I

# https://projecteuler.net/problem=18

# By starting at the top of the triangle below and moving to adjacent numbers on the row below, 
# the maximum total from top to bottom is 23.

# That is, 3 + 7 + 4 + 9 = 23.
# 
# Find the maximum total from top to bottom of the triangle below:

# This is a beautiful case of dynamic programming: https://en.wikipedia.org/wiki/Dynamic_programming

triangle_of_the_webpage <-
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

# counting (by length function) number of rows in triangle by counting '\n'
triangle_rows <- sapply(gregexpr("\\n+", triangle_of_the_webpage), length) + 1  

# ' + 1 ' at the end because the last row will not have '\n'

## Some theory/insights of mine.... 
# As far as this question is concerned, brute force method will work.
# Convenient are the pmax / pmin function for the same.
# These functions take many vectors as input/output and return max/min of them.


# creating full triangle matrix
triangle_of_the_webpage <- gsub("\\n", " ", triangle_of_the_webpage)  # remove '\n'
triangle_of_the_webpage <- as.numeric(unlist(strsplit(triangle_of_the_webpage, " ")))
triangle_full <- matrix(0, nrow=triangle_rows, ncol=triangle_rows)
for (i in 1:triangle_rows)
{
  # We can think along these lines to deduce which elements go to which row
  # Its easiest to figure out the last element of a triangle row
  # The last limit for i'th row sum of 1 + 2 + .... + i
  # This is sum of (1:i)..... sum(1:i)
  End_limit <- sum(1:i)
  
  # Now for each End_limit element, the i'th row has i elements
  # So the starting element for this element will be in (i-1) positions before
  # Like for 2:3, the 2nd row, 2 elements are recovered by gap of 1 in seq(2:3)
  # Thus, Start_Limit will be (i-1) short of End_limit
  
  Start_limit <- End_limit - (i-1)
  
  triangle_full[i, 1:i] <- triangle_of_the_webpage[Start_limit:End_limit]
}


# finding max path in bottom two rows, then move up till 1st row
# The sum we get in the top is the sum from the correct path
# We start by assigning triangle_full to 'maximal_path'
# Then 'maximal_path' is modified recursively all the way to the top.
# All combinations are checked

# Note: One very important trick to the maximal_path is as follows:
# The path is still visualizable as of that of some neighbors after left indenting the matrix
# This is because the number of elements on successive rows only differ by '1'
# Thus by 'p'adding 'Left_Side' & 'Right_Side' works (as follows)

# The following contruct is filling up rows and column via only one loop over rows
# Possible as values of entire rows are dependent the parallel rows.

maximal_path <- triangle_full

for (i in triangle_rows:2) 
{
  # Remember, the 'ith' row has 'i' non-zero elements.
  
  # Each of the maximal value of ' i-1 , .. ' element comes from 2 sources
  # From the  right or left element of row# i
  # The positions are : Left_Side & Right_Side
  
  Left_Side <- maximal_path[i,1:(i-1)] + maximal_path[i-1,1:(i-1)]
  
  Right_Side <- maximal_path[i,2:i] + maximal_path[i-1,1:(i-1)]
  
  # Notice how in the column index, has '2' only in Right_Side part, 
  # this is to pick up the right side element. This is why it ends on 2:i.
  
  # Once these are defined, 'pmax' is used to input the max value into maximal_path
  # Note: For i = i, the input will be in row# i-1
  # The for the last iteration with i = 2,
  # The final input will be the element on top of the triangle
  # This will also be the answer.
  
  # Filling in 1:(i-1) column elements of row# i-1 at once
  # The pamx function gives the max of the vectors of the perpendicular direction!
  # the 'p' in pmax/pmin means 'parallel' !
  maximal_path[i-1,1:(i-1)] <- pmax(Left_Side, Right_Side)
}

print(maximal_path[1,1])

# Answer is 1074
