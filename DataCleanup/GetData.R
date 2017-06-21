# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando, TAs Sahil and Raunak

## Start by <Dave Dyer> : Data Gathering
library(plyr)

# http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page

# Set root path of the project on your local computer -<this is the only change you need to do 
setwd("/Users/cmallavarapu/Documents/Chiran/Git/MSSMU-DSWK6")

# Program then goes to the Data folder to read csv file
si <- read.csv("DataCleanup/Data/rollingsales_statenisland.csv",skip=4,header=TRUE)

# bk <- read.csv("rollingsales_brooklyn.csv",skip=4,header=TRUE)

## End by <Dave Dyer> : Data Gathering
