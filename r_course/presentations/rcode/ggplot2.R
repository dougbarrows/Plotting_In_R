## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
AsSlides <- TRUE

## ----complex,eval=F------------------------------------------------------
## 
## ggplot(data = <default data set>,
##        aes(x = <default x axis variable>,
##            y = <default y axis variable>,
##            ... <other default aesthetic mappings>),
##        ... <other plot defaults>) +
## 
##        geom_scatter(aes(size = <size variable for this geom>,
##                       ... <other aesthetic mappings>),
##                   data = <data for this point geom>,
##                   stat = <statistic string or function>,
##                   position = <position string or function>,
##                   color = <"fixed color specification">,
##                   <other arguments, possibly passed to the _stat_ function) +
## 
##   scale_<aesthetic>_<type>(name = <"scale label">,
##                      breaks = <where to put tick marks>,
##                      labels = <labels for tick marks>,
##                      ... <other options for the scale>) +
## 
##   ggtitle("Graphics/Plot")+
##   xlab("Weight")+
##   ylab("Height")+
## 
##   theme(plot.title = element_text(colour = "gray"),
##         ... <other theme elements>)
## 

## ----present_cleanEralt, echo=FALSE--------------------------------------
library(ggplot2)

patients_clean <- read.delim("data/patient-data-cleaned.txt",
                             sep="\t")


## ----simple,eval=T,warning=FALSE,fig.height=4.5,fig.width=9--------------
ggplot(data=patients_clean,
       aes(y=Weight,x=Height,colour=Sex,
           size=BMI,shape=Pet)) + 
  geom_point()


## ----load_packages, echo=FALSE, eval=TRUE,warning=F,message=F------------
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(lubridate))

## ----present_clean-------------------------------------------------------
library(ggplot2)

patients_clean <- read.delim("data/patient-data-cleaned.txt",
                             sep="\t")


## ----ggplot_only,echo=!AsSlides,eval=!AsSlides---------------------------
## pcPlot <- ggplot(data=patients_clean)
## class(pcPlot)
## pcPlot$data[1:4,]

## ----ggplot_onlyFS1,echo=AsSlides,eval=AsSlides--------------------------
pcPlot <- ggplot(data=patients_clean)
class(pcPlot)

## ----ggplot_onlyFS2,echo=AsSlides,eval=AsSlides--------------------------
pcPlot$data[1:4,]

## ----missing_rest--------------------------------------------------------
pcPlot$mapping
pcPlot$theme
pcPlot$layers

## ----ggplot_aes----------------------------------------------------------
pcPlot <- ggplot(data=patients_clean)

pcPlot <- pcPlot+aes(x=Height,y=Weight)

pcPlot$mapping
pcPlot$theme
pcPlot$layers

## ----ggplot_aes_geom,fig.height=4,fig.width=7,eval=!AsSlides,echo=!AsSlides----
## pcPlot <- ggplot(data=patients_clean)
## 
## pcPlot <- pcPlot+aes(x=Height,y=Weight)
## pcPlot <- pcPlot+geom_point()
## pcPlot
## pcPlot$mapping
## pcPlot$theme
## pcPlot$layers
## 

## ----ggplot_aes_geomFS1,fig.height=5,fig.width=8,eval=AsSlides,echo=AsSlides----
pcPlot <- ggplot(data=patients_clean)

pcPlot <- pcPlot+aes(x=Height,y=Weight)
pcPlot <- pcPlot+geom_point()


## ----ggplot_aes_geomFS2,fig.height=5,fig.width=8,eval=AsSlides,echo=AsSlides----

pcPlot$mapping
pcPlot$theme
pcPlot$layers


## ----ggplot_aes_geom_display,fig.height=6,fig.width=8--------------------
pcPlot


## ----ggplot_simple_geom_point, fig.height=6, fig.width=8-----------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point()

## ---- line_simple, fig.height=5, fig.width=8-----------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_line <- pcPlot+geom_line() 

pcPlot_line


## ---- smooth_simple, fig.height=6, fig.width=8---------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))

pcPlot_smooth <- pcPlot+geom_smooth() 

pcPlot_smooth


## ---- bar_simple, fig.height=5, fig.width=9------------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex))

pcPlot_bar <- pcPlot+geom_bar() 

pcPlot_bar



## ---- histogram_simple, fig.height=6, fig.width=8,warning=FALSE----------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_hist <- pcPlot+geom_histogram() 

pcPlot_hist


## ---- density_simple, fig.height=6, fig.width=8--------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height))

pcPlot_density <- pcPlot+geom_density() 

pcPlot_density


## ---- boxplot_simple, fig.height=5, fig.width=8--------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_boxplot <- pcPlot+geom_boxplot() 

pcPlot_boxplot

## ---- violin_simple, fig.height=6, fig.width=8---------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))

pcPlot_violin <- pcPlot+geom_violin() 

pcPlot_violin

## ---- scatter_coloured, fig.height=4, fig.width=9------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point(color="red")

## ---- scatter_simple, fig.height=4, fig.width=9--------------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight))
pcPlot+geom_point()

## ---- scatter_aes_sexColour, fig.height=4, fig.width=9-------------------
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,colour=Sex))
pcPlot+geom_point()

## ---- scatter_aes_sexShape, fig.height=6, fig.width=9,eval=F,echo=T------
## pcPlot <- ggplot(data=patients_clean,
##                  mapping=aes(x=Height,y=Weight,shape=Sex))
## pcPlot+geom_point()

## ---- scatter_aes_sexShapeB, fig.height=6, fig.width=9,eval=T,echo=FALSE----
pcPlot <- ggplot(data=patients_clean,
                 mapping=aes(x=Height,y=Weight,shape=Sex))
pcPlot+geom_point(size=2)

## ---- aes_in_geom,eval=!AsSlides,echo=!AsSlides--------------------------
## pcPlot <- ggplot(data=patients_clean)
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Sex))
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes))
## pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes,shape=Sex))
## pcPlot+geom_violin(aes(x=Sex,y=Height,fill=Smokes))

## ---- aes_in_geomFS1,eval=AsSlides,echo=AsSlides-------------------------
pcPlot <- ggplot(data=patients_clean)

## ---- aes_in_geomFS2,eval=AsSlides,echo=AsSlides-------------------------
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Sex))

## ---- aes_in_geomFS3,eval=AsSlides,echo=AsSlides-------------------------
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes))

## ---- aes_in_geomFS4,eval=AsSlides,echo=AsSlides-------------------------
pcPlot+geom_point(aes(x=Height,y=Weight,colour=Smokes,shape=Sex))

## ---- aes_in_geomFS5,eval=AsSlides,echo=AsSlides-------------------------
pcPlot+geom_violin(aes(x=Sex,y=Height,fill=Smokes))

## ---- helpforArguments---------------------------------------------------
?geom_point

## ---- facet_grid_SmokesBySex, fig.height=4, fig.width=9------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(Smokes~Sex)

## ---- facet_grid_BySex, fig.height=4, fig.width=9------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(~Sex)

## ---- facet_grid_SexBy, fig.height=4, fig.width=9------------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_grid(Sex~.)

## ---- facet_Wrap_BySmokes, fig.height=4, fig.width=9---------------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_wrap(~Smokes)

## ---- facet_wrap_smokesBySexandPet, fig.height=5, fig.width=9------------
pcPlot <- ggplot(data=patients_clean,aes(x=Height,y=Weight,
                                         colour=Sex))+geom_point()
pcPlot + facet_wrap(~Pet+Smokes+Sex)

## ---- facet_grid_smokesBySexandPet, fig.height=6, fig.width=9------------
pcPlot + facet_grid(Smokes~Sex+Pet)

## ---- fig.height=4, fig.width=9------------------------------------------
ggplot(patients_clean, aes(x=Sex, y=Weight)) + geom_boxplot()

## ------------------------------------------------------------------------
summary(patients_clean$Sex)

## ---- fig.height=4, fig.width=9------------------------------------------
patients_clean$Sex <- factor(patients_clean$Sex, 
                             levels=c("Male","Female"))
