## rankall.R - This function takes two arguments: an outcome name (outcome) and a hospital ranking (num).
## The function reads the outcome-of-care-measures.csv ???le and returns a 2-column data frame 
## obtaining the hospitals in each state that has the ranking speci???ed in num


rankall <- function(outcome, num = "best") {

        
        #read in the desired data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        #create the list of states
        state <- levels(factor(data[, 7]))
        
        
        #create hospital list
        hospital <- vector(mode="character") 
        
        for (i in seq(state)) {
                hospital[i] <- rankhospital(state[i], outcome, num)
        }
        data.frame(hospital, state)
}