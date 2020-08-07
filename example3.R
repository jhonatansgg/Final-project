data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
newdata <- as.data.frame(cbind(data[,2],  #hospital
                               data[,7],  #state
                               data[,11], #heart attack
                               data[,17], #heart failure
                               data[,23]),#pneumonia
                         stringAsFactor = TRUE)
colnames(newdata) <- c("hospital","state","heart attack","heart failure","pneumonia")
c<-split(newdata,newdata$state)
d<-with(newdata,split(newdata,state))
ordered <- list()



#nuevo

data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
data[,11] <- as.numeric(data[,11])

data[,11]
head(data[,11])
is.na(data[,11])
!is.na(data[,11])
!is.na(data[,17])
#paseme los datos que no son NA
p<- data[!is.na(data[,11]),]
d<- split(data,data$State)
ordered <- list()




#otro
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
newdata   <- as.data.frame(cbind(data[, 2],  # hospital
                                 data[, 7],  # state
                                 data[, 11],  # heart attack
                                 data[, 17],  # heart failure
                                 data[, 23]), # pneumonia
                           stringsAsFactors = FALSE)
colnames(newdata) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
newdata[,"heart attack"] <- as.numeric(newdata[,"heart attack"])

por_state <- split(newdata,newdata$state)
head(a)
