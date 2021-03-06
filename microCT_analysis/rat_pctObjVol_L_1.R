library(dplyr)
library(ggplot2)
library(gridExtra)


# Import csv file into 'lung' dataframe
lung <- read.csv("C:\\Users\\MicroCT\\Documents\\mouse_pfc_lung_results\\PFC_lung_data_6.25.18_GC.csv")

##############################################################################
# APEX
##############################################################################
# create apex dataframe
rat_apex_1 <- filter(lung, 
                     Species == "RAT", 
                     Region == "APEX",
                     Side == "LEFT",
                     Object_measured %in% c("ALVEOLI", "MICROFIL", "PARENCHYMA"), 
                     VOI_Method == "METHOD_1")

# extract percentage object volume as a function of the object measured (i.e. parenchyma, alveoli, and microfil)
pct_obj_vol <- select(rat_apex_1, Object_measured, Percent_object_volume)

# create barplot using ggplot
p1 <- ggplot(pct_obj_vol, aes(x=Object_measured, y=Percent_object_volume)) +
      geom_bar(stat = "identity", position = "dodge", fill = "steelblue") +
      ylim(0, 100) +
      theme(axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            plot.title = element_text(hjust = 0.5))
p1 <- p1 + ggtitle("Apex")


###############################################################################
# MID
###############################################################################
rat_mid_1 <- filter(lung, 
                    Species == "RAT", 
                    Region == "MID", 
                    Side == "LEFT",
                    Object_measured %in% c("ALVEOLI", "MICROFIL", "PARENCHYMA"), 
                    VOI_Method == "METHOD_1")

# extract percentage object volume as a function of the object measured (i.e. parenchyma, alveoli, and microfil)
pct_obj_vol2 <- select(rat_mid_1, Object_measured, Percent_object_volume)

# create barplot using ggplot
p2 <- ggplot(pct_obj_vol2, aes(x=Object_measured, y=Percent_object_volume)) + 
      geom_bar(stat = "identity", position = "dodge", fill = "steelblue") +
      ylim(0, 100) +
      theme(axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            plot.title = element_text(hjust = 0.5))
p2 <- p2 + ggtitle("Mid")


##############################################################################
# BASE
##############################################################################
rat_base_1 <- filter(lung, 
                      Species == "RAT", 
                      Region == "BASE",
                      Side == "LEFT",
                      Object_measured %in% c("ALVEOLI", "MICROFIL", "PARENCHYMA"), 
                      VOI_Method == "METHOD_1")

# extract percentage object volume as a function of the object measured (i.e. parenchyma, alveoli, and microfil)
pct_obj_vol3 <- select(rat_base_1, Object_measured, Percent_object_volume)

# create barplot using ggplot
p3 <- ggplot(pct_obj_vol3, aes(x=Object_measured, y=Percent_object_volume)) + 
      geom_bar(stat = "identity", position = "dodge", fill = "steelblue") + 
      ylim(0, 100) +
      theme(axis.title.x = element_blank(),
            plot.title = element_text(hjust = 0.5))
p3 <- p3 + ggtitle("Base")


#############################################################################
# GRAPH
##############################################################################
## create multi-plot
grid.arrange(p3, p2, p1, ncol=3, top="Rat - Percent Object Volume - Left Lung")



