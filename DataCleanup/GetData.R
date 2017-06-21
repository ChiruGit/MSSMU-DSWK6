# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando, TAs Sahil and Raunak

## START BY <DAVE DYER> : DATA GATHERING
library(plyr)

# http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page

# Sets root path of the project on your local computer 
# setwd("/Users/cmallavarapu/Documents/Chiran/Git/MSSMU-DSWK6")

# Program then goes to the relative path of the Data folder to read csv file
si <- read.csv("DataCleanup/Data/rollingsales_statenisland.csv",skip=4,header=TRUE)

# bk <- read.csv("rollingsales_brooklyn.csv",skip=4,header=TRUE)

## END BY <DAVE DYER> : DATA GATHERING
