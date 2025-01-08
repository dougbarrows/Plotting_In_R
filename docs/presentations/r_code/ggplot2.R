params <-
list(isSlides = "no")

## ----setup, include=FALSE-----------------------------------------------------
suppressPackageStartupMessages(require(knitr))
suppressPackageStartupMessages(require(plotly))
suppressPackageStartupMessages(require(Seurat))
knitr::opts_chunk$set(echo = TRUE, tidy = T)
if(params$isSlides == "yes"){AsSlides=T}else{AsSlides=F}




## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides != "yes"){
  cat("# Plotting in R with ggplot2
  
---
"    
  )
  
}



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Grammar of Graphics

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Grammar of Graphics
  
---
"    
  )
  
}



## ----complex_ggplot2,eval=F---------------------------------------------------
# 
# ggplot(data = <default data set>,
#        aes(x = <default x axis variable>,
#            y = <default y axis variable>,
#            ... <other default aesthetic mappings>),
#        ... <other plot defaults>) +
# 
#        geom_scatter(aes(size = <size variable for this geom>,
#                       ... <other aesthetic mappings>),
#                   data = <data for this point geom>,
#                   stat = <statistic string or function>,
#                   position = <position string or function>,
#                   color = <"fixed color specification">,
#                   <other arguments, possibly passed to the _stat_ function) +
# 
#   scale_<aesthetic>_<type>(name = <"scale label">,
#                      breaks = <where to put tick marks>,
#                      labels = <labels for tick marks>,
#                      ... <other options for the scale>) +
# 
#   ggtitle("Graphics/Plot")+
#   xlab("Weight")+
#   ylab("Height")+
# 
#   theme(plot.title = element_text(color = "gray"),
#         ... <other theme elements>)
# 


## ----present_cleanEralt_ggplot2, echo=FALSE-----------------------------------
library(ggplot2)

patients_clean <- read.delim("data/patient-data-cleaned.txt",
                             sep="\t")



## ----simple_ggplot2,eval=T,warning=FALSE,fig.height=4.5,fig.width=9-----------
ggplot(data=patients_clean,
       aes(y=Weight,x=Height,color=Sex,
           size=BMI,shape=Pet)) + 
  geom_point()



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Getting Started With ggplot2

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Getting Started With ggplot2
  
---
"    
  )
  
}



## ----load_packages_ggplot2, echo=FALSE, eval=TRUE,warning=F,message=F---------
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(ggpubr))



## ----setwd_introtoR,eval=F----------------------------------------------------
# setwd("/PathToMyDownload/Plotting_In_R-master/r_course")
# # e.g. setwd("/Users/mattpaul/Downloads/Intro_To_R_1Day/r_course")


## ----present_clean_ggplot2----------------------------------------------------
library(ggplot2)
patients_clean <- read.delim("data/patient-data-cleaned.txt",sep="\t")

class(patients_clean)
dim(patients_clean)


## ----present_clean2_ggplot2---------------------------------------------------
patients_clean[1:2,]


## ----present_clean3_ggplot2---------------------------------------------------
patients_clean$Smokes[1:5]
patients_clean$Height[1:5]


## ----present_clean4_ggplot2---------------------------------------------------
summary(patients_clean)








## ----missing_rest_ggplot2-----------------------------------------------------
pcPlot$mapping
pcPlot$theme
pcPlot$layers


## ----ggplot_aes_ggplot2-------------------------------------------------------
pcPlot <- ggplot(data=patients_clean)

pcPlot <- pcPlot+aes(x=Height,y=Weight)

pcPlot$mapping
pcPlot$theme
pcPlot$layers








## ----ggplot_aes_geom_display_ggplot2,fig.height=6,fig.width=8-----------------
pcPlot



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Geoms

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Geoms
  
---
"    
  )
  
}



## ----ggplot_simple_geom_point_ggplot2, fig.height=5, fig.width=8--------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point()


## ----line_simple_ggplot2, fig.height=5, fig.width=8---------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_line <- pcPlot+geom_line() 

pcPlot_line



