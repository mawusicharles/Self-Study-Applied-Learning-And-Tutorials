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

# sorting data 

xed<-gapminder %>% filter(year>=2000) %>%
  group_by(continent) %>% 
  summarize(across(c(lifeExp, pop,gdpPercap),  list(avg=~mean(.))) ) %>% 
  arrange(continent, desc(gdpPercap_avg)) 
xed %>% select(gdpPercap_avg, continent) %>%
  as.numeric(xed$gdpPercap_avg) %>% hist()


