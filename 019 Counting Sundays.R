# Solution Author: Arunabha Sarkar, https://github.com/NV2017

# 019 Counting Sundays

# https://projecteuler.net/problem=19

# You are given the following information, 
# but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, 
# but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century 
# (1 Jan 1901 to 31 Dec 2000)?

# Given: 1/1/1900 is Monday

years <- 1900:2000  # 1900 and 2000 os included

# Leap years defined by two conditions:
# 1. Years divisible by'4' but not '100'
# 2. Years divisible by '400'

leap_years <- years[(years%%100!=0)&(years%%4==0) | (years%%400==0)]

# Last days of each month of non-leap years
Last_days_non_leap_year <- c(31,28,31,30,31,30,31,31,30,31,30,31)

# dataframe of year, month, day counts
# 'sort(rep(years,12))' is for all years 12 times, for each month in it
# 
year_month_day_count <- data.frame(year=sort(rep(years,12)), 
                                   month=rep(1:12,length(years)),
                  days=rep(Last_days_non_leap_year,length(years)))

# Changing Feb last day count to 29 for leap years:
year_month_day_count[(year_month_day_count$year %in% leap_years) & 
                       (year_month_day_count$month==2),3] <- 29

# calc weekday of each 1st of the month from Jan 1900
# 1/1/1900 is Monday=1
Monday_firsts <- 1  # 
for (i in 1:(nrow(year_month_day_count)-1))
{
  Monday_firsts <- c(Monday_firsts, (Monday_firsts[i] + 
                  year_month_day_count[i,]$days) %% 7)
}
  
# We have to drop first 12 months of 1900 as answers requires to start from 1901

# Sundays can be counted using (mnfirsts==0)
sum(Monday_firsts[-(1:12)] == 0) # Dropping first 12 months of 1900

# Answer is 171