rankall <- function(measure, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        ## Read outcome data
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = 
                                    'character')[,c(2,7,11,17,23)]
        
        # check if the measure is (heart attack, heart failure, pneumonia)
        if(! measure %in% c('heart attack', 'heart failure', 'pneumonia'))
                stop("Invalid Outcome")
        
        # change column names to short labels
        names(outcome) <- c('Hospital', 'State', 'heart attack', 
                            'heart failure', 'pneumonia')
        
        # reduce the data to single measure and convert into numeric, remove NA
        
        outcome <- outcome[c('Hospital','State', measure)]
        outcome[,measure] <- as.numeric(outcome[,measure])
        outcome <- na.omit(outcome)
        
        
        # create an empty data frame to keep hospital, state and measure
        dat <- data.frame(character(), character(), numeric())
        
        rankstate <- function(x){
                # return the rank within x 
                n <- NULL 
                if(!is.numeric(num)){
                        if (num =='best') n <- 1
                        if (num =='worst') n <- nrow(x)
                } else n <- num
                
                # sort the dataframe
                x <- x[order(x[[measure]], x[['Hospital']]),  ]
                
                
                if (n > nrow(x))
                        dat <<- rbind (dat, c(NA, x[[1,2]], NA))
                else
                        dat <<- rbind (dat, c(x[[n,1]], x[[n,2]], x[[n,3]]))
                
        }
        
        
        lapply(split(outcome, outcome$State), rankstate)
        names(dat) <- c('Hospital', 'State', measure)
        dat
}




