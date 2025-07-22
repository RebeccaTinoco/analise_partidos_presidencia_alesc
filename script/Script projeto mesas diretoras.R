# Projeto mesas diretoras 

#Carregando pacotes 

install.packages("readxl")
install.packages("dplyr")
install.packages("stringr")

library(tidyverse)
library(readxl)
library(dplyr)
library(stringr)

#Filtrando presidente 

presidentes <- dados_alesc %>%
  filter(Cargo == "Presidente")

#Contagem de partidos por ano

contagem_partidos <- presidentes %>%
  group_by(Partido) %>%
  summarise(frequencia = n()) %>%
  arrange(desc(frequencia))

#Gráfico 


ggplot(contagem_partidos, aes(x = reorder(Partido, -frequencia), y = frequencia)) +
  geom_col(fill = "#4E79A7", show.legend = FALSE) +   # cor azul fixa
  labs(title = "Frequência de partidos na presidência da ALESC",
       x = "Partido", y = "Frequência") +
  theme_minimal() + theme(
  panel.background = element_rect(fill = "white"),
  plot.background = element_rect(fill = "white")
)


ggsave("frequência_presidentes_por_partido.png")

