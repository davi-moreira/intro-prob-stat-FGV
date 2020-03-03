#####
## Intro to Prob and Stat
## Week 3
## Umberto Mignozzetti
####

####
## Graphs
####

## Variable types, chart types

# Before making graphs and visual analysis
# of our datasets, we need to understand which variables
# we have. Each variable will promote its own data analysis.

# We have in practice two types of variables
# (see Bussab and Morettin, 2017):

# - Qualitative
# - Quantitative

# Within each of them, we have the following types:

# - ** Nominal **: qualitative measures
# who have no idea of ordering (e.g. sex,
# white or not white, whether or not you have a pen, etc.)

# - ** Ordinal **: qualitative measures that
# have an idea of order (eg schooling, class
# social, income range, etc.)

# - ** Discrete **: quantitative measures
# which are represented by integer values (e.g.
# number of children, days off work, number of
# photos taken in one day, liked on Instagram, etc.)

# - ** Continuous quantitative **: quantitative measures
# that can be divided, without losing coherence
# (eg income, GDP growth, proportion of votes
# received by a candidate, etc.)

# Each variable type asks for a certain type of
# chart that is best suited to describe the variation.

## GRAPHICS FOR QUANTI VARIABLES

# Take for example, the 'USArrests` dataset,
# which maps crimes for every 100 thousand inhabitants
# In the USA. To describe a quantitative variable,
# can we use the
# [histogram] (https://en.wikipedia.org/wiki/Histogram).

# Problem: load and check the `USArrests` dataset.

# Making histograms:
library(tidyverse)
ggplot(data = USArrests) +
  geom_histogram(mapping = aes(x = Murder))

# And we have a plot where the number of assaults for
# every 100 thousand inhabitants is against its frequency.
# We started the chart with `ggplot`. This is the
# tidyverse command to create graphics. We passed
# only one parameter internally to the command: that the
# database we are considering is the
# `USArrests` (` data = USArrests`).

# Next, we add to the generated plot the
# geometric shape we want. In case,
# the geometrical shape is the `geom_histogram`,
# that generates the bars and counts the frequencies
# internally in the code. In every graph we must
# indicate mapping, which is the positioning of
# geometric shape In the case of a histogram,
# we need the variable, on the * x * axis. Therefore,
# we complete the command with
# `geom_histogram (mapping = aes (x = Murder))`.

## GRAMMAR OF GRAPHICS

# In this sense, every graphic follows a
# construction order, which Wickham calls
# of a *grammar of graphics*. In summary, grammar
# of charts means that every chart has three elements:

# * A dataset (**data**);
# * A coordinate system (**mappings**);
# * A set of geometric figures shapes
# the graphics (**geom**).

# In the case of the histogram, the data is the vector with the
# murder rates for every 100,000 inhabitants:
USArrests$Murder

# The coordinate system is to map the data into rectangles,
# and count the frequency per rectangle. For example,
# in the case of the data above, we will sort the data
# and calculate the frequency in size 1 rectangles:
sort(USArrests$Murder)

# In the first rectangle, btw 0 and 1, we have one case,
# in 1 to 2 none, in 2 to 3, seven cases, and
# so on. This will be the height of the bar.
# Finally, the geom used, the histogram, will give the final graph
# (a group of rectangles with these numbers that we calculated).
# This is the *grammar of the graphics*, and every picture is
# composed of these elements plus other firms that
# we added to facilitate understanding.

# EXERCISE: make a histogram of Assault

# Similar to the histogram, we have two interesting
# plots, and that follow the same logic:
# the density plot, and the dot plot.

# Dotplot:
ggplot(data = USArrests) +
  geom_dotplot(mapping = aes(x = Murder), binwidth = 1)

# Densityplot with Gaussian Kernel
ggplot(data = USArrests) +
  geom_density(mapping = aes(x = Murder), kernel = 'gaussian')

# Another important chart for quantitative variables is
# the [box diagram] (https://en.wikipedia.org/wiki/Diagram_of_box),
# or *box-plot*. The boxplot plots the
# [quartiles] (https://pt.wikipedia.org/wiki/Quartil) of
# distribution, which gives an idea of the dispersion of the variable.

# Box-plot
ggplot(data = USArrests) +
  geom_boxplot(mapping = aes(x = 1, y = Murder))

# Similar to this, but more beautiful is the violin-plot.
# It does exactly like the box diagram, but it converges
# smoothly for the quartiles distribution:

# violin plot:
ggplot(data = USArrests) +
  geom_violin(mapping = aes(x = 1, y = Murder))


431/5000
# EXERCISE: Make a dotplot, densityplot and violinplot of the
# Assault variable

## CUSTOMIZING GRAPHICS

# You can customize the figures to taste. 
# There are a number of functions
# that help us to put titles, subtitles,
# change color scheme, etc. For example, let's
# make the Assault histogram, placing the
# information needed to understand the graph:

## Nice plot
ggplot(data = USArrests) +
  geom_histogram(mapping = aes(x = Assault), bins = 10) +
  labs(x = 'Assaltos para cada 100 mil habitantes',
       y = 'Frequencia',
       title = 'Assaltos em Estados Americanos')

