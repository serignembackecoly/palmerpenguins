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

## Visualisation
attach(penguins_raw2)

# Isotopes
ggplot()+ 
  geom_point(data = penguins_raw2,
             aes(delta_13_c_o_oo, delta_15_n_o_oo, color = species),
             size = 3, alpha = 0.7) +
  scale_color_viridis_d("", labels = c("Adélie", "Chinstrap", "Gentoo")) +
  labs(x = "d13C", y = "d15N") +
  theme_minimal() +
  coord_equal()

# Violin plot of body mass
ggplot(penguins_raw2, aes(species, body_mass_g, fill = species))+ 
  geom_violin(alpha = 0.7) +
  geom_jitter(size = 2, shape = 20, alpha = 0.5, width = 0.1) +
  scale_fill_viridis_d("", guide = "none") +
  scale_x_discrete(labels = c("Adélie", "Chinstrap", "Gentoo")) +
  labs(x = "", y = "Body Mass (g)") +
  theme_light()