ggplot(patients_clean,aes(x=Sex, y=Weight)) + geom_boxplot()

## ----echo=FALSE,eval=FALSE-----------------------------------------------
## patients_clean %>%
##   mutate(Sex = factor(Sex,levels=c("Male","Female"))) %>%
##   ggplot(aes(x=Sex, y=Weight)) + geom_boxplot()

## ---- facet_grid_smokesBySex_scalex, fig.height=4.5, fig.width=9---------

pcPlot +
  geom_point() +
  facet_grid(Smokes~Sex)+
  scale_x_continuous(name="height ('cm')",
                     limits = c(100,200),
                     breaks=c(125,150,175),
                     labels=c("small","justright","tall"))


## ---- facet_grid_smokesBySex_scaleDisceteX, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Women", "Men"))


## ---- facet_grid_smokesBySex_scaleDisceteXContinuousY, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,aes(x=Sex,y=Height,fill=Smokes))
pcPlot +
  geom_violin(aes(x=Sex,y=Height)) +
  scale_x_discrete(labels=c("Women", "Men"))+
  scale_y_continuous(breaks=c(160,180),labels=c("Short", "Tall"))

## ---- facet_grid_height_weight, fig.height=3, fig.width=8----------------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Sex))
pcPlot + geom_point(size=4)
                  

## ---- facet_grid_height_weight_manualScale, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Sex))
pcPlot + geom_point(size=4) + 
  scale_color_manual(values = c("Green","Purple"),
                     name="Gender")
                  

## ---- facet_grid_height_weight_brewerScale, fig.height=5, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=Pet))
pcPlot + geom_point(size=4) + 
  scale_color_brewer(palette = "Set2")
                  

## ---- facet_grid_height_weight_BMIalpha, fig.height=5, fig.width=9-------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,alpha=BMI))
pcPlot + geom_point(size=4) + 
  scale_alpha_continuous(range = c(0.5,1))
                  

## ---- facet_grid_height_weight_BMIsize, fig.height=5, fig.width=9--------
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point(alpha=0.8) + 
  scale_size_continuous(range = c(3,6))
                  

## ---- facet_grid_height_weight_BMIsizeLimits, fig.height=4, fig.width=9,warning=FALSE----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + scale_size_continuous(range = c(3,6),
                                              limits = c(25,40))
                  

## ---- facet_grid_height_weight_BMIsizewithBreaks, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,size=BMI))
pcPlot + geom_point() + 
  scale_size_continuous(range = c(3,6), 
                        breaks=c(25,30), 
                        labels=c("Good","Good but not 25"))

## ---- facet_grid_height_weight_BMIgradient, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient(low = "White",high="Red")
                  

## ---- facet_grid_height_weight_BMIgradient2, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient2(low = "Blue",mid="Black", high="Red",
                         midpoint = median(patients_clean$BMI))

## ---- facet_grid_height_weight_BMIgradient2plus, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI))
pcPlot + geom_point(size=4,alpha=0.8) + 
  scale_colour_gradient2(low = "Blue",
                         mid="Black",
                         high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")

## ---- facet_grid_smokesBySex_scaleDisceteXContinuouswY, fig.height=4, fig.width=9----
pcPlot <- ggplot(data=patients_clean,
                 aes(x=Height,y=Weight,colour=BMI,shape=Sex))
pcPlot + geom_point(size=4,alpha=0.8)+ 
  scale_shape_discrete(name="Gender") +
  scale_colour_gradient2(low = "Blue",mid="Black",high="Red",
                         midpoint = median(patients_clean$BMI),
                         breaks=c(25,30),labels=c("Low","High"),
                         name="Body Mass Index")

## ---- stat_smooth, fig.height=5, fig.width=9-----------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth()

## ---- stat_smoothlm, fig.height=4, fig.width=9---------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))
pcPlot+geom_point()+stat_smooth(method="lm")

## ---- stat_smoothlmgroups, fig.height=4, fig.width=9---------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(method="lm")

## ---- stat_smoothlmgroupsOverridden, fig.height=4, fig.width=9-----------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height,colour=Sex))
pcPlot+geom_point()+stat_smooth(aes(x=Weight,y=Height),method="lm",
                                inherit.aes = F)

## ---- stat_summary, fig.height=3.5, fig.width=9--------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Sex,y=Height))+geom_jitter()
pcPlot+stat_summary(fun.y=quantile,geom="point",
                    colour="purple",size=8)

## ---- theme_minimal, fig.height=4, fig.width=9---------------------------
pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+theme_minimal()

## ---- theme_custom, fig.height=3, fig.width=9----------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+theme(
            text = element_text(colour="red"),
            axis.text = element_text(colour="red")
           )

## ---- theme_custom1, fig.height=3, fig.width=9---------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+theme(
            text = element_text(colour="red"),
            axis.text = element_text(colour="red"),
            axis.title.y = element_text(angle=0)
           )

## ---- theme_custom2, fig.height=3, fig.width=9---------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+
  geom_point()+
  facet_grid(Sex~Smokes)
pcPlot+theme(
            text = element_text(colour="red"),
            axis.text = element_text(colour="red"),
            axis.title.y = element_text(angle=0),
            axis.line = element_line(linetype = 0),
            panel.background=element_rect(fill="white"),
            strip.background=element_rect(fill="cyan")
           )

## ---- theme_custom8, fig.height=4, fig.width=9---------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+
  theme_bw()+
  theme(text = element_text(colour="red"))

## ---- theme_customMiniVsBWDuck,echo=T,eval=F,collapse=TRUE---------------
## pcPlot+
##   theme(text = element_text(colour="red"))
## 
## pcPlot+
##   theme_minimal()+
##   theme(text = element_text(colour="red"))

## ---- theme_customMiniVsBW,echo=F,eval=T,collapse=FALSE,fig.height=4, fig.width=9,message=FALSE,warning=FALSE----
library(gridExtra)
p <- pcPlot+
  theme(text = element_text(colour="red"))

p2 <- pcPlot+
  theme_minimal()+
  theme(text = element_text(colour="red"))
grid.arrange(p, p2, ncol=2)

## ---- theme_custom84,echo=!AsSlides,eval=!AsSlides-----------------------
##   oldTheme <- theme_bw()
## 
##   newTheme_Plus <- theme_bw() +
##   theme(text = element_text(colour="red"))
## 
##   newTheme_Replace <- theme_bw() %+replace%
##   theme(text = element_text(colour="red"))
## 
##   oldTheme$text
##   newTheme_Plus$text
##   newTheme_Replace$text

## ---- theme_custom84FS1,echo=AsSlides,eval=AsSlides----------------------
  oldTheme <- theme_bw()
  
  newTheme_Plus <- theme_bw() +
  theme(text = element_text(colour="red"))
  
  newTheme_Replace <- theme_bw() %+replace%
  theme(text = element_text(colour="red"))

## ---- theme_custom84FS2,echo=AsSlides,eval=AsSlides----------------------
  
  oldTheme$text

## ---- theme_custom84FS3,echo=AsSlides,eval=AsSlides----------------------
  
  newTheme_Plus$text

## ---- theme_custom84FS4,echo=AsSlides,eval=AsSlides----------------------

  newTheme_Replace$text

## ---- theme_labs,fig.height=4, fig.width=9-------------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Weight,y=Height))+geom_point()
pcPlot+labs(title="Weight vs Height",y="Height (cm)")

## ---- theme_ggtitle,fig.height=4, fig.width=9----------------------------

pcPlot <- ggplot(data=patients_clean,
        mapping=aes(x=Height,y=Weight))+geom_point()
pcPlot+ggtitle("Weight vs Height")+ylab("Height (cm)")

## ---- ggsaving, eval=FALSE,fig.height=4, fig.width=9---------------------
## 
## pcPlot <- ggplot(data=patients_clean,
##         mapping=aes(x=Weight,y=Height))+geom_point()
## ggsave(pcPlot,filename = "anExampleplot.png",width = 15,
##        height = 15,units = "cm")

