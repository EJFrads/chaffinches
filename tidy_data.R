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







