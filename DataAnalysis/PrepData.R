# Authors: MSSMU_May2017 : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong, Maryam Shahini 
# Taken from Doing Data Science Assignment Week 6 by Dr. Mahesh Fernando
# Data Preparation

## START BY <DAVE DYERr> : DATA LOAD

source('DataCleanup/GetData.R')

## Check the data
head(si)
summary(si)
str(si) # Very handy function! Total obs for Staten Island 8081 before any clean up
#Compactly display the internal structure of an R object.

## END BY <DAVE DYER> : DATA LOAD

## START BY <MARYAM SHAHINI> : DATA FORMATTING

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.

si$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", si$SALE.PRICE))
count(is.na(si$SALE.PRICE.N))

## convert address to address.c (from factor to chr)
si$ADDRESS.C<-as.character(si$ADDRESS)
## convert apartment.number from factor to char 
si$APARTMENT.NUMBER.C <- as.character(si$APARTMENT.NUMBER)

##new changes in calculations for gross and land sqft column

si$GROSS.SQUARE.FEET.N <- as.numeric(gsub("[^[:digit:]]","", si$GROSS.SQUARE.FEET))
count(is.na(si$GROSS.SQUARE.FEET.N))
si$LAND.SQUARE.FEET.N <- as.numeric(gsub("[^[:digit:]]","", si$LAND.SQUARE.FEET))
count(is.na(si$LAND.SQUARE.FEET.N))

## it converts everything variable names to lower case
names(si) <- tolower(names(si))


## Get rid of leading digits
si$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", si$gross.square.feet))
si$land.sqft <- as.numeric(gsub("[^[:digit:]]","", si$land.square.feet))
si$year.built <- as.numeric(as.character(si$year.built))

## END BY <MARYAM SHAHINI> : DATA FORMATTING

## START BY <KIM WONG> : DATA EXPLORATION

## do a bit of exploration to make sure there's not anything weird going on with sale prices

attach(si)
hist(sale.price.n) 
detach(si)

## keep only the actual sales

si.sale <- si[si$sale.price.n!=0,]      # should this be != NA?
plot(si.sale$gross.sqft,si.sale$sale.price.n) # Plot to see any relationship between data [ data exploration]
plot(log10(si.sale$gross.sqft),log10(si.sale$sale.price.n)) # Outliers above indicates doing a log transform might give better view

## END BY <KIM WONG> : DATA EXPLORATION

## START BY <CHIRANJEEVI MALLAVARAPU> : DATA ANALYSIS

## for now, let's look at 1-, 2-, and 3-family homes
si.homes <- si.sale[which(grepl("FAMILY",si.sale$building.class.category)),]
#dim(si.homes) 

##lets again plot to see how the data is now showing up just for family homes
plot(si.homes$gross.sqft,si.homes$sale.price.n) # Plot to see any relationship between data [ data exploration]
plot(log10(si.homes$gross.sqft),log10(si.homes$sale.price.n)) #Outliers above indicates need for log transformation for better view
summary(si.homes[which(si.homes$sale.price.n<100000),])
str(si.homes[which(si.homes$sale.price.n<100000),]) # there seems to be 191 obs. that are less than $100,000 so we will go ahead remove them
""

## remove outliers that seem like they weren't actual sales
si.homes$outliers <- (log10(si.homes$sale.price.n) <=5) + 0
#si.homes$outliers

si.homes <- si.homes[which(si.homes$outliers==0),]
str(si.homes <- si.homes[which(si.homes$outliers==0),]) # After removing outliers a total of 4658 observatios are left out of total 8081
plot(log10(si.homes$gross.sqft),log10(si.homes$sale.price.n)) # this data now looks clean without any major outliers ready for some visualization!

## END BY <CHIRANJEEVI MALLAVARAPU> : DATA ANALYSIS
