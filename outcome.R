outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11],xlab = "Muertes",main = "Tasas De Mortalidad Hospitalarias De 30 Dias(Al Mes) Por Ataque Cardiaco"
     ,col = "lightblue")
