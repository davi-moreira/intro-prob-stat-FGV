fgvst <- c(rep(1,1600),rep(0,6400))
mean(fgvst)

# LLN
spl <- sample(fgvst, 10)
mean(spl)
min(spl)
max(spl)
median(spl)

spl <- sample(fgvst, 100)
mean(spl)
min(spl)
max(spl)
median(spl)

spl <- sample(fgvst, 2000)
mean(spl)
min(spl)
max(spl)
median(spl)

# True mean: 0.2

## CLT
fgvst <- c(rep(1,1600),rep(0,6400))
mean(fgvst) # 20.00%

sps <- numeric()
for (i in 1:100) {
  sps[i] <- mean(sample(fgvst, 2000))
}
hist(sps)
mean(sps)
sd(sps)

# 95% confidence interval
mean(sps)-1.96*sd(sps)
mean(sps)+1.96*sd(sps)

# If have 100 firms, I expect 5 of them to be out...

## CLT
fgvst <- c(rep(1,1600),rep(0,6400))
mean(fgvst) # 20.00%

sps <- numeric()
for (i in 1:100) {
  sps[i] <- mean(sample(fgvst, 2000))
}
hist(sps)
mean(sps)
sd(sps) # standard error

# 95% confidence interval
mean(sps)
mean(sps)-1.96*sd(sps)
mean(sps)+1.96*sd(sps)

# get it right
table(sps>=(mean(sps)-1.96*sd(sps))&sps<=(mean(sps)+1.96*sd(sps)))

sps[sps>=(mean(sps)-1.96*sd(sps))&sps<=(mean(sps)+1.96*sd(sps))]

# If have 100 firms, I expect 5 of them to be out...

# get it wrong
sps[!(sps>=(mean(sps)-1.96*sd(sps))&sps<=(mean(sps)+1.96*sd(sps)))]

## with 68% confidence interval
mean(sps)
mean(sps)-1*sd(sps)
mean(sps)+1*sd(sps)
# get it right 
table(sps>=(mean(sps)-1*sd(sps))&sps<=(mean(sps)+1*sd(sps)))

sps[sps>=(mean(sps)-1*sd(sps))&sps<=(mean(sps)+1*sd(sps))]

# get it wrong
sps[!(sps>=(mean(sps)-1*sd(sps))&sps<=(mean(sps)+1*sd(sps)))]

## with 99.7% confidence interval
mean(sps)
mean(sps)-3*sd(sps)
mean(sps)+3*sd(sps)
# get it right 
table(sps>=(mean(sps)-3*sd(sps))&sps<=(mean(sps)+3*sd(sps)))

sps[sps>=(mean(sps)-3*sd(sps))&sps<=(mean(sps)+3*sd(sps))]

# get it wrong
sps[!(sps>=(mean(sps)-3*sd(sps))&sps<=(mean(sps)+3*sd(sps)))]

## Resume example and uncertainty

# Load the dataset
resume <- read.csv('https://raw.githubusercontent.com/umbertomig/intro-prob-stat-FGV/master/datasets/resume.csv')
head(resume)

# Load tidyverse
library(tidyverse)

# callback by race
resume %>%
  group_by(race) %>%
  summarize(meanRace = mean(call, na.rm=T),
            seRace = sqrt(var(call, na.rm = T)/n())) %>%
  mutate(lowerLimit = meanRace - 1.96*seRace,
         upperLimit = meanRace + 1.96*seRace)

# callback by gender
resume %>%
  group_by(sex) %>%
  summarize(meanGender = mean(call, na.rm=T),
            seGender = sqrt(var(call, na.rm = T)/n())) %>%
  mutate(lowerLimit = meanGender - 1.96*seGender,
         upperLimit = meanGender + 1.96*seGender)

## ATE - Average Treatment Effect
aux <- resume %>%
  group_by(race) %>%
  summarize(meanRace = mean(call, na.rm=T),
            seRace = sqrt(var(call, na.rm = T)/n()),
            varRace = var(call, na.rm = T)/n()) %>%
  mutate(lowerLimit = meanRace - 1.96*seRace,
         upperLimit = meanRace + 1.96*seRace)

# ATE
aux$meanRace[1]-aux$meanRace[2]

# SE for ATE
sqrt(aux$varRace[1]+aux$varRace[2])

# CI for ATE
aux$meanRace[1]-aux$meanRace[2] - 1.96*sqrt(aux$varRace[1]+aux$varRace[2])
aux$meanRace[1]-aux$meanRace[2] + 1.96*sqrt(aux$varRace[1]+aux$varRace[2])

## ATE for gender
aux <- resume %>%
  group_by(sex) %>%
  summarize(meanGender = mean(call, na.rm=T),
            seGender = sqrt(var(call, na.rm = T)/n()),
            varGender = var(call, na.rm = T)/n()) %>%
  mutate(lowerLimit = meanGender - 1.96*seGender,
         upperLimit = meanGender + 1.96*seGender)

aux

# ATE
aux$meanGender[1]-aux$meanGender[2]

# SE for ATE
sqrt(aux$varGender[1]+aux$varGender[2])

# CI for ATE
aux$meanGender[1]-aux$meanGender[2] - 1.96*sqrt(aux$varGender[1]+aux$varGender[2])
aux$meanGender[1]-aux$meanGender[2] + 1.96*sqrt(aux$varGender[1]+aux$varGender[2])

## With regressions!

# Race
mod <- lm(call~race, data=resume)
mod
summary(mod)

# Gender
mod <- lm(call~sex, data=resume)
mod
summary(mod)
