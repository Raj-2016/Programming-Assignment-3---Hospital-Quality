## best.R -- This function thats take two arguments: the 2-character abbreviated name of a state 
## and an outcome name. The function reads the outcome-of-care-measures.csv ???le and returns a character vector 
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the speci???ed outcome 
## in that state.

best <- function(state, outcome) {
        
        ## Read the data
        
          data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
        
        #check if the state and outcomes are valid
        
          validOutcome = c("heart attack","heart failure","pneumonia")
                    if (!outcome %in% validOutcome) {stop("Invalid Outcome")}
          
          validState = unique(data[,7])
                    if (!state %in% validState) {stop("Invalid State") }
          
        
        #get the subset of the data with the desired state
          
        new_data <- subset(data, State == state)
        
        #get the desired outcome column from the data file
        ## Return hospital name in that state with lowest 30-day death rate
        
        outcome_column <- if (outcome == "heart attack") {
                        11
                } else if (outcome == "heart failure") {
                        17
                } else {
                        23
                }
        
        ## Remove all fields that not have the data availabe for the desired outcome.
        
        required_columns <- as.numeric(new_data[,outcome_column])
        bad <- is.na(required_columns)
        desired_data <- new_data[!bad, ]
        
        #find the hospitals in the rows with the minimum outcome value
        
        columns_considered <- as.numeric(desired_data[, outcome_column])
        
        desired_rows <- which(columns_considered == min(columns_considered))
        
        desired_hospitals <- desired_data[desired_rows, 2]
        
        
        ## If there is a tie for the best hospital for a given outcome
        ## return the first hospital name from the alphabetically sorted hospital names list
        
        if (length(desired_hospitals) > 1) {
                hospitals_sorted <- sort(desired_hospitals)
                hospitals_sorted[1]
        }
        else {
                desired_hospitals
        }
        
        
       
}