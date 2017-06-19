# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando
# Data Preparation

## Start by <Dave Dyer> : Data Load

source('../GetData.R')
## Check the data
head(si)
summary(si)
str(si) # Very handy function!
#Compactly display the internal structure of an R object.

## End by <Dave Dyer> : Data Load

## Start by <Maryam Shahini> : Data Clean Up

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
si$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", si$SALE.PRICE))
count(is.na(si$SALE.PRICE.N))

names(si) <- tolower(names(si)) # make all variable names lower case


## Get rid of leading digits
## Start by <Maryam Shahini>
si$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", si$gross.square.feet))
si$land.sqft <- as.numeric(gsub("[^[:digit:]]","", si$land.square.feet))
si$year.built <- as.numeric(as.character(si$year.built))

## End by <Maryam Shahini> : Data Clean Up

## Start by <Kim Wong> : Data Exploration

## do a bit of exploration to make sure there's not anything weird going on with sale prices

attach(si)
hist(sale.price.n) 
detach(si)

## keep only the actual sales

si.sale <- si[si$sale.price.n!=0,]      # should this be != NA?
plot(si.sale$gross.sqft,si.sale$sale.price.n) # Plot to see any relationship between data [ data exploration]
plot(log10(si.sale$gross.sqft),log10(si.sale$sale.price.n)) # Outliers above indicates doing a log transform might give better view

## End by <Kim Wong> : Data Exploration

## Start by <Chiranjeevi Mallavarapu> : Data Analysis

## for now, let's look at 1-, 2-, and 3-family homes
si.homes <- si.sale[which(grepl("FAMILY",si.sale$building.class.category)),]
dim(si.homes)
plot(log10(si.homes$gross.sqft),log10(si.homes$sale.price.n))
summary(si.homes[which(si.homes$sale.price.n<100000),])
""

## remove outliers that seem like they weren't actual sales
si.homes$outliers <- (log10(si.homes$sale.price.n) <=5) + 0
si.homes <- si.homes[which(si.homes$outliers==0),]
plot(log10(si.homes$gross.sqft),log10(si.homes$sale.price.n))

## End by <Chiranjeevi Mallavarapu> : Data Analysis