## ----smooth_simple_ggplot2, fig.height=4.5, fig.width=8-----------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_smooth <- pcPlot+geom_smooth() 

pcPlot_smooth



## ----bar_simple_ggplot2, fig.height=5, fig.width=9----------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex))

pcPlot_bar <- pcPlot+geom_bar() 

pcPlot_bar




## ----histogram_simple_ggplot2, fig.height=4, fig.width=8,warning=FALSE--------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_hist <- pcPlot+geom_histogram() 

pcPlot_hist



## ----density_simple_ggplot2, fig.height=4.5, fig.width=8----------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_density <- pcPlot+geom_density() 

pcPlot_density



## ----boxplot_simple_ggplot2, fig.height=5, fig.width=8------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_boxplot <- pcPlot+geom_boxplot() 

pcPlot_boxplot


## ----violin_simple_ggplot2, fig.height=4.5, fig.width=8-----------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_violin <- pcPlot+geom_violin() 

pcPlot_violin


## ----multiplegeom_ggplot2, fig.height=4.5, fig.width=8------------------------
ggplot(data=patients_clean,
                 mapping=aes(x=Sex, y=Height))+ 
  geom_violin() +
  geom_jitter()


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Aesthetics

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Aesthetics
  
---
"    
  )
  
}



## ----scatter_colored_ggplot2, fig.height=4, fig.width=9-----------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point(color="red")


## ----scatter_simple_ggplot2, fig.height=4, fig.width=4,tidy=FALSE-------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,
                             y=Weight))
pcPlot+geom_point()


## ----scatter_aes_sexcolor_ggplot2, fig.height=4, fig.width=9------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,color=Sex))
pcPlot + geom_point()


## ----scatter_aes_sexShape_ggplot2, fig.height=4.5, fig.width=9,eval=F,echo=T----
# pcPlot <- ggplot(data=patients_clean,
#                  mapping=aes(x=Height,y=Weight,shape=Sex))
# pcPlot+geom_point()


## ----scatter_aes_sexShapeB_ggplot2, fig.height=4.5, fig.width=9,eval=T,echo=FALSE----
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,shape=Sex))
pcPlot+geom_point(size=2)














## ----multiplegeom_ggplot2_2, fig.height=4, fig.width=7------------------------
ggplot(data=patients_clean,
                 mapping=aes(x=Sex, y=Height, fill=Sex))+ 
  geom_violin() +
  geom_jitter(width=0.2)


## ----helpforArguments_ggplot2-------------------------------------------------
?geom_point


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Facets

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Facets
  
---
"    
  )
  
}



## ----facet_grid_SmokesBySex_ggplot2, fig.height=4, fig.width=9----------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot + facet_grid(Smokes~Sex)


## ----facet_grid_BySex_ggplot2, fig.height=4, fig.width=9----------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot + facet_grid(~Sex)


## ----facet_grid_SexBy_ggplot2, fig.height=4, fig.width=9----------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot + facet_grid(Sex~.)


## ----facet_Wrap_BySmokes_ggplot2, fig.height=4, fig.width=9, eval=F-----------
# pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
#                                          color=Sex))+geom_point()
# pcPlot + facet_wrap(~Smokes)


## ----facet_Wrap_BySmokes_ggplot2_2, fig.height=4, fig.width=9, eval=T, echo=F----
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot + facet_wrap(~Smokes)+ theme(strip.text.x = element_text(size = 8))


## ----facet_wrap_smokesBySexandPet_ggplot2, fig.height=4.5, fig.width=9--------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot + facet_wrap(~Pet+Smokes+Sex)



## ----facet_grid_smokesBySexandPet_ggplot2_2, fig.height=5, fig.width=12-------
pcPlot + facet_grid(Smokes~Sex+Pet)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Plotting Order

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Plotting Order
  
---
"    
  )
  
}



## ----plotOrderBoxplot_ggplot2, fig.height=4, fig.width=9----------------------
ggplot(patients_clean, aes(x=Sex, y=Weight)) + geom_boxplot()


## ----plotOrderCatBoxplot_ggplot2----------------------------------------------
levels(patients_clean$Sex)


