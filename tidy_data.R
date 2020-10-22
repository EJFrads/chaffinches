##Add directories to project

dir.create("data_raw")
dir.create("data_processed")
dir.create("analysis")
dir.create("figures")

##import data
chaff <- read.table("data_raw/chaff.txt", header = T)

##Tidy data
library(tidyverse)
chaff2 <- pivot_longer(data = chaff, 
                       cols = everything(),
                       names_to = "gender",
                       values_to = "mass")

##save tidy data to file
file <- "data_processed/chaff_tidy.txt"
write.table(chaff2, 
            file, 
            quote = FALSE,
            row.names = FALSE)

##summarise the data
str(chaff2)
chaff2 %>% group_by(gender) %>% 
  summarise(mean = mean(mass),
            n = length(n),
            sd = sd(mass))

##analysis to see if there is a difference in mean between genders
t.test(data = chaff2,
       mass ~ gender,
       var.equal = T)








=======
##t test shows females have a significantly lower mass than males



##create a figure for chaff2
library(ggplot2)

fig1 <- ggplot(chaff2, aes(gender, mass, fill = gender)) +
         geom_boxplot(alpha = 0.5, fill = c("darkgreen", "lightgray")) +
         geom_jitter(colour = "black",size = 0.6,width = 0.2)


# figure saving settings
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

ggsave("figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)

=======
##t test shows females have a significantly lower mass than males



##create a figure for chaff2
library(ggplot2)

fig1 <- ggplot(chaff2, aes(gender, mass, fill = gender)) +
         geom_boxplot(alpha = 0.5, fill = c("darkgreen", "lightgray")) +
         geom_jitter(colour = "black",size = 0.6,width = 0.2)


# figure saving settings
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

ggsave("figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)




#hi Emily, it's Hannah. Here's a bit of my code just to check this works
chaff2 %>% group_by(sex) %>% 
  summarise(mean = mean(mass),
            n = length(n),
            sd = sd(mass))