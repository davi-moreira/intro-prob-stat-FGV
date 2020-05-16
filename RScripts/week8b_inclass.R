# Load the dataset
resume <- read.csv('https://raw.githubusercontent.com/umbertomig/intro-prob-stat-FGV/master/datasets/resume.csv')
head(resume)

# Race x Callback
# race = (0) black & (1) white
lm(call~race, data=resume)

# call = 0.06448 + white * 0.03203 + error

# Gender x Callback
# gender = (1) female x (0) male
resume$female = as.numeric(resume$sex == 'female')
lm(call~female, data=resume)

# call = 0.073843 + female * 0.008645 + error

# Callback x (Gender x Race)
# female = (1) female x (0) male
# black  = (1) black  x (0) white
resume$black = as.numeric(resume$race == 'black')
lm(call ~ female + black + female*black, data=resume)

# call = 0.088696 + female * 0.010229 +
#                 - black  * 0.030408 +
#                 - female * black * 0.002239 +
#                 + error


## Congress US
library(tidyverse)
congress <- read.csv("https://raw.githubusercontent.com/umbertomig/intro-prob-stat-FGV/master/datasets/congress.csv")
head(congress)

# Plots
congress %>%
  ggplot(aes(x = dwnom1, y = dwnom2, colour = party)) +
  geom_point() + facet_wrap(~ congress) + coord_fixed() +
  scale_y_continuous("racial liberalism/conservatism",
                     limits = c(-1.5, 1.5)) +
  scale_x_continuous("economic liberalism/conservatism",
                     limits = c(-1.5, 1.5)) +
  scale_colour_manual(values = c(Democrat = "blue",
                                 Republican = "red",
                                 Other = "green"))


congress %>%
  group_by(congress, party) %>%
  summarise(dwnom2 = mean(dwnom2)) %>%
  filter(party %in% c("Democrat", "Republican")) %>%
  ggplot(aes(x = congress, y = dwnom2,
             colour = fct_reorder2(party, congress, dwnom2)))+
  geom_line() + 
  scale_colour_manual(values = c(Democrat = "blue",
                                 Republican = "red",
                                 Other = "green")) +
  labs(y = "DW-NOMINATE score (2nd Dimension)", 
       x = "Congress", colour = "Party")
