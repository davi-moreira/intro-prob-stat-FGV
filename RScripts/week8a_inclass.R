# Open USArrests
data("USArrests")

# Check USArrests
head(USArrests)

# Running my preferred correlation
cor(USArrests$Murder, USArrests$Assault)

# Plot
plot(Murder~Assault, data = USArrests)

# My regression
mod <- lm(Murder~Assault, data = USArrests)
mod

# Murder = 0.63 + 0.04Assault + error

# Plot plus trend line
plot(Murder~Assault, data = USArrests)
abline(mod, col='red', lwd=2)

# R-Squared
mod
summary(mod)

# Experimental analysis
resume <- read.csv('https://raw.githubusercontent.com/umbertomig/intro-prob-stat-FGV/master/datasets/resume.csv')
mod <- lm(call~race, data=resume)
mod

# Experimental analysis
mod <- lm(call~sex, data=resume)
mod