# First, `bins = 10` reduces the number of rectangles,
# limiting them to 10. This means that we will have
# ten bars in our histogram. Second, we use
# the `labs` command to enter the title and a
# description for the `x` and` y` axes. Thus we have:

# Labs     | Usage
# ----------------------------------
# x        | x axis definition
# y        | y axis definition
# title    | chart title
# subtitle | chart subtitle
#          | (under the title)
# caption  | explanation below
#          | of the graph

## EXERCISE: Make a plot of Assault, publication level.

# Also, if you want to change other components,
# just check the [ggplot2 cheat sheet]
# (https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf)

####
## GRAPHICS FOR QUALITATIVE VARIABLES
####

# For qualitative variables, we can make bargraphs. 
# For example, at the `PErisk` dataset
# we have a variable called `courts`, which is 1 when
# a country has an independent judiciary and 0 otherwise.
# To begin the analysis:

## Exercises: 1. Load the Zelig package and then load the PErisk dataset
##            2. Analyze the dataset
##            3. Make a histogram of the GNP per capita

# Bar chart:
ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = courts))

# For variables with more than one category, the
# principle is similar. For example, for the variable
# which measures the expropriation risk
# (higher value means less chance of having your
# property expropriated by the state), we have:

# Bar chart: more than two bars
ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = factor(prsexp2)))

# And when we use the `factor` command, we build
# factors with values. We can still change
# the color scheme and backgrounds of the variables,
# as well as the color intensity of the bar. For example:

# Colored bars
ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = factor(prsexp2)), fill = rainbow(6))

# The `rainbow` command generates rainbow colors.
# If we use `rainbow (6)` the system calculates six
# colors in the rainbow that are equally sparse. The parameter
# `fill` means the filling of the columns.

## EXERCISE: Make a bar graph of the variable
# of corruption. Include titles and names in the axes.

####
## Joint tests
####

# Formulating statistically testable hypotheses
# is, in general, crossing variables. In this case, let's
# make some graphics that cross types of
# variables, and help to formulate and have a first
# visual approximation of the hypothesis.

## Quali-Quali: the * mosaic-plot *

# An interesting research question is:
# will countries with an independent judiciary
# has less corruption than a country without an independent judiciary?
# This question is important, especially in the context
# current, from all political investigations. To measure
# this hypothesis we have to compare two variables: the
# absence of corruption (`prscorr2`) and existence of
# independent judiciary (courts):

# Mosaic-plot
ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = factor(prscorr2), 
                         fill = factor(courts)),
           position = 'fill')

# And to improve the hypothesis, we can transform the
# binary corruption variable.

# Mosaic-plot: 2.0
PErisk$lowcorrup = as.numeric(PErisk$prscorr2>2)
ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = factor(lowcorrup), 
                         fill = factor(courts)),
           position = 'fill')

# So it looks like we have an association between
# free judiciary and low corruption. Note that if
# you create correct levels for the variables and
# assign factors to names, R prints the names,
# instead of 0 and 1:

# Mosaic-plot: 3.0
PErisk$lowcorrup_fator = factor(PErisk$lowcorrup)
levels(PErisk$lowcorrup_fator) <- c('Alta', 'Baixa')

PErisk$courts_fator = factor(PErisk$courts)
levels(PErisk$courts_fator) <- c('Não Independente', 'Independente')

ggplot(data = PErisk) +
  geom_bar(mapping = aes(x = lowcorrup_fator, 
                         fill = courts_fator),
           position = 'fill') +
  labs(x = 'Corrupção', 
       y = 'Proporção', 
       fill = 'Status das Cortes')

# This chart looks great, and clearly shows the
# relationship between independence of judiciary 
# and level of corruption.

## Quali-Quanti: the * box-plot *

# Another legal hypothesis, which involves crossing a
# quali variable with a quanti variable, is: you
# Do you think the premium on the black market grows or decreases
# in a society with a lot of corruption. We can imagine
# that corruption is a sign that society is poorly
# institutionalized, and this certainly impacts on
# illicit transaction earnings. On the other hand,
# can anyone imagine that more corruption a market
# more competitive black, and therefore, that generates less gains.

# To test these hypotheses, we will use the variable
# `lowcorrup_fator`, which we created to capture the level
# high or low corruption in a society, and the variable
# `barb2`, which is the log market gain of the black market
# in the countries. Note that the higher this variable,
# The black market gains more vis-à-vis the formal market.

# From a graphical point of view, we can do both one
# box-plot or a violin-plot to understand the
# dispersion. However, we put the quali (corruption)
# on the x-axis and quanti (black market premium) in
# y-axis.

# Using box-plot
ggplot(data = PErisk) +
  geom_boxplot(mapping = aes(x = lowcorrup_fator, y = barb2))

# Usando violin-plot
ggplot(data = PErisk) +
  geom_violin(mapping = aes(x = lowcorrup_fator, y = barb2))

