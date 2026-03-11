install.packages("readr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("fixest")

library(readr)
library(dplyr)
library(tidyr)
library(fixest)

dir_base <- "C:/Users/pedro.papini/Desktop/Coisas Pedro"
arq <- file.path(dir_base, "teste_regressão.csv")

# 1) Ler CSV (separador ; e decimal ,)
df_wide <- read_delim(
  arq,
  delim = ";",
  locale = locale(encoding = "UTF-8", decimal_mark = ","),
  show_col_types = FALSE,
  trim_ws = TRUE
) %>%
  select(where(~ !all(is.na(.x)))) %>%   # remove colunas vazias extras
  mutate(
    estab_2000 = as.numeric(estab_2000),
    hab_2000   = as.numeric(hab_2000),
    idhm_2000  = as.numeric(idhm_2000),
    renda_2000 = as.numeric(renda_2000),
    
    estab_2010 = as.numeric(estab_2010),
    hab_2010   = as.numeric(hab_2010),
    idhm_2010  = as.numeric(idhm_2010),
    renda_2010 = as.numeric(renda_2010)
  )

# 2) Painel longo (bairro-ano) incluindo renda
painel <- df_wide %>%
  pivot_longer(
    cols = c(estab_2000, hab_2000, idhm_2000, renda_2000,
             estab_2010, hab_2010, idhm_2010, renda_2010),
    names_to = c("var", "ano"),
    names_pattern = "(estab|hab|idhm|renda)_(2000|2010)",
    values_to = "valor"
  ) %>%
  pivot_wider(names_from = var, values_from = valor) %>%
  mutate(
    ano = as.integer(ano),
    estab_por_10mil = (estab / hab) * 10000,
    renda = renda
  )

# Modelo TWFE: renda (log) ~ estab_noturnos por 10 mil hab
m_renda_pc <- feols(renda ~ estab_por_10mil | bairro + ano,
                    data = painel, cluster = ~bairro)

# Modelo TWFE: renda (log) ~ estab_noturnos (absoluto)
m_renda_abs <- feols(renda ~ estab | bairro + ano,
                     data = painel, cluster = ~bairro)

# (Robustez) absoluto + controle de tamanho
m_renda_abs_pop <- feols(renda ~ estab + log(hab) | bairro + ano,
                         data = painel, cluster = ~bairro)

etable(m_renda_pc, m_renda_abs, m_renda_abs_pop,
       dict = c(
         "estab_por_10mil" = "Noturnos por 10 mil hab.",
         "estab"           = "Nº de noturnos",
         "log(hab)"        = "Log(população)"
       ),
       fitstat = ~ n + r2 + wr2,
       se.below = TRUE)