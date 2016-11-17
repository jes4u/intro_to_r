setwd("C:/Users/Jesse/Desktop/AUT16/INFO 201/Modules/intro_to_r/ggplot")
library(ggplot2)
library(dplyr)
library(data.table)

load("suicides.rdata")
all_suicides <- copy(suicides)

suicides <- suicides %>%
  group_by(year, state, means) %>%
  mutate(deaths = sum(deaths))

# The basics
bare <- ggplot(suicides)

# Adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x = year, y = deaths))

# Adding points
scatter <- ggplot(suicides, aes(x = year, y = deaths)) +
           geom_point()

# Split "means" by color
color_by_means <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
                  geom_point()

# Facet by state
state_fact <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
              geom_point() +
              facet_wrap(~state, scales = "free")

# Line Plot
line_by_state <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
                 geom_line(size = 3) +
                 facet_wrap(~state, scales = "free")

# Bar plot
state_fact <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
              geom_bar(aes(fill = means), stat = "identity") +
              facet_wrap(~state, scales = "free")

# 
