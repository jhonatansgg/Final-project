rankall <- function(outcome, num = "best"){
     ## Read outcome data
     data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     newdata   <- as.data.frame(cbind(data[, 2],  # hospital
                                      data[, 7],  # state
                                      data[, 11],  # heart attack
                                      data[, 17],  # heart failure
                                      data[, 23]), # pneumonia
                                stringsAsFactors = FALSE)
     colnames(newdata) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
     newdata[,eval(outcome)] <- as.numeric(newdata[,eval(outcome)])
     
     if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
          stop('invalid outcome')
     }else if(is.numeric(num)){
          por_state <- split(newdata,newdata$state)
          ordered <- list()
          for(i in seq_along(por_state)){
               por_state[[i]] <- por_state[[i]][order(por_state[[i]][,eval(outcome)],
                                                      por_state[[i]][,"hospital"]),]
               ordered[[i]] <- c(por_state[[i]][num,"hospital"],por_state[[i]][,"state"][1])
          }
          result <- do.call(rbind,ordered)
          salida <- as.data.frame(result,row.names=result[,2],stringsAsFactors = FALSE)
          names(salida) <- c("hospital","state") 
     }else if(!is.numeric(num)){
          if(num == best){
               por_state <- split(newdata,newdata$state)
               ordered <- list()
               for(i in seq_along(por_state)){
                    por_state[[i]] <- por_state[[i]][order(por_state[[i]][, eval(outcome)], 
                                                           por_state[[i]][, "hospital"]), ]
                    ordered[[i]]  <- c(por_state[[i]][1, c("hospital", "state")])
               }
               result <- do.call(rbind, ordered)
               salida <- as.data.frame(result, stringsAsFactors = FALSE)
               rownames(salida) <- salida[, 2]
          }else if (num == "worst") {
               por_state <- split(newdata,newdata$state)
               ordered  <- list()
               for (i in seq_along(por_state)){
                    por_state[[i]] <- por_state[[i]][order(por_state[[i]][, eval(outcome)], 
                                                           por_state[[i]][, "hospital"], 
                                                           decreasing = TRUE), ]
                    ordered[[i]]  <- c(por_state[[i]][1, c("hospital", "state")])
               }
               result <- do.call(rbind, ordered)
               salida <- as.data.frame(result, stringsAsFactors = FALSE)
               rownames(salida) <- salida[, 2]
          }else {
               stop('invalid num')
          }
     }
     return(salida)
}
