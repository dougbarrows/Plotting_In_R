## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
AsSlides <- TRUE

## ------------------------------------------------------------------------
treatment <- c(0.02,1.8, 17.5, 55,75.7, 80)

## ----eval=FALSE----------------------------------------------------------
## plot(treatment)

## ---- echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment)

## ----eval=TRUE-----------------------------------------------------------
plot(treatment, type="o", col="blue",main="Treatment")

## ----eval=FALSE----------------------------------------------------------
## title(main="Treatment", col.main="red", font.main=4)

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue")
title(main="Treatment", col.main="red", font.main=4)

## ----eval=TRUE,collapse=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
control <- c(0, 20, 40, 60, 80,100)
plot(treatment, type="o", col="blue", ylim=c(0,100))
lines(control, type="o", pch=22, lty=2, col="red")

## ----echo=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", ylim=c(0,100))
lines(control, type="o", pch=22, lty=2, col="red")
title(main="Expression Data", col.main="red", font.main=4)

## ------------------------------------------------------------------------
g_range <- range(0, treatment, control)

## ----eval=TRUE-----------------------------------------------------------
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)

## ----eval=FALSE----------------------------------------------------------
## axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))

## ----eval=TRUE,echo=FALSE------------------------------------------------
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))


## ----eval=FALSE----------------------------------------------------------
## axis(2, las=1, at=20*0:g_range[2])

## ----eval=TRUE,echo=FALSE------------------------------------------------
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])


## ----eval=FALSE----------------------------------------------------------
## box()

## ----eval=TRUE,echo=FALSE------------------------------------------------
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()

## ----eval=FALSE,echo=TRUE,collapse=TRUE----------------------------------
## lines(control, type="o", pch=22, lty=2, col="red")
## title(main="Data", col.main="red", font.main=4)
## title(xlab="Days", col.lab=rgb(0,0.5,0))
## title(ylab="Values", col.lab=rgb(0,0.5,0))

## ----eval=TRUE,echo=FALSE,collapse=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()
lines(control, type="o", pch=22, lty=2, col="red")
title(main="Data", col.main="red", font.main=4)
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Values", col.lab=rgb(0,0.5,0))

## ----eval=FALSE----------------------------------------------------------
## legend(1, g_range[2], c("treatment","control"), cex=0.8,
##        col=c("blue","red"), pch=21:22, lty=1:2);

## ----echo=FALSE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()

lines(control, type="o", pch=22, lty=2, col="red")
title(main="Data", col.main="red", font.main=4)
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Values", col.lab=rgb(0,0.5,0))
legend(1, g_range[2], c("treatment","control"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2);  

## ----eval=FALSE----------------------------------------------------------
## barplot(treatment)

## ----echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(treatment)

## ------------------------------------------------------------------------
data <- read.table("data/example.txt", header=T, sep="\t")

## ----eval=TRUE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(data$treatment, main="Treatment", xlab="Days",ylab="values", 
        names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat"), 
        border="blue", density=c(10,20,30,40,50,60))

## ----eval=FALSE----------------------------------------------------------
## barplot(as.matrix(data), main="Data", ylab= "Total", beside=TRUE,
##         col= c("lightblue", "mistyrose", "lightcyan","lavender",
##                "cornsilk","maroon"))
## legend("topleft", c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,
##        bty="n", fill=  c("lightblue", "mistyrose", "lightcyan",
##                          "lavender","cornsilk","maroon"));

## ----echo=FALSE,fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
barplot(as.matrix(data), main="Data", ylab= "Total", beside=TRUE, col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"))
legend("topleft", c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,bty="n", 
fill=  c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"));


## ----echo=TRUE,fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(treatment)  

## ------------------------------------------------------------------------
all <- c(data$control, data$treatment)

## ----eval=FALSE----------------------------------------------------------
## hist(all, col="lightblue", ylim=c(0,10))

## ----echo=FALSE,fig.width=5,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(all, col="lightblue", ylim=c(0,10))

## ------------------------------------------------------------------------
max_num <- max(all)

## ----eval=TRUE,fig.width=5,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(all, col=heat.colors(max_num), breaks=max_num, 
     xlim=c(0,max_num),main="Histogram", las=1)	

## ----echo=TRUE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----

hist(all,breaks=max_num,xlim=c(0,max_num), 
     main="Probability Density",las=1, cex.axis=0.8, freq=F)

## ----eval=FALSE----------------------------------------------------------
## pie(treatment)

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
pie(treatment)

## ----eval=FALSE----------------------------------------------------------
## pie(treatment, main="Treatment", col= c("lightblue", "mistyrose",
##                                         "lightcyan","lavender",
##                                         "cornsilk","maroon"),
##     labels=c("Mon","Tue","Wed","Thu","Fri","Sat"))	

## ----echo=FALSE,fig.width=5,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
pie(treatment, main="Treatment", col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"),labels=c("Mon","Tue","Wed","Thu","Fri","Sat"),cex=1)  

## ------------------------------------------------------------------------
colors <- c("white","grey70","grey90","grey50","black")

## ------------------------------------------------------------------------
treatment_labels <- round(treatment/sum(treatment) * 100, 1)

## ------------------------------------------------------------------------
treatment_labels <- paste(treatment_labels, "%", sep="")

## ----eval=FALSE----------------------------------------------------------
## pie(treatment, main="treatment", col=colors, labels= treatment_labels,
##     cex=0.8)

## ----eval=FALSE----------------------------------------------------------
## legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,
##        fill=colors)	

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
pie(treatment, main="treatment", col=colors, labels= treatment_labels,cex=0.8)
legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,fill=colors)  

## ----eval=FALSE----------------------------------------------------------
## dotchart(t(data))	

## ----echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
dotchart(t(data))  

## ----eval=FALSE----------------------------------------------------------
## dotchart(t(data), color=c("red","blue","darkgreen"),
##          main="Dotchart", cex=0.8)	

## ----echo=FALSE,fig.width=6,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
dotchart(t(data), color=c("red","blue","darkgreen"),main="Dotchart", cex=0.8)  

## ----eval=T,fig.width=6,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
exprs <- read.delim("data/gene_data.txt",sep="\t",h=T,row.names = 1)
head(exprs)

## ----eval=T,fig.width=6,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
boxplot(exprs)

## ----eval=T,fig.width=6,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
boxplot(log2(exprs),ylab="log2 Expression",
        col=c("red","red","blue","blue"))

## ----eval=FALSE----------------------------------------------------------
## par(mfrow=c(2,2))

## ------------------------------------------------------------------------
data1 <- read.table("data/gene_data.txt", header=T, sep="\t")
head(data1)

## ----eval=FALSE----------------------------------------------------------
## par(mfrow=c(2,2))
## hist(data1$Untreated1)
## hist(data1$Treated2)
## hist(data1$Untreated2)
## boxplot(data1$Treated1)

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"----
par(mfrow=c(2,2))
hist(data1$Untreated1)
hist(data1$Treated2)
hist(data1$Untreated2)
boxplot(data1$Treated1)

## ----eval=FALSE----------------------------------------------------------
## bmp(filename, width = 480, height = 480, units = "px",
##     point-size = 12)
## jpeg(filename, width = 480, height = 480, units = "px",
##      point-size = 12, quality = 75)

## ----eval=FALSE----------------------------------------------------------
## bmp(file = "control.bmp")
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## jpeg(file = "control.jpg", quality = 20)
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## postscript(file = "control.ps")
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## 
## pdf(file = "control.pdf", paper = "A4")
## plot(control)
## dev.off()