## ----plotOrderControlBoxplot_ggplot2, fig.height=4, fig.width=9---------------
patients_clean$Sex <- factor(patients_clean$Sex, 
                             levels=c("Male","Female"))
ggplot(patients_clean,aes(x=Sex, y=Weight)) + geom_boxplot()


## ----plotOrderControlBoxplotEval_ggplot2,echo=FALSE,eval=FALSE----------------
# patients_clean %>%
#   mutate(Sex = factor(Sex,levels=c("Male","Female"))) %>%
#   ggplot(aes(x=Sex, y=Weight)) + geom_boxplot()


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Scales

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Scales
  
---
"    
  )
  
}



## ----scaleCont_ggplot2, facet_grid_smokesBySex_scalex, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight,color=Sex)) + geom_point()
pcPlot + geom_point() +
  scale_x_continuous(name="height ('cm')", limits = c(150,200),
                     breaks=c(160,180),labels=c("Short", "Tall"))



## ----scaleDiscrete_ggplot2, facet_grid_smokesBySex_scaleDisceteX, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Men", "Women"))



## ----scaleFullControl_ggplot2, facet_grid_smokesBySex_scaleDisceteXContinuousY, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height,fill=Smokes))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Men", "Women"))+
  scale_y_continuous(breaks=c(160,180),labels=c("Short", "Tall"))


## ----scaleOthers_ggplot2, facet_grid_height_weight, fig.height=3, fig.width=8----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=Sex))
pcPlot + geom_point(size=4)
                  


## ----facet_grid_height_weight_manualScale_ggplot2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=Sex))
pcPlot + geom_point(size=4) + 
  scale_color_manual(values = c("Green","Purple"),
                     name="Gender")
                


## ----facet_grid_height_weight_brewerScale_ggplot2, fig.height=5, fig.width=9, message = F, warning = F----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=Pet))
pcPlot + geom_point(size=4) + 
  scale_color_brewer(palette = "Set2")
                  


## ----cale_color_paletteer_d, fig.height=4, fig.width=8, message = F, warning = F----
library(paletteer)
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=Pet))
pcPlot + geom_point(size=4) + 
  scale_color_paletteer_d(palette = "wesanderson::Zissou1")
                  


## ----scale_color_viridis_d, fig.height=5, fig.width=9, message = F, warning = F----

pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=Pet))
pcPlot + geom_point(size=4) + 
  scale_color_viridis_d()
                  


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Continuous Scales

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Continuous Scales
  
---
"    
  )
  
}



## ----facet_grid_height_weight_BMIalpha_ggplot2, fig.height=4.5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,alpha=BMI))
pcPlot + geom_point(size=4) + 
  scale_alpha_continuous(range = c(0.5,1))


## ----facet_grid_height_weight_BMIsize_ggplot2, fig.height=5, fig.width=9------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point(alpha=0.8) + 
  scale_size_continuous(range = c(3,6))
                  


## ----facet_grid_height_weight_BMIsizeLimits_ggplot2, fig.height=4, fig.width=9,warning=FALSE----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + scale_size_continuous(range = c(3,6),
                                              limits = c(25,40))
 


## ----facet_grid_height_weight_BMIsizewithBreaks_ggplot2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + 
  scale_size_continuous(range = c(3,6), 
                        breaks=c(25,30), 
                        labels=c("Good","Good but not 25"))


## ----facet_grid_height_weight_BMIgradient_ggplot2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_color_gradient(low = "White",high="Red")
  


## ----facet_grid_height_weight_BMIgradient2_ggplot2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_color_gradient2(low = "Blue",mid="Black", high="Red",
                         midpoint = median(patients_clean$BMI))


## ----facet_grid_height_weight_BMIgradient2plus_ggplot2, fig.height=3.5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_color_gradient2(low = "Blue",
                         mid="Black",
                         high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")


## ----facet_grid_smokesBySex_scaleDisceteXContinuouswY_ggplot2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI,shape=Sex))
pcPlot + geom_point(size=4,alpha=0.8)+ 
  scale_shape_discrete(name="Gender") +
  scale_color_gradient2(low = "Blue",mid="Black",high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")


## ----conditional_colors_scales, fig.height=4, fig.width=9---------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,shape=Sex, color=ifelse(BMI > 30, "High",
                                                                ifelse(BMI < 25, "Low", "Middle"))))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_shape_discrete(name="Gender") +
  scale_color_manual(name = "BMI category", values=c("red", "blue", "grey"))


## ----fig.height=3.5, fig.width=3.5--------------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_color_viridis_c()




## ----fig.height=3.5, fig.width=3.5--------------------------------------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,color=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_color_paletteer_c(palette = "grDevices::Temps")



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Transformations

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Transformations
  
---
"    
  )
  
}



## ----stat_smooth_ggplot2, fig.height=4, fig.width=9---------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))
pcPlot+geom_point() + 
  stat_smooth()


## ----stat_smoothlm_ggplot2, fig.height=4, fig.width=9-------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))
pcPlot+geom_point() + stat_smooth(method="lm")



## ----stat_smoothlmgroups_ggplot2, fig.height=4, fig.width=9-------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight,color=Sex))
pcPlot+geom_point() +
  stat_smooth(method="lm")


## ----stat_smoothlmgroupsOverridden_ggplot2, fig.height=4, fig.width=9---------
pcPlot <- ggplot(data=patients_clean, mapping=aes(x=Height,y=Weight,color=Sex))
pcPlot+geom_point()+
  stat_smooth(aes(x=Height,y=Weight),method="lm",
                                inherit.aes = F)


## ----line_eqn, fig.height=3, fig.width=7--------------------------------------
library(ggpubr)
pcPlot <- ggplot(data=patients_clean,mapping=aes(x=Height,y=Weight)) +geom_point() + stat_smooth(method="lm", formula = y ~ x) 
pcPlot + stat_regline_equation(aes(label = after_stat(eq.label))) 



## ----line_eqn2, fig.height=4, fig.width=8-------------------------------------

pcPlot + 
  stat_regline_equation(label.y = 94, aes(label = after_stat(eq.label))) +
  stat_regline_equation(label.y = 91, aes(label = after_stat(rr.label)))



## ----line_eqn_groups, fig.height=3, fig.width=8-------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight,color=Sex)) +geom_point()+ stat_smooth(aes(x=Height,y=Weight), method="lm", formula = y ~ x) 
pcPlot +
  stat_regline_equation(data = patients_clean[patients_clean$Sex == "Male", ], 
                        label.y = 90, aes(label = after_stat(rr.label))) + 
  stat_regline_equation(data = patients_clean[patients_clean$Sex == "Female", ], 
                        label.x = 175, label.y = 65, aes(label = after_stat(rr.label)))  
  


## ----add_p1, message = F------------------------------------------------------
library(rstatix)
# https://rpkgs.datanovia.com/rstatix/

stat_test <- t_test(patients_clean, Height ~ Sex) 
stat_test <- add_xy_position(stat_test, x = "Sex", dodge = 0.8)

data.frame(stat_test) # show object as dataframe


## ----add_p2, fig.height=4, fig.width=8----------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height)) + 
  geom_boxplot()

pcPlot + stat_pvalue_manual(stat_test, label = "p") 



## ----grouped_p1---------------------------------------------------------------

grouped_data <- group_by(patients_clean, Sex)
stat_test_grp <- t_test(grouped_data, formula = Height ~ Smokes) 
stat_test_grp <- adjust_pvalue(stat_test_grp, method = "BH") 
stat_test_grp <- add_xy_position(stat_test_grp, x = "Sex", dodge = 0.8)

data.frame(stat_test_grp)


## ----grouped_p2, fig.height=4, fig.width=8------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex ,y=Height, fill = Smokes)) + 
  geom_boxplot() 

# don't inherit aesthetic to make this work 
pcPlot + stat_pvalue_manual(stat_test_grp, label = "p = {p.adj}", inherit.aes = F)


## ----stat_summary_ggplot2, fig.height=3.5, fig.width=9------------------------
pcPlot <- ggplot(data=patients_clean, mapping=aes(x=Sex,y=Height)) + geom_jitter()
pcPlot + 
  stat_summary(fun=quantile, geom="point",
                    color="purple", size=8)


## ----marginal_ggplot, fig.height=3, fig.width=8, message = F, warning = F-----
library(ggExtra)
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,color=Sex)) + geom_point()
ggMarginal(pcPlot, groupColor = TRUE, groupFill = TRUE)



## ----marginal_ggplot2, fig.height=4, fig.width=9, message = F, warning=F------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight,color=Sex)) + geom_point()
ggMarginal(pcPlot, groupColor = TRUE, groupFill = TRUE, type = "histogram", margins = "x")


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Themes

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Themes
  
---
"    
  )
  
}



## ----theme_default_ggplot2, fig.height=4, fig.width=4-------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot


## ----theme_minimal_ggplot2, fig.height=4, fig.width=4,tidy=FALSE--------------
pcPlot+theme_minimal()


## ----theme_default_ggplot2_2, fig.height=4, fig.width=4-----------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight)) + geom_point()
pcPlot


## ----eval=F, fig.height=3.5, fig.width=4,tidy=FALSE---------------------------
# install.packages("ggthemes")
# library(ggthemes)
# pcPlot+theme_wsj()
# 


## ----ggthemes, fig.height=3.5, fig.width=4,tidy=FALSE, echo=F-----------------
library(ggthemes)
pcPlot+theme_wsj()


## ----theme_custom_ggplot2, fig.height=7, fig.width=9,tidy=FALSE---------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+
  geom_point()
pcPlot+
  theme(
    text = element_text(color="red")
      )


## ----theme_custom1_ggplot2, fig.height=4.5, fig.width=9-----------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot + theme(text = element_text(color="red"),
        axis.title.y = element_text(angle=0))


## ----theme_custom2_ggplot2, fig.height=3, fig.width=9,eval=FALSE--------------
# 
# pcPlot <- ggplot(data=patients_clean,
#         mapping=aes(x=Height,y=Weight))+
#   geom_point()+
#   facet_grid(Sex~Smokes)
# pcPlot+
#   theme(
#     text = element_text(color="red"),
#     axis.title.y = element_text(angle=0),
#     axis.line = element_line(linetype = 0),
#     panel.background=element_rect(fill="white"),
#     strip.background=element_rect(fill="cyan")
#     )


## ----theme_custom22_ggplot2, fig.height=3, fig.width=9,eval=TRUE,echo=FALSE----

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+
  geom_point()+
  facet_grid(Sex~Smokes)
pcPlot+
  theme(
    text = element_text(color="red"),
    axis.title.y = element_text(angle=0),
    axis.line = element_line(linetype = 0),
    panel.background=element_rect(fill="white"),
    strip.background=element_rect(fill="cyan")
    )


## ----legendD_ggplot2, fig.height=5, fig.width=9-------------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot


## ----legendleft_ggplot2, fig.height=5, fig.width=9----------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot+theme(legend.position="left")


## ----legendText_ggplot2, fig.height=4, fig.width=8----------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         color=Sex))+geom_point()
pcPlot+theme(legend.text = element_text(color="darkred"),
             legend.title = element_text(size=20),
             legend.position = "bottom"
             )


## ----theme_custom8_ggplot2, fig.height=5, fig.width=9-------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()+theme_bw()
pcPlot+
  theme(text = element_text(color="red"))












## ----theme_custom84FS4wd_ggplot2,echo=AsSlides,eval=FALSE---------------------
# newTheme <- theme_bw()
# theme_set(newTheme)
# myTheme <- theme_get()


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Titles and Labels

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Titles and Labels
  
---
"    
  )
  
}



## ----theme_labs_ggplot2,fig.height=5, fig.width=9-----------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot+labs(title="Weight vs Height",y="Height (cm)")


## ----theme_ggtitle_ggplot2,fig.height=5, fig.width=9--------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot+ggtitle("Weight vs Height")+ylab("Height (cm)")


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



