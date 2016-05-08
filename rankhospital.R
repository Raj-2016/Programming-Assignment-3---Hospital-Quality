## rankhospital.R - This function takes three arguments: the 2-character abbreviated name of a state (state), 
## an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads 
## the outcome-of-care-measures.csv ???le and returns a character vector with the name of the hospital that has 
## the ranking speci???ed by the num argument.

rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
        
        ## Check that state and outcome are valid
        
        validOutcome = c("heart attack","heart failure","pneumonia")
                if (!outcome %in% validOutcome) {stop("invalid outcome")}
        
        validState = unique(data[,7])
                if (!state %in% validState) {stop("invalid state")}
        
        ## convert outcome name into column name
        
        fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
        
        colName <- fullColName[match(outcome,validOutcome)]
        
        ## Return hospital name in that state with the given rank 30-day death rate
        data_state <- data[data$State==state,]
        
        # order data by outcome
        sorted_data_state <- data_state[order(as.numeric(data_state[[colName]]),data_state[["Hospital.Name"]],decreasing=FALSE,na.last=NA), ]
        
        #handle num input
        if (num=="best") num = 1
 
        if (num=='worst') num = nrow(sorted_data_state)
 
        sorted_data_state[num,"Hospital.Name"]
}