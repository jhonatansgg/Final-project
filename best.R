best <- function(state,outcome){
     data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
     newdata <- as.data.frame(cbind(data[,2],
                                    data[,7],
                                    data[,11],
                                    data[,17],
                                    data[,23]),
                              stringsAsFactors = FALSE )
     colnames(newdata) <- c("hospital","state","heart attack","heart failure","pneumonia")
     
     #si cualquier estado No es igual a estos, pare
     if(!any(state == newdata$state)){
          stop("invalid state")
     }else if(!outcome %in% c("heart attack","heart failure","pneumonia")){
          stop("invalid outcome")
     }else{
          pos <- which(newdata[,"state"]== state)
          table <- newdata[pos,]
          values <- as.numeric(table[,eval(outcome)])
          min_value <- min(values,na.rm=TRUE)
          result <- table[,"hospital"][which(values==min_value)]
          salida <- result[order(result)]
     }
     
     return(salida)
}