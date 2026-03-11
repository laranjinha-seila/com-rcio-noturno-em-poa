#selecionar as atividades

install.packages("readr")
install.packages("dplyr")

library(readr)
library(dplyr)



alvaras <- read_delim("C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_ativos.csv", delim = ";")

lista_de_atividades <- alvaras %>%
  distinct(atividade) %>%
  arrange(atividade) %>%
  pull()


atividades_selecionadas <- lista_de_atividades[c(3, 10, 11, 14,17, 18, 21, 23, 32,33, 34, 35, 36, 37, 39, 41, 43, 48, 50, 62, 67, 70, 71, 72, 76, 77, 78, 79, 83, 84, 86, 87, 88, 93,
                                                 97,
                                                 98,
                                                 99,
                                                 100,
                                                 108,
                                                 109,
                                                 111,
                                                 112,
                                                 113,
                                                 116,
                                                 120,
                                                 122,
                                                 123,
                                                 127,
                                                 130,
                                                 131,
                                                 132,
                                                 134,
                                                 138,
                                                 175,
                                                 176,
                                                 177,
                                                 178,
                                                 182,
                                                 187,
                                                 188,
                                                 189,
                                                 190,
                                                 191,
                                                 193,
                                                 194,
                                                 224,
                                                 226,
                                                 270,
                                                 271,
                                                 274,
                                                 275,
                                                 302,
                                                 306,
                                                 342,
                                                 343,
                                                 410,
                                                 416,
                                                 467,
                                                 534,
                                                 562,
                                                 578,
                                                 581,
                                                 586,
                                                 602,
                                                 618,
                                                 619,
                                                 620,
                                                 631,
                                                 632,
                                                 642,
                                                 644,
                                                 654,
                                                 658,
                                                 821,
                                                 822,
                                                 782,
                                                 811,
                                                 857, 858, 859, 868, 872, 898, 926, 945)]



tabela_atividades <- tibble(atividade = atividades_selecionadas)
alvaras_filtrado <- alvaras %>%
  filter(atividade %in% atividades_selecionadas)


write_delim(alvaras_filtrado, 
            "C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_com_atividades_filtradas.csv",
            delim = ";")
