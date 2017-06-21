# Live Session Doing Data Science Assignment 6
## Case Study Practice - Due Thursday June 23
### Team : Chiranjeevi Mallavarapu, Dave Dyer, Kim Wong and Maryam Shahini 

--- 

# Our Assignment:  Staten Island Sales Data Analysis

---

Below is from the assignment document given by Dr. Mahesh Fernando. 

Using the Rolling Data Sales website, download and examine another housing sales data set (not the one we will use in live session, which is linked here - Rolling Housing Sales for NYC).
(http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page)

* Goal: Create an RStudio project for the analysis of this data set. Your file structure within the project should include the following: 
  * A README file in the project root directory that includes an explanation of the purpose of the project and the other files
  * A data directory containing files to load in and clean up the data. The clean up should include finding out where there are outliers or missing values, deciding how you will treat them, making sure values you think are numerical are being treated as such (correct R class), etc.
  * An Analysis directory containing a file (or files) for exploratory data analysis on the clean data to visualize compare the square footage and sales price for your neighborhood.

* Deliverable: A link to a repository on GitHub containing the above. 

---

## File Organization

* Repo Main folder: contains any "main.r' type files, README.md, reference code 'brooklyn.R' provided 

* DataCleanup folder:  Contains code for getting & cleaning data, sub folder 'Data' contains data
  
  Files:
  - /DataCleanup/GetData.R: loads data from below source data file 
  - /Data/rollingsales_statenisland.csv : Raw Statenisland housing sales data, data gathered from               
     http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page

* DataAnalysis folder:  Contains statistical analysis code
  Files:
  - /DataAnalysis/PrepData.R: cleans data for any unwanted rows, explores data and finally removes any outliers
    and prepares data for visualization
  
 
