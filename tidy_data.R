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

#hi Emily, it's Hannah. Here's a bit of my code just to check this works
chaff2 %>% group_by(sex) %>% 
  summarise(mean = mean(mass),
            n = length(n),
            sd = sd(mass))