# So there are important differences in the distributions
# in both cases. In that sense, we have some foundation
# to believe that there is a significant relationship
# between corruption and gains in informality.

## Quanti-Quanti: the * scatter diagram *

# About quanti x quanti, still in the political risk dataset
# and economical (`PErisk`), we can ask ourselves if the
# informality affects GDP per capita. On the one hand,
# the formal market has bureaucracies, taxes, among
# others, which makes it extremely expensive to follow
# your rules. On the other hand, the formal market provides
# protections and guarantees for its users, something that is missing
# in the informal market. Which of these perspectives is worth empirically?

# We have two variables: `gdpw2`, for GDP per capita
# (per worker), and `barb2`, which is the premium on the market
# informal. To compare the two we use a scatterplot:

# Scatterplot
ggplot(data = PErisk) +
  geom_point(mapping = aes(x = barb2, y = gdpw2))

# The `geom_point` is the geometric figure that plots
# the points in the scatter diagram. It is obvious that
# to map these points, we need two variables,
# which are the values on each axis respectively.
# Therefore, in `mapping`, `aes` contains the two variables
# and the axis indication for each of them.

# It is difficult to see the trend in the chart above, as
# looks like a distributed data cloud
# randomly. Still, we can put a straight
# adjusted linw, which captures the linear trend:

# Scatterplot with adjuted line:
ggplot(data = PErisk) +
  geom_point(mapping = aes(x = barb2, y = gdpw2)) +
  geom_smooth(mapping = aes(x = barb2, y = gdpw2), 
              method = 'lm')

# To place the adjusted line we have to use the
# `geom_smooth`. Mapping is similar, the difference
# is with `method`, which captures the fact that we want
# a line fitted by linear regression
# simple (`method = 'lm'`).

# We can also differentiate countries according to
# whether or not they have an independent judiciary. In case:

# Scatterplot + binary variable
ggplot(data = PErisk) +
  geom_point(mapping = aes(x = barb2, y = gdpw2, color = courts_fator)) +
  geom_smooth(mapping = aes(x = barb2, y = gdpw2), 
              method = 'lm')

# The relationship seems to be more intense in countries that
# have independent courts. Perhaps the biggest prize in the
# black market is more harmful to GDP in countries
# with better consolidated institutions than in
# countries with non-free judicial institutions.

# Graph with only one straight line, but differentiating points
ggplot(data = PErisk) +
  geom_point(mapping = aes(x = barb2, y = gdpw2, color = courts_fator)) +
  geom_smooth(mapping = aes(x = barb2, y = gdpw2), 
              method = 'lm')

# Graph with two adjusted lines, for each point type
ggplot(data = PErisk) +
  geom_point(mapping = aes(x = barb2, y = gdpw2, color = courts_fator)) +
  geom_smooth(mapping = aes(x = barb2, y = gdpw2, color = courts_fator), 
              method = 'lm')

# And there is the confirmation (at least visual) that 
# independent judiciary and high premium on the black 
# market, is bad news for the per capita GDP.

# PROBLEM: make a scatterplot for Assault and UrbanPop
# in the USArrests dataset

## BONUS: graphing more than two quanti variables

# What if we have four quanti variables?
# Can we make a scatterplot with all
# them, two by two, in a single graph? 
# The answer is yes! And the command to do
# is called pairs. For example, suppose that
# we want to do this with `USArrests`. Let's go
# see if it would be suitable for the task:
View(USArrests)

# So it looks like a very suitable dataset: all
# four variables are numeric. In this case, the
# R has a chart, called pairs, which
# is well suited for crossing several quantitative variables:
pairs(USArrests, gap=0, col=2)

# As you can see, on the main diagonal
# we have the name of the variable, and each of
# intersections above (or below). Note that the upper triangle
# is the mirror of the lower triangle.

####
## Exercises
###

# 1. Load the `USArrests` dataset. Make a violin plot to
# the Assault variable.

# 2. Load the `USJudgeRatings` dataset. Make a histogram
# of the `INTG` variable.

# 3. In the `USJudgeRatings` dataset, make a scatterplot of
# `INTG` and` DMNR`. Describe in words the findings.

# 4. Load the `voteincome` dataset from the Zelig package. Cut
# an income-segmented education violin-plot. Describe
# with words the findings.

# 5. In the `voteincome` dataset, make a voting mosaic-plot
# versus education. Does the result make theoretical sense? Why?

# 6. Using the `voteincome` dataset answer the following
# question: graphically, is there any difference in
# gender between voters and non-voters?

# 7. Using the `voteincome` dataset answer the following
# question: which state has the most people turning out to vote?

# 8. Using the `voteincome` dataset, suppose you go
# put in a report to your superior the
# results of turnout by state. Insert title, subtitle 
# and choose a layout with eye-catching colors.

# 9. Load the sanction dataset from the Zelig package.
# Make a colored bar graph for the `ncost` variable.

# 10. Using the `sanction` dataset Zelig package,
# answer the following question: which countries suffer
# more losses from sanctions, those who cooperate
# more or those who cooperate less?