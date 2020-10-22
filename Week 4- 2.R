#Read in data and format the table


Chaff <- read.table("chaff.txt", header = T)

library(tidyverse)


chaff2<- Chaff%>% 
  pivot_longer(names_to = "sex", 
               values_to = "max",
               cols = everything())
#Summarise the data and test whether there is a difference between the mass of male and female chaffinches
tapply(chaff2$max, chaff2$sex, mean)

t.test(chaff2$max~chaff2$sex, paired = TRUE)
#Males larger with a mean of 22.275
#P value of 0.02098 therefore difference is significant
# t = -2.5168 df = 19
------------------
  
  
  library(ggplot2)

chaff2 %>% ggplot(aes(x = sex, y = max), 
                  geom_point())