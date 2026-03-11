#Retirar os bairros novos da base de dados - ADENDO: JARDIM ISABEL FOI CRIADO EM 2009, e VILA NOVA FOI INSTIGUIDO - VER O QUE FAZER AGORA
library(dplyr)
library(readr)

##Ler a planilha
dados <- read_csv2("C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_ativos_2000_2010_por_bairro_com_bairros_novos.csv")

##Somar Boa Vista do Sul ao Belém Novo
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "BELEM NOVO",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "BOA VISTA DO SU"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "BELEM NOVO",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "BOA VISTA DO SU"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "BOA VISTA DO SU")

##Somar Aberta dos Morros à Hípica
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "HIPICA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "ABERTA DOS MORR"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "HIPICA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "ABERTA DOS MORR"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "ABERTA DOS MORR")

##Somar Sétimo Céu à Ipanema
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "IPANEMA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "SETIMO CEU"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "IPANEMA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "SETIMO CEU"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "SETIMO CEU")

##Somar Extrema à Lageado
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "LAGEADO",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "EXTREMA"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "LAGEADO",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "EXTREMA"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "EXTREMA")

##Somar São Caetano à Lageado
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "LAGEADO",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "SAO CAETANO"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "LAGEADO",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "SAO CAETANO"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "SAO CAETANO")

##Somar Pitinga à Restinga
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "RESTINGA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "PITINGA"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "RESTINGA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "PITINGA"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "PITINGA")

##Somar Costa e Silva ao Rubem Berta
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "COSTA E SILVA"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "COSTA E SILVA"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "COSTA E SILVA")

##Somar Jardim Leopoldina ao Rubem Berta
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "JAR LEOPOLDINA"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "JAR LEOPOLDINA"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "JAR LEOPOLDINA")

##Somar Parque Santa Fé ao Rubem Berta
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "PARQUE STA FE"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "RUBEM BERTA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "PARQUE STA FE"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "PARQUE STA FE")

##Somar Santa Rosa de Lima ao Sarandi
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "SARANDI",
                        qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "STA ROSA LIMA"], na.rm = TRUE),
                        qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "SARANDI",
                        qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "STA ROSA LIMA"], na.rm = TRUE),
                        qtd_ativos_2010)
  ) %>%
  filter(bairro != "STA ROSA LIMA")

##Somar Jardim Europa à Vila Ipiranga
dados <- dados %>%
  mutate(
    qtd_ativos_2000 = ifelse(bairro == "VILA IPIRANGA",
                             qtd_ativos_2000 + sum(qtd_ativos_2000[bairro == "JARDIM EUROPA"], na.rm = TRUE),
                             qtd_ativos_2000),
    qtd_ativos_2010 = ifelse(bairro == "VILA IPIRANGA",
                             qtd_ativos_2010 + sum(qtd_ativos_2010[bairro == "JARDIM EUROPA"], na.rm = TRUE),
                             qtd_ativos_2010)
  ) %>%
  filter(bairro != "JARDIM EUROPA")

##Salvar nova base
write_delim(dados, "C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_ativos_2000_2010_por_bairro_sem_bairros_novos.csv",
            delim = ";")