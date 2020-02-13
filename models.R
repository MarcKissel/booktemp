library(tidyverse)
library(data.table)



body_mass<- read_csv("https://zenodo.org/record/2600338/files/BodyMass.csv")



home_range <- read_csv("https://zenodo.org/record/2600338/files/HomeRange.csv")
home_range_clean <- janitor::clean_names(home_range)

body_mass <- read_csv("https://zenodo.org/record/3368372/files/BodyMass.csv")

diel_activity <- read_csv("https://zenodo.org/record/3368372/files/DielActivity.csv")

habitat <- read_csv("https://zenodo.org/record/3368372/files/Habitat.csv")


home_range <- read_csv("https://zenodo.org/record/3368372/files/HomeRange.csv")


IUCN_Poptrend_Realm <-read_csv("https://zenodo.org/record/3368372/files/IUCN_Poptrend_Realm.csv")

Locomotion <- read_csv("https://zenodo.org/record/3368372/files/Locomotion.csv")


TrophicGuild <- read_csv("https://zenodo.org/record/3368372/files/TrophicGuild.csv")


####

#model

glimpse(body_mass)
glimpse(home_range_clean)
b <-body_mass %>% left_join(home_range)
glimpse(b)

#install.packages("tidymodels")
library(tidymodels)
b_small <- b %>% select(Family, Genus, Species, BodyMass_kg, HomeRange_ha:Mean_individuals ) %>% filter(!is.na(HomeRange_ha)) %>% filter(High_range != "NI") %>% filter(!is.na(BodyMass_kg))
b_split <- b_small %>% initial_split()

b_train <- training(b_split)
b_test <- testing(b_split)
#train

lm_spec <- linear_reg() %>% set_engine(engine = "lm")
lm_fit <- lm_spec %>% fit(HomeRange_ha ~ BodyMass_kg+Family+Genus, data = b_train)

lm_fit
tidy(lm_fit) %>% arrange(-estimate) %>% View()

#random forest

rf_spec <- rand_forest(mode = "regression") %>% set_engine(engine = "ranger")
rf_fit <- rf_spec %>% fit(HomeRange_ha ~ BodyMass_kg+Family+Genus, data = b_train)

#evalut

results_train <- lm_fit %>% predict(new_data = b_train) %>% mutate(truth = b_train$HomeRange_ha, model = "lm") %>%bind_rows(rf_fit %>% predict(new_data = b_train) %>% mutate(truth = b_train$HomeRange_ha, model = "rf"))



results_test <- lm_fit %>% predict(new_data = b_test) %>% mutate(truth = b_test$HomeRange_ha, model = "lm") %>%bind_rows(rf_fit %>% predict(new_data = b_test) %>% mutate(truth = b_test$HomeRange_ha, model = "rf"))
# this onedoesn't work?


results_train %>% group_by(model) %>% rmse(truth = truth, estimate = .pred)
                                                                                                                            
