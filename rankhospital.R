rankhospital <- function(state, measure, num = "best") {
        ## Read outcome data
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = 
                                    'character')[,c(2,7,11,17,23)]
        
        ## Check that state and outcome are valid
        
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
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        
        if(!is.numeric(num)){
                if(num=="best") num <- 1
                if(num=="worst") num <- nrow(my_data)
        }
        if (num > nrow(my_data)) return(NA)
        
        my_data[[num,1]]
        
}