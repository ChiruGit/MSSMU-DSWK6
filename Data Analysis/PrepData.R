# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando
# Data Preparation

## Start by <Dave Dyer> : Data Load

source('../GetData.R')
## Check the data
head(bk)
summary(bk)
str(bk) # Very handy function!
#Compactly display the internal structure of an R object.

## End by <Dave Dyer> : Data Load

## Start by <Maryam Shahini> : Data Clean Up

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))

names(bk) <- tolower(names(bk)) # make all variable names lower case


## Get rid of leading digits
## Start by <Maryam Shahini>
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))
bk$year.built <- as.numeric(as.character(bk$year.built))

## End by <Maryam Shahini> : Data Clean Up

## Start by <Kim Wong> : Data Exploration
## do a bit of exploration to make sure there's not anything
## weird going on with sale prices
attach(bk)
hist(sale.price.n) 
detach(bk)

## keep only the actual sales

bk.sale <- bk[bk$sale.price.n!=0,]      # should this be != NA?
plot(bk.sale$gross.sqft,bk.sale$sale.price.n) # Plot to see any relationship between data [ data exploration]
plot(log10(bk.sale$gross.sqft),log10(bk.sale$sale.price.n)) # Outliers above indicates doing a log transform might give better view

## End by <Kim Wong> : Data Exploration

## Start by <Chiranjeevi Mallavarapu> : Data Analysis

## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n))
summary(bk.homes[which(bk.homes$sale.price.n<100000),])
""

## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log10(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n))

## End by <Chiranjeevi Mallavarapu> : Data Analysis
