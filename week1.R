########################################
# Intro to Probability and Statistics  #
# Week 01 - Introduction to R          #
# Umberto Mignozzetti                  #
########################################

## Basics

# This is a R Script! This script is useful for
# saving the things that we did in R, so we
# don't lose them.

# Curiously, the script is also a program! It is
# your first software! Yay!

## Install

# Let's look into how to install R and R Studio
# on your own machine.

# Open R webpage

# Open R Studio webpage

# Now, you will have to download and install the software
# in your computer. If you BYO computer, go ahead and 
# install R and R Studio :)

## Additional softwares

# We need some additional softwares to work using R.

# One great software is github! It is a platform that
# is useful for store codes that you build

# Let's check out my github!? 
# Go ahead and create an account for you!

# You can have a portfolio of work, and people can
# actually see the stuff you are doing when using
# github.

# The class github is: 
# https://github.com/umbertomig/intro-prob-stat-FGV

# Assignment: the content of this class was shamelessly
# stolen from my best pal Danilo Freire. Please find
# his github repository and browse it!

## Download material

# One way to follow this class is to download
# the github materials every time you are here.
# As the FGV computers erase all info sessions
# when restart, you should download and save
# in your Desktop.

# Then, we have to let R know that we 
# want to look into your Desktop. How to do that?

# To find out where is the R's working directory
# we use the command **getwd()**
getwd()

# Note that **getwd()** is an R function. We have 
# two main cogs in R's engine: functions and objects.
# Objects are like numbers, texts, datasets, is 
# summary, everything that can hold useful (?) 
# information. Think of it as boxes, that you could
# put things inside. Functions, on the other hand,
# are commands. They are instructions about what to
# do with those boxes. **getwd()** is a function.
# We know that because of the parenthesis!
setwd("Desktop/intro-")

## Geting help!

# Ok, now I'm using R, but how to get help?!

# R is not the most friendly statistical software that
# there is. Thus, let's **learn how to learn** R!

# https://www.dropbox.com/s/w4cnuzf6f19xgv8/introducao_R_aplicado_ciencia_dados.pdf

## Cleaning house!

# The first thing I do when start working in R is to cleanup
# the house! How do you do that?

# First, the function **rm** removes things from the memory

# Second, the function **ls** lists things on memory

# Wait, what if I combine both?!

# Clear the console!
rm(list=ls())

## Arithmetic operations

# The basic way to use R is as a calculator. Let's see
# this in practice!
2 + 2
10 - 8
5^5
sqrt(81)
2/3
exp(3)
log(50)

## Objects

# Boxes. We fill them with information!!
x <- 5 # arrow (<-) is the assignment operator in R 
y <- 16
x + y
sqrt(x*y)

## Relational operations

# Besides assignment, we may have relational connections
x > y
x = 5
y == 16
x != 5

## Vectors

# Vectors are special boxes. They hold more than
# one thing in the same place. Think of it as
# a line of boxes with the same size.

# Let's check the black market premium in some countries
prblmark <- c(-0.7207754, -6.907755, -4.910337, 
              -0.7759748, -4.617344, -2.46144,
              -1.244868, -0.4570337, 1.604343, 
              -4.229065)

# And this is in log... Q: how do we transform into numbers?
exp(prblmark)

# And which countries are we talking about?
countries <- c("Argentina", "Australia", "Austria", 
               "Bangladesh", "Belgium", "Bolivia", 
               "Botswana", "Brazil", "Burma", 
               "Cameroon")

# Note the **c** function. What is it for?

# **c** is also useful to merge stuff...

# The default names for the cases are numbers:
names(prblmark)

# We can rename our cases by doing the following:
names(prblmark) <- countries

# Now we check it!
prblmark

# Cool! So far, so good?!

## Vector positions

# Suppose that we got Bangladesh wrong. If we want to
# change Bangladesh, we have to be able to find
# it out. To find it, we need the position:
prblmark[4]

# The square brackets are useful for positioning. Now,
# let's change the value to 0.7759748
prblmark[4] <- 0.7759748

# And checking the vector again.
prblmark
exp(prblmark)

# We are doing great!!

## Useful functions:

# In terms of stats, there are many useful functions
# that we have to learn. A few of them follow below:

# Functions
mean(prblmark) #function name, parentheses, object
min(prblmark)
max(prblmark)
median(prblmark)
summary(prblmark)

## Building sequences

# We can also build sequences in R easily
# Let's say we and the numbers from 1 to 10.
# We just do:
1:10

# But let's say we want customized ranges:
seq(2002, 2018, 4)

# And those are the years with presidential
# elections.

## Object types

# In the boxes metaphor, you can have many different
# types of boxes. A few boxes might be numbers:
x <- c(1,2,3)
x

# Other boxes may be comprised of texts:
y <- c('Umberto is the boss', 'Cedric is the follower', 
       'Resemblance to actual persons is purely coincidental.')
y

# How to know which boxes we are talking about?
# Function **class**:
class(x)
class(y)

## Loading files

# R comes with very cool datasets on it
# To find about them, you should do
data()

# Keep up with the good work!

# Now, to load one of these datasets, we have to
# do **data(name_dataset)**. Pick one and explore!

# I'll do mine:
data("USArrests")
dim(USArrests)
head(USArrests)
tail(USArrests)


## Packages

# R has lots of packages. They are useful for doing
# things. Almost anything has been done using a R
# package. And people contribute with data and functions
# they build. It is a community of people helping each 
# other. Pretty cool, right!?

# Kosuke build a package to help us up with R
# Let's find that out?!

# Classes in R
install.packages("swirl", dependencies = T)

# Your turn: install 'Zelig'

# Load packages: after installing it, you have to load
library("swirl")

# Your turn: load 'Zelig', load a dataset in Zelig
# called 'PErisk' and find out what is it about.

## Kosuke Course on swirl:

# Install course on swirl. You have to do it just once.
install.packages("devtools")
install_course_github("kosukeimai", "qss-swirl")

## Assignment: load **swirl** and do the INTRO1!

# To load
swirl()

# Great job, folks!!