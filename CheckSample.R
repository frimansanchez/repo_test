args <- commandArgs(TRUE)
file <- args[1]
vars <- args[2]
vars <- unlist(strsplit(vars,"_"))
type <- args[3]
type <- unlist(strsplit(type,"_"))
out <- args[4]
S <- read.table(file,header=T,sep=" ")
S <- S[2:nrow(S),]
ID_1 <- c("0",as.vector(S$ID_1))
ID_2 <- c("0",as.vector(S$ID_2))
missing <- c("0",as.vector(S$missing))
S2 <- data.frame(ID_1=ID_1,ID_2=ID_2,missing=missing)
for(i in seq(1,length(vars),1)){
   var <- c(type[i],S[,names(S)==vars[i]])
   S2 <- cbind(S2,var)
}
names(S2) <- c(names(S2)[1:3],vars)
write.table(S2,file=paste(out,".txt",sep=""),quote=FALSE,sep=" ", col.names=TRUE,row.names=FALSE)




