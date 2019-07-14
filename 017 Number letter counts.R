# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 017 Number letter counts

# https://projecteuler.net/problem=17

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?
  
  
# NOTE: Do not count spaces or hyphens. 
# For example, 342 (three hundred and forty-two) contains 23 letters 
# and 115 (one hundred and fifteen) contains 20 letters. 
# The use of "and" when writing out numbers is in compliance with British usage.

length_of_one_digit <- nchar("onetwothreefourfivesixseveneightnine")
length_of_10_to_19 <- nchar("teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen")
length_double_digits_single_words <- nchar("twentythirtyfortyfiftysixtyseventyeightyninety")

# Now in 1 to 99, The one digits appear once at start, then eigth more time from 21 to 29, 31 to 39, etc

# In 1 to 99, 'length_of_10_to_19' appears only once.

# In 1 to 99, 'length_double_digits_single_words' will appear at every 10 multiple once &
# 8 times more, like 20 is in twenty and 8 times more in 21 to 29

length_1_to_99 <- length_of_one_digit + length_of_10_to_19 + length_double_digits_single_words * 10 + 
                  length_of_one_digit * 8

# Now in 1 to 999, building from this intuition, the above 'length_1_to_99' will be repeated 10 times. 
# Plus 'one' in 'one hundred and ...' is repeated another 100 times, similarly, entire 'length_of_one_digit'
# 'hundred' is repeated 9 x 100 times, 
# 'and' is repeated 99 x 9 times 
# Lastly, there is 'onethousand' once !

length_1_to_1000 <- (length_of_one_digit + nchar("hundred")*9) * 100 + 
                    nchar("and")*9 * 99 + length_1_to_99 * 10 + nchar('onethousand')
print(length_1_to_1000)
# The answer is 21124



