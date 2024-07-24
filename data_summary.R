# Librairies

library(tidyverse)
library(palmerpenguins)
library(janitor)

# Load data
  # The penguins data contains 377 observations from 3 different species of penguins
data("penguins")

# Clean the column names 
penguins_raw2 <- clean_names(penguins_raw)

# Summarise the data
penguins_raw2 %>% 
  mutate(across(c(species,island), factor)) %>%  # Change the type of the data into factor from 2 columns
  group_by(species, island, .drop = F) %>% 
  count()

penguins_raw2 %>% 
  group_by(species, sex) %>% 
  tally() # similar to count()

penguins_raw2 %>% 
  group_by(species) %>% 
  summarise(mean.mass = mean(body_mass_g, na.rm = T) ,
            sd.mass = sd(body_mass_g, na.rm = T))
