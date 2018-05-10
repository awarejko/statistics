library(tidyr)
library(ggplot2)
library(dplyr)

library(readr)
spiew_wynik_raw <- read.csv("/home/agata/Dokumenty/satystyki/spiew_wynik_raw.csv")
View(spiew_wynik_raw)

warunek_a <- spiew_wynik_raw %>%  filter(warunek == "A")
warunek_b <- spiew_wynik_raw %>%  filter(warunek == "B")

mean_age <- summarise(spiew_wynik_raw, age_mean = mean(wiek, na.rm = T),
                       age_sd = sd(wiek, na.rm = T))
View(mean_age)

score_a <- summarise(warunek_a, score_mean = mean(ocena, na.rm = T),
                     score_sd = sd(ocena, na.rm = T))
View(score_a)

score_b <- summarise(warunek_b, score_mean = mean(ocena, na.rm = T),
                     score_sd = sd(ocena, na.rm = T))
View(score_b)

difference <- t.test(score_a, score_b)
View(difference)

ggplot(data = spiew_wynik_raw, aes(x = warunek, y = ocena))+
  geom_boxplot()
