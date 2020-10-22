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


##save new script to new directory