## ----ggsaving_ggplot2, eval=FALSE,fig.height=4, fig.width=9-------------------
# 
# pcPlot <- ggplot(data=patients_clean,
#         mapping=aes(x=Height,y=Weight))+geom_point()
# 
# ggsave(pcPlot,filename = "anExampleplot.png",width = 15,
#        height = 15,units = "cm")


## ----save_pdf_basePlotting,eval=FALSE-----------------------------------------
# 
# pdf(file = "anExampleplot.pdf", paper = "A4")
# plot(control)
# dev.off()


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Other external packages

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Other external packages
  
---
"    
  )
  
}



## -----------------------------------------------------------------------------
library(UpSetR)
mutations <- read.csv( system.file("extdata", "mutations.csv", package = "UpSetR"), header=T, sep = ",")
mutations[1:10,1:10]


## ----fig.height=4, fig.width=9------------------------------------------------
upset(mutations)



## ----fig.height=4, fig.width=9------------------------------------------------

upset(mutations, nsets=10)



## -----------------------------------------------------------------------------
myupset <- upset(mutations)
class(myupset)


## -----------------------------------------------------------------------------
library(Seurat)
data("pbmc_small")
DimPlot(object = pbmc_small)


## -----------------------------------------------------------------------------
mydimplot <- DimPlot(object = pbmc_small)
class(mydimplot)


## ----fig.height=4, fig.width=9------------------------------------------------
mydimplot + ggtitle("tSNE of scRNAseq - PBMC") + scale_color_viridis_d() + theme_bw()



## -----------------------------------------------------------------------------

mydimplot$layers


## ----fig.height=4, fig.width=9------------------------------------------------
mydimplot$layers <- NULL

mydimplot + geom_point(aes(x=tSNE_1, y=tSNE_2, color=ident, size=2)) + ggtitle("tSNE of scRNAseq - PBMC") + scale_color_viridis_d() + theme_bw()



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Interactive Plots

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Interactive Plots
  
---
"    
  )
  
}



## ----warnings=F, messages=F---------------------------------------------------
library(plotly)


## ----eval=T,fig.height=4, fig.width=9-----------------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()

ggplotly(pcPlot)


## -----------------------------------------------------------------------------
load("data/pcPlot.RData")



## -----------------------------------------------------------------------------

head(pcPlot$data)



## -----------------------------------------------------------------------------

pcPlot$mapping

pcPlot$layers


## ----echo=FALSE, eval=FALSE,fig.height=4, fig.width=9-------------------------
# 
# to_plot <- prcomp(assay(toPlot))$rotation-(prcomp(assay(toPlot))$rotation/matrix(rnorm(36), 6, 6)/100)
# 
# rownames(to_plot) <- c("A_1","A_2",
#                        "B_1","B_2",
#                        "C_1","C_2")
# to_plot <- as.data.frame(to_plot)
# to_plot$Sample <- rownames(to_plot)
# 
# to_plot$Time <- factor(c("0hr","0hr","2hr","2hr","12hr","12hr"), levels = c("0hr","2hr","12hr"))
# to_plot$Rep <- factor(c("1","2","1","2","1","2"))
# pca_res <- to_plot
# pca_res[2,1:2] <- c(0.6090663,  0.5384380)
# pca_res[3,1:2] <- c(0.4596307,  0.5424412)
# pca_res[4,1:2] <- c(0.4190463,  0.4812430)
# pca_res[5,1:2] <- c(0.3220796,  0.5434719)
# pca_res[6,1:2] <- c(0.3130591,  0.4426442)
# pcPlot <- ggplot(data=pca_res,
#         mapping=aes(x=PC1,y=PC2, color= Time, shape=Rep))
# save(pcPlot, file = "../data/pcPlot.RData")
# 


## ----fig.height=4, fig.width=9------------------------------------------------

ggplotly(pcPlot)


## ----fig.height=4, fig.width=9------------------------------------------------

ggplotly(pcPlot + geom_point(aes(label = Sample)))


## ----fig.height=4, fig.width=9------------------------------------------------
ggplotly(pcPlot + geom_point(aes(text = Sample )), source = "select", tooltip = c("Sample"))

