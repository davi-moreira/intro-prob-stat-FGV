##########################################
## Intro to Probability and Statistics  ##
## Week 02 - Introduction to R          ##
## Umberto Mignozzetti                  ##
##########################################

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

# Recap

Inf
exp(-Inf)
log(0)
sqrt(-2)
Inf + 1
Inf/Inf
NaN + 1

# Attribution
x <- 2
x

## Other objects
x <- 2
y = 3
x+y
x*y
x/y

## Removing
rm(x,y)
z <- 41

## Types of objects

# vector     |  Data vector
# numeric    |  Number Vector
# factor     |  Factor vector
# character  |  Character Vector
# matrix     |  2 dimension matrix
# array      |  n-dimension matrix
# data.frame |  Datasets
# list       |  Collection of objects

# To find out which objects we are dealing with:
class(z)

# A few types
x <- 'Casa'
y <- 3.14
z <- FALSE # or TRUE...
x
y
z

# Vector creation
x <- c(2,3,5,7,11) # few prime numbers
x

# Position on vectors
x[4]

# Change vectors
x[4] = 13
x

## Other types of vectors:
y = c('House', 'Car', 'Run')
z = c(T,T,F)
y; z

# And we can also create data sets
ducks <- data.frame(
  Name = c('Huey', 'Dewey', 'Louis'),
  Age = c(7, 5, 8),
  School = c(T, F, T)
)
ducks

# And to access positions within data
ducks$Name
ducks$Age[3]
ducks$School[2] = T
ducks[2,3]
ducks[1,]
ducks[,1]

# As a reminder: R is case-sensitive:
Ducks
ducks$age

# We can also see the data
View(ducks)

# Some info about our awesome dataset:
names(ducks)
row.names(ducks)
dim(ducks)

# Missing values
ducks$Age[3] = NA
ducks$Age

# Datasets that come with R: let's look again to R datasets
data()

# On the list, we have the USArrests dataset. Let's find out
# what it is:
help(USArrests)

# To load:
data("USArrests")

# And we can compute some stats
dim(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)
names(USArrests)
row.names(USArrests)

# Another cool dataset is the political economic risk
# it is in the Zelig package
library(Zelig)
data(PErisk)

# A few stats
dim(PErisk)
head(PErisk)
tail(PErisk)
summary(PErisk)
names(PErisk)
row.names(PErisk)
View(PErisk)

# And the PErisk has an unhelpful help
help(PErisk)

####
## Graphs
####

# In stats we have two types of variables
# Qual and Quant

# Nominal variables: qualitative unordered

# Ordinal variables: qualitative ordered

# Quanti discrete

# Quant continuous

## For each type we have a graph more adequate

## Graphs for quant variables:

# Histogram
library(tidyverse)
ggplot(data = USArrests) +
  geom_histogram(mapping = aes(x = Murder))

## Great job folks. Next class, graphs!