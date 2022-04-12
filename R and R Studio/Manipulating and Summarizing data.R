library("gapminder")
library("tidyverse")
data(gapminder)
head(gapminder)
library(ggplot2)

# using pipes to manipulate data 

gapminder %>% filter(year>=1990 & continent=="Africa") %>%
  lm(gdpPercap~pop, data=.) %>% summary()

# using %in%

countryafrica<-c("Ghana", "Nigeria", " Togo", "Gabon")

gapminder %>% filter(country %in% countryafrica & year >=2000) %>% head()

