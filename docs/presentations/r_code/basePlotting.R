params <-
list(isSlides = "no")

## ----setup, include=FALSE-----------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides != "yes"){
  cat("# Plotting in R

---
"    
  )
  
}



## ----setwd_introtoR,eval=F----------------------------------------------------
# setwd("/PathToMyDownload/Plotting_In_R-master/r_course")
# # e.g. setwd("~/Downloads/Plotting_In_R-master/r_course")


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Scatter and line Charts

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Scatter and line Charts

---
"    
  )
  
}



## ----treatmentVector_basePlotting---------------------------------------------
treatment <- c(0.02,1.8, 17.5, 55,75.7, 80)


## ----defaultPlotEval_basePlotting,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Plot Customization

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Plot Customization

---
"    
  )
  
}



## ----echo=F-------------------------------------------------------------------
par(mar=c(3,3,3,3))
num <- 0 ; 
num1 <- 0
plot(main= "https://r-graph-gallery.com/",0,0 , xlim=c(0,21) , ylim=c(0.5,6.5), col="white" , yaxt="n" , ylab="" , xlab="")
 
#fill the graph
for (i in seq(1,20)){
  points(i,1 , pch=i , cex=3)
  points(i,2 , col=i , pch=16 , cex=3)
  points(i,3 , col="black" , pch=16 , cex=i*0.25)
  
  #lty
  if(i %in% c(seq(1,18,3))){
        num=num+1
    points(c(i,i+2), c(4,4) , col="black" , lty=num , type="l" , lwd=2)
        text(i+1.1 , 4.15 , num)
        }
  
  #type and lwd 
  if(i %in% c(seq(1,20,5))){
    num1=num1+1
    points(c(i,i+1,i+2,i+3), c(5,5,5,5) , col="black"  , type=c("p","l","b","o")[num1] , lwd=2)
    text(i+1.1 , 5.2 , c("p","l","b","o")[num1] )
    points(c(i,i+1,i+2,i+3), c(6,6,6,6) , col="black"  , type="l",  lwd=num1)
    text(i+1.1 , 6.2 , num1 )
 
    }
  }
 
#add axis
axis(2, at = c(1,2,3,4,5,6), labels = c("pch" , "col" , "cex" , "lty", "type" , "lwd" ), 
     tick = TRUE, col = "black", las = 1, cex.axis = 0.8)




## ----plotType_basePlotting,eval=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o")


## ----plotTypeSEval_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l")


## ----plotTypeS_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="p")


## ----plotAsisCexL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, cex=2)


## ----plotAsisCexR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, cex=0.5)


## ----plotAsisPchL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, pch=1)


## ----plotAsisPchR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, pch=20)


## ----plotAsisLwdL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l",lwd=10)


## ----plotAsisLwdR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l",lwd=0.5)


## ----plotAsisLtyL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l",lty=1)


## ----plotAsisLtyR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l",lty=2)


## ----plotColL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l", col="red")


## ----plotColR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="l", col="blue")


## ----plotLabels_basePlotting,eval=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, main="My Plot", sub="a plot")


## ----plotAsisLabels_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, xlab="Position", ylab="score")


## ----plotAsisLasL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, las=1)


## ----plotAsisLasR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, las=2)


## ----plotTwoVectors_basePlotting,eval=TRUE,collapse=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
control <- c(0, 20, 40, 60, 80,100)
plot(treatment,control)


## ----lines_basePlotting,eval=TRUE,collapse=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue")
lines(control, type="o", pch=22, lty=2, col="red")


## ----yxlim_basePlotting,eval=TRUE,collapse=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
control <- c(0, 20, 40, 60, 80,100)
plot(treatment, type="o", col="blue",ylim=c(0,100))
lines(control, type="o", pch=22, lty=2, col="red")


## ----range_basePlotting-------------------------------------------------------
g_range <- range(0, treatment, control)
g_range


## ----plotNoAxesNoAnnotation_basePlotting,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range, axes=FALSE, ann=FALSE)


## ----axis_basePlotting,eval=FALSE---------------------------------------------
# axis(side=1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))


## ----axisEval_basePlotting,eval=TRUE,echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))



## ----axisSides_basePlotting,eval=FALSE----------------------------------------
# axis(2, las=1, at=seq(0,g_range[2],by=20))


## ----axisSidesEval_basePlotting,eval=TRUE,echo=FALSE,fig.height=3.5,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])



## ----box_basePlotting,eval=FALSE----------------------------------------------
# box()


## ----boxEval_basePlotting,eval=TRUE,echo=FALSE,fig.height=4,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()


## ----addLines_basePlotting,eval=FALSE,echo=TRUE,collapse=TRUE-----------------
# lines(control, type="o", pch=22, lty=2, col="red")
# 


## ----addLinesEval_basePlotting,eval=TRUE,echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1000px",height="1080px"----
plot(treatment, type="o", col="blue", 
     ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()
lines(control, type="o", pch=22, lty=2, col="red")


## ----legend_basePlotting,eval=FALSE-------------------------------------------
# legend("topleft",legend=c("treatment","control"),
#        col=c("blue","red"), pch=21:22, lty=1:2);


## ----legendEval_basePlotting,echo=FALSE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()

lines(control, type="o", pch=22, lty=2, col="red")
legend("topleft",legend=c("treatment","control"),
       col=c("blue","red"), pch=21:22, lty=1:2);  


## ----readability_basePlotting,echo=FALSE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----

plot(treatment, type="o", col="blue", lwd=1, ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()

lines(control, type="o", pch=22, lty=2, col="red", lwd=2.5)
legend("topleft",legend=c("treatment","control"),col=c("blue","red"), pch=21:22, lty=1:2, lwd=c(1,2.5))


## ----plot_together ,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px", eval=F----
# plot(treatment, type="o", col="blue", lwd=1, ylim=g_range,axes=FALSE, ann=FALSE)
# axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
# axis(2, las=1, at=20*0:g_range[2])
# box()
# 
# lines(control, type="o", pch=22, lty=2, col="red", lwd=2.5)
# legend("topleft",legend=c("treatment","control"),col=c("blue","red"), pch=21:22, lty=1:2, lwd=c(1,2.5))
# 


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Colors

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Colors

---
"    
  )
  
}



## -----------------------------------------------------------------------------

rainbow(2)


## -----------------------------------------------------------------------------

rainbow(6)


## ----echo=F-------------------------------------------------------------------
library(scales)
show_col(rainbow(6))


## -----------------------------------------------------------------------------

library(paletteer)
my_colors <- paletteer_d("wesanderson::Zissou1")

my_colors


## ----fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px", echo=F----

show_col(my_colors)



## -----------------------------------------------------------------------------
library(RColorBrewer)

my_pal <- colorRampPalette(c("Red","White","Blue"))(25)


## ----fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px", echo=F----
show_col(my_pal)



## ----echo=F,warning=F,message=F-----------------------------------------------
library(viridis)



## ----eval=F-------------------------------------------------------------------
# install.packages('viridis')
# library(viridis)
# viridis(5)


## ----echo=F-------------------------------------------------------------------
viridis(5)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Bar Charts

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Bar Charts

---
"    
  )
  
}



## ----barplotEval_basePlotting,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(treatment)


## ----barplotNames_basePlotting,eval=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
barplot(treatment,
        names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat"))


## ----barplotPreNames_basePlotting,eval=TRUE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
names(treatment) <- c("Mon","Tue","Wed","Thu","Fri","Sat")
barplot(treatment)


## ----readTable_basePlotting---------------------------------------------------
data <- read.table("data/example_plot.txt", header=T, row.names=1, sep=",")


## ----barplotMatrix_basePlotting,eval=TRUE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(as.matrix(data))


## ----barplotMatrixBeside_basePlotting,eval=TRUE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(as.matrix(data),beside=TRUE)


## ----barplotComplexEval_basePlotting, fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
barplot(as.matrix(data), main="Daily progression of X in\nControl and Treatment", ylab= "Total", beside=TRUE, 
        col= viridis(6))
legend("topleft", c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,
        fill=  viridis(6))


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Histograms and Density Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Histograms and Density Plots

---
"    
  )
  
}



## ----hist_basePlotting,echo=TRUE,fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(treatment)  


## ----histcolorYlim_basePlotting,echo=TRUE,fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(treatment, col="lightblue", ylim=c(0,5),cex.main=0.8)


## ----histBreaksEval_basePlottingL_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
hist(treatment, col="lightblue", 
     ylim=c(0,5), cex.main=0.8, 
     breaks = 2)


## ----histBreaksEval_basePlottingR_basePlotting,eval=TRUE,fig.width=8,fig.height=4.5,dpi=300,out.width="1000px",height="1080px"----
hist(treatment, col="lightblue", 
     ylim=c(0,5), cex.main=0.8, 
     breaks = 10)


## -----------------------------------------------------------------------------

d <- density(treatment,width = 20) # returns the density data
plot(d) 



## -----------------------------------------------------------------------------

d <- density(treatment,width = 20) # returns the density data
plot(d) 



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Dot Charts

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Dot Charts

---
"    
  )
  
}



## ----dotchartEval_basePlotting,fig.width=8,fig.height=3,dpi=300,out.width="1000px",height="750px"----
dotchart(t(data))  


## ----dotchartColEval_basePlotting,fig.width=6,fig.height=3,dpi=300,out.width="1000px",height="750px"----

dotchart(t(data), color=c("red","blue"),main="Dotchart", cex=0.5)



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Box Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Box Plots

---
"    
  )
  
}



## ----readForBoxplot_basePlotting,eval=T,fig.width=6,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
exprs <- read.delim("data/gene_data.txt",sep="\t",h=T,row.names = 1)
head(exprs)


## ----Boxplot_basePlotting,eval=T,fig.width=6,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
boxplot(exprs)


## ----BoxplotEval_basePlotting,eval=T,fig.width=6,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
boxplot(log2(exprs),ylab="log2 Expression",
        col=c("red","red","blue","blue"))


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Heatmaps

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Heatmaps

---
"    
  )
  
}



## ----plot_heat ,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----

exprs_mat <- as.matrix(exprs)
heatmap(exprs_mat, cexCol=0.75)



## ----fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px", echo=F----

exprs_mat <- as.matrix(exprs)
heatmap(exprs_mat, cexCol=0.75)



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Going Beyond Base Plotting

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Going Beyond Base Plotting

---
"    
  )
  
}



## ----plot_heat2 ,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
library(pheatmap)
pheatmap(exprs_mat)



## ----fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
library(pheatmap)
pheatmap(exprs_mat, scale ="row", show_rownames = F)



## ----fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
library(RColorBrewer)

my_pal <- colorRampPalette(c("Blue","White","Red"))(60)

pheatmap(exprs_mat, scale ="row", show_rownames = F, breaks = seq(-1.5,1.5,0.05), color = my_pal)



## -----------------------------------------------------------------------------

library(vioplot)
 
vioplot(log2(exprs),main="distribution of log2(expression)")



## -----------------------------------------------------------------------------
library(eulerr)
mat <- cbind(
  A = sample(c(TRUE, TRUE, FALSE), 50, TRUE),
  B = sample(c(TRUE, FALSE), 50, TRUE),
  C = sample(c(TRUE, FALSE, FALSE, FALSE), 50, TRUE)
)
head(mat)


## -----------------------------------------------------------------------------
fit2 <- euler(mat)
plot(fit2)





## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Combining Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Combining Plots

---
"    
  )
  
}



## ----parMfrow_basePlotting,eval=FALSE-----------------------------------------
# par(mfrow=c(2,2))


## ----setParMfrowEval_basePlotting,fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"----
par(mfrow=c(2,2))
hist(exprs$Untreated1)
hist(exprs$Untreated2)
hist(exprs$Treated1)
hist(exprs$Treated2)


## ----setParMfrowEval_for_basePlotting,fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"----
par(mfrow=c(2,2))
for (i in 1:4){
hist(exprs[,i])
}


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Other Customizations

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Other Customizations

---
"    
  )
  
}



## ----echo=F-------------------------------------------------------------------
par(mfrow=c(1,1))



## ----fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"--------
plot(control, treatment)
text(20,60, 'THIS IS MY PLOT', col='red')
text(control, treatment, letters[1:6], adj=c(0,-1), col='blue')



## ----fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"--------
plot(control, treatment)
abline(h=10, col='blue')
abline(v=50, col='red', lwd=2)
abline(a=0, b=1, lty=2)



## ----fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"--------
plot(control, treatment)
polygon(c(50,50,100,100),c(50,80,80,50), col='gray', density=5)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Saving Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Saving Plots

---
"    
  )
  
}



## ----save_basePlotting,eval=FALSE---------------------------------------------
# jpeg(filename, width = 480, height = 480, units = "px",
#      pointsize  = 12, quality = 75)
# plot(control)
# dev.off()


## ----save_pdf_basePlotting,eval=FALSE-----------------------------------------
# 
# pdf(file = "control.pdf", paper = "A4")
# plot(control)
# dev.off()

