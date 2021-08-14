## R profiler
## Profiling is useful tool when you are trying to understand where your program 
## is taking time
## You shouldn't think of it in the beginning. Focus on finishing the program 
## first and work on optimization later. 

## Tool1: system.time()

system.time({
        for (i in 1:100){
                print(mean(sample(1:10000, i)))
        }

})

## The R Profiler: 
## Rprof() function 
## summaryRprof() function that produces a summary of Rprof output which is more 
## readable

## Rprof() function would keep track of of the function call stack at a regular 
## interval. Default is 0.2 sec


