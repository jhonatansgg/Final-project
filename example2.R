data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
newdata <- as.data.frame(cbind(data[,2],  #hospital
                               data[,7],  #state
                               data[,11], #heart attack
                               data[,17], #heart failure
                               data[,23]),#pneumonia
                         stringAsFactor = TRUE)
colnames(newdata) <- c("hospital","state","heart attack","heart failure","pneumonia")

pos <- which(newdata[,"state"] == "TX")
table <- newdata[pos,]
table[,eval("heart attack")] <- as.numeric(table[,eval("heart attack")])


k<-table[,eval("heart attack")] <- as.numeric(table[,eval("heart attack")])
head(k)
#Ordena de menor a mayor los puntajes (esto da las posiciones)
a<-order(table[,eval("heart attack")])
#Ordena de menor a mayor los puntajes YY cuando hay un empate el segundo citerio es el orden alfabetico
o<-order(table[,eval("heart attack")],table[,"hospital"])
t<- table[a,]
v<- table[o,]
ver<- v[,"hospital"][5]
head(ver)


t <- table[order(table[,eval("heart attack")],table[,"hospital"]),]
