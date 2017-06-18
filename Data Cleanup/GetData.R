# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando

library(plyr)

# http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page
setwd("Data")
# read csv file
bk <- read.csv("rollingsales_brooklyn.csv",skip=4,header=TRUE)
