# Name: Bill Urso
# Date: 10/10/18

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.

data <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska", state != "Hawaii") 

dat <- mutate(data, per100000rate = ((count*100000)/population)*((weeks_reporting)/52))

This code first creates an object called data which stores just the measles data minus the Alaska and Hawaii states. Then dat adds a column to that object adding the per 100,000 rate.

#Question 2.

californiaData <- filter(us_contagious_diseases, disease == "Measles", state == "California")

ggplot(data = californiaData) +
     geom_point(mapping = aes(x = year, y = count )) + geom_vline(xintercept = 1965)

The first part of the code filters it so that the object californiaData contains just california measles data.
The second part of the code uses the california Data and puts the year as the x and count as the y. The geom_vline 
sets the vertical line at 1965 to show where the vacinnation started.

#Question 3.

dat_caliFocus <- filter(us_contagious_diseases, state == "California")

dat_caliFocus$yearBlock[dat_caliFocus$year <= 1979 ] <- "1970's"
> dat_caliFocus$yearBlock[dat_caliFocus$year > 1979 ] <- ">1979"
> dat_caliFocus$yearBlock[dat_caliFocus$year <= 1969 ] <- "1960's"
> dat_caliFocus$yearBlock[dat_caliFocus$year <= 1959 ] <- "1950’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year <= 1949 ] <- "<1950"
> ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state,
    + y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

The first part of the code just filters it so that only the california data is showing.
The second part of the code focuses on each of the decades. We hade to change the signs in order too disquish the entire period of the 70's or 60's.
Lastly we ploted the data with the sqrt(count) in order to view each of the decades count square reconcilePropertiesAndPrototype()

#Question 4.

data$yearBlock[data$year > 1979 ] <- ">1979"
> data$yearBlock[data$year <= 1979 ] <- "1970's"
> data$yearBlock[data$year <= 1969 ] <- "1960's"
> data$yearBlock[data$year <= 1959 ] <- "1950’s"
> data$yearBlock[data$year <= 1949 ] <- "<1950"
> ggplot(data = data ) + geom_bar(mapping = aes(x = state,
    + y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

The pattern is the same for most of them which makes sense due to the fact that you would think vacinnes would effect all of the states the same reduceing the count.


#Question 5.

ggplot(data, aes(x = state, y = sqrt(count))) +
  +     geom_tile(aes(fill = yearBlock), colour = "blue") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

By adding the geom_tile it allows for color to show the 3rd dimension. The rest is basically the same except the style is better.
It basically adds layers to make the trend easier to see.

#Question 6.

Listed below is a provied plot of yearly autism rates going back to the 1950s.
That data shows that increases in autsims have risen over the years however the past few years rates have seen to go down.
However this information is not enough to determine that the two are correlated even though part of the time it looks like they may beaver1
https://www.sfautismsociety.org/blog


