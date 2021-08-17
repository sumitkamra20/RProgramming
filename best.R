## This purpose is to create a function called best() which takes two arguments - 
## the name of the state and the name of the measure. 
## best(state, measure)
## the function shall return the name of the hospital with the lowest mortality 
## rate on the measure. 
## The measures are "heart attack”=11, “heart failure”=17, “pneumonia”=23

best <- function(state, measure) {
        ## Read outcome data and filter relevant columns
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = 
                                    'character')[,c(2,7,11,17,23)]
        
        # Check if the  state is valid
        if (! state %in% outcome$State)
                stop("Invalid State")
        
        # check if the measure is (heart attack, heart failure, pneumonia)
        if(! measure %in% c('heart attack', 'heart failure', 'pneumonia'))
                stop("Invalid Outcome")
        
        # change column names to short labels
        names(outcome) <- c('Hospital', 'State', 'heart attack', 
                            'heart failure', 'pneumonia')
        
        # filter to the specific state and measure (outcome) data
        my_data <- outcome[outcome$State == state, c("Hospital", "State", measure)]
        # change the measure to numeric and remove rows with NA.  
        my_data[,measure] <- as.numeric(my_data[,measure])
        my_data <- na.omit(my_data)
        
        # Sort the data
        my_data <- my_data[order(my_data[[measure]], my_data$Hospital),]
        my_data[[1,1]]
        
}