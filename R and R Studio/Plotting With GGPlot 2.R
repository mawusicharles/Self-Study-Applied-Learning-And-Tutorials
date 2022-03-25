#----------------------------------------------------------------------
#                          Plotting With GGplot 2 
# ---------------------------------------------------------------------

# install.packages("gapminder")

library(gapminder)
str(gapminder) # shows the structure of the data 
# Sub-setting Data Using Tidyverse & Dplyr Pipes 
# install.packages("tidyverse")

library(tidyverse)
                       Algeria<-gapminder %>% filter(country=="Algeria")%>% head() 
pander(Algeria)
gapminder %>% filter(country=="Algeria" & year>=1995)%>% head() 
China<-gapminder %>% filter(country=="China" & year>=1990)%>% head() 
view(China)
China$ye

# GGplot 2 
library(ggplot2)
ggplot(data = China,
       aes(x=year, y=lifeExp))+
  geom_point(color="red", size=3)+
  xlab("year")+
  ylab("Life Expenctancy")+
  ggtitle("Life Expectancy by Year in China")+
  theme_bw(base_size = 10)

# another plot     
ggplot(data = gapminder,
       aes(x=year, y=lifeExp, 
           group=country,
           color=continent))+
  geom_line()+
  xlab("year")+
  ylab("Life Expenctancy")+
  ggtitle("Life Expectancy by Year in China")+
  theme_bw(base_size = 10)+
  facet_wrap(~continent) # This breaks the graphs by continents

                                               
  

