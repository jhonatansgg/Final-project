rankhospital <- function(state, outcome, num = "best"){
     data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
     newdata <- as.data.frame(cbind(data[,2],  #hospital
                                    data[,7],  #state
                                    data[,11], #heart attack
                                    data[,17], #heart failure
                                    data[,23]),#pneumonia
                              stringAsFactor = TRUE)
     colnames(newdata) <- c("hospital","state","heart attack","heart failure","pneumonia")
     
     if(!state %in% newdata[,"state"]){
          stop("invalid state")
     }else if (!outcome %in% c("heart attack","heart failure","pneumonia")){
          stop("invalid outcome")
     }else if(is.numeric(num)){
          pos <- which(newdata[,"state"] == state)
          table <- newdata[pos,]
          values <- as.numeric(table[,eval(outcome)])
          orden <- order(values,table[,"hospital"])
          table <- table[orden,]
          salida <- table[,"hospital"][num]
          
     }else if(!is.numeric(rank)){
          if(num == "best"){
               salida <- best(state, outcome)
          }else if(num =="worst"){
               pos <- which(newdata[,"state"]== state)
               table <- newdata[pos,]
               values <- as.numeric(table[,eval(outcome)])
               table <- table[order(values,table[,"hospital"],decreasing = TRUE),]
               salida <- table[,"hospital"][1]
          }else{
               stop("invalid rank")
          }
     }
     return(salida)
}