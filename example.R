data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
newdata <- as.data.frame(cbind(data[,2],
                               data[,7],
                               data[,11],
                               data[,17],
                               data[,23]),
                         stringsAsFactors = FALSE )
colnames(newdata) <- c("hospital","state","heart attack","heart failure","pneumonia")


#En cuales posiciones de newdata el estado es AL
pos <- which(newdata[,"state"]== "AL")
#Muestreme todas las filas donde el state es AL con todas sus columnas
table <- newdata[pos,]

eval("heart attack")
#extraer todas las filas donde la columna es llamada heart attack
p<-as.numeric(table[, eval("heart attack")])
head(p)

k<- min(p,na.rm = TRUE)
#Extraer toda la lista de hospitales
m<-table[,"hospital"]
#donde heart attack es igual al minimo valor de muertes por heart attack 
m[which(p==k)]
