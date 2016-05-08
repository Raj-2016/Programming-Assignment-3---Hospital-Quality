Programming-Assignment-3-Hospital-Quality
This contains the following three functions.

best.R -- This function thats take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv data and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state.

rankhospital.R - This function takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv ﬁle and returns a character vector with the name of the hospital that hasthe ranking speciﬁed by the num argument.

 rankall.R - This function takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv ﬁle and returns a 2-column data frame obtaining the hospitals in each state that has the ranking speciﬁed in num.

