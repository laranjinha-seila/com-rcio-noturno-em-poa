#conseguir o número de estab (ativos). por ano e bairro
install.packages("lubridate")

library(lubridate)
library(dplyr)

anos <- c(2000, 2010)

##Converter datas (ajuste o formato se necessário)
alvaras_filtrado <- read_delim("C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_com_atividades_filtradas.csv", delim = ";")

alvaras_filtrado <- alvaras_filtrado %>%
  mutate(
    data_abertura = as.Date(data_deferimento, format = "%d/%m/%Y"),
    data_fim = as.Date(data_vencimento, format = "%d/%m/%Y")
  )

##Função para verificar se um alvará estava ativo em um ano específico
alvaras_ativos_por_ano <- alvaras_filtrado %>%
  rowwise() %>%
  mutate(
    ativo_2000 = (data_abertura <= as.Date("2000-12-31")) & 
      (is.na(data_fim) | data_fim >= as.Date("2000-01-01")),
    ativo_2010 = (data_abertura <= as.Date("2010-12-31")) & 
      (is.na(data_fim) | data_fim >= as.Date("2010-01-01"))
  ) %>%
  ungroup()


alvaras_por_ano_bairro <- alvaras_ativos_por_ano %>%
  group_by(bairro) %>%
  summarise(
    qtd_ativos_2000 = sum(ativo_2000),
    qtd_ativos_2010 = sum(ativo_2010),
    .groups = "drop"
  )

write_delim(alvaras_por_ano_bairro,
            "C:/Users/pedro.papini/Desktop/Coisas Pedro/alvaras_ativos_2000_2010_por_bairro_com_bairros_novos.csv",
            delim = ";")
