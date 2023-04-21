library(tidyverse)
library(palmerpenguins)
library(ggthemes)

#' Exercises

#' 1. How many rows are in penguins? How many columns?

cat("The Penguins dataset has",nrow(penguins),"rows and",ncol(penguins),"columns")

#' 2. What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.

?penguins

#' It's a number denoting bill length (millimeters)

#' 3.Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. Describe the relationship between these two variables.

#+ echo=T, warnings=F, message=F

ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm , y = bill_depth_mm )
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill length and bill depth",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill length (mm)", y = "Bill depth (mm)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

#' As bill length increases, bill depth generally decreases.  There are some spieces that have much deeper but shorter bills (Adelie) and others with longer but more shallow (Gentoo)"

#' 4. What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm , y = species )
) +
  #geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth and species",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill depth (mm)", y = "Species",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

#' I think a bar chart would be better than scatterplot

#' 5. Why does the following give an error and how would you fix it?
#' 
ggplot(data = penguins) + 
  geom_point()

#' It gives an error because the ggplot function is missing an aesthetics mapping parameter to indicate x and y fields.  This is below.  Hurrah.
#' 
ggplot(data = penguins,
       mapping = aes(x = bill_length_mm , y = bill_depth_mm )) + 
  geom_point()

#' What does the na.rm argument do in geom_point()? What is the default value of the argument? Create a scatterplot where you successfully use this argument set to TRUE.
#' 
ggplot(data = penguins,
       mapping = aes(x = bill_length_mm , y = bill_depth_mm )) + 
  geom_point(na.rm = TRUE)
