# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando

library(plyr)

# http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page
setwd("/Users/dave/Documents/smu/MSDS6306-405-DoingDataScience/assignments/MSSMU-DSWK6/Data Cleanup/Data/")
# read csv file
# si <- read.csv("rollingsales_statenisland.csv",skip=4,header=TRUE)

bk <- read.csv("rollingsales_brooklyn.csv",skip=4,header=TRUE)
