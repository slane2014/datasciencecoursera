testit <- function() {

    DT <- fread("getdata-data-ss06pid.csv")
   
#    ptm <- proc.time()
#    for (i in 1:100) {
#        mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)        
#    }
#    proc.time() - ptm       
    
#    ptm <- proc.time()
#    for (i in 1:100) {
#        rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#    }
#    proc.time() - ptm   
        
    ptm <- proc.time()
    for (i in 1:100) {    
        sapply(split(DT$pwgtp15,DT$SEX),mean)
    }
    proc.time() - ptm   

    ptm <- proc.time()
    for (i in 1:100) {       
        DT[,mean(pwgtp15),by=SEX]
    }
    proc.time() - ptm   
    
    ptm <- proc.time()
    for (i in 1:100) {    
        tapply(DT$pwgtp15,DT$SEX,mean)
    }
    proc.time() - ptm   
}