# Instale e carregue o pacote dplyr. Em seguida use o seguinte comando para carregar os dados que irá trabalhar: df=data.frame(Theoph). Note que Wt: é o peso do sujeito (kg); Dose: é a dose de teofilina administrada por via oral ao indivíduo (mg / kg); Time: é o tempo desde a administração do medicamento quando a amostra foi coletada (h); e conc: é concentração de teofilina na amostra(mg / L). Responda as questões abaixo usando exclusivamente o pacote dplyr. Também use um dos padrões a seguir: filter(dataset,<<>>) ou dataset%>%filter(<<>>).

# Instalar o pacote (se ainda não estiver instalado)
install.packages("dplyr")

# Carregar o pacote
library(dplyr)

# Carregar os dados
df = data.frame(Theoph)


# Qual o comando seleciona apenas a coluna Dose de df ? Ao submeter a resposta remova todos os espaços em branco.

select(df,Dose)

#Qual o comando apresenta os dados para as doses maiores que 5 mg/kg ? Ao submeter a resposta remova todos os espaços em branco.

filter(df,Dose>5)

# Qual o comando seleciona as linhas de 10-20 ?Dica: use o "slice". Ao submeter a resposta remova todos os espaços em branco.

slice(df,10:20)

# Qual comando apresenta os dados para as doses maiores que 5 e cujo o tempo desde a administração do medicamento (Time) é maior que a média do mesmo? Use apenas um único comando.  Ao submeter a resposta remova todos os espaços em branco.

filter(df,Dose>5,Time>mean(Time))

# Qual comando organizar df por peso (decrescente) ? Ao submeter a resposta remova todos os espaços em branco.

arrange(df,desc(Wt))

# Qual comando organizar df por peso (crescente) e tempo (decrescente) ?Ao submeter a resposta remova todos os espaços em branco.

arrange(df,Wt,desc(Time))

# Qual comando cria uma nova coluna chamada "tendencia" que é igual à Time-mean(Time)? Ao submeter a resposta remova todos os espaços em branco.

mutate(df,tendencia=Time-mean(Time))

# Qual comando apresenta a maior concentração de teofilina ? Não use nenhum nome para a coluna resultante. Ao submeter a resposta remova todos os espaços em branco.

summarise(df,max(conc))

# Para os exercícios abaixo, usaremos dois conjuntos de dados relacionados aos tempos de atraso de vôos do Bureau of Transportation Statistics dos EUA (X673598238_T_ONTIME_REPORTING e L_UNIQUE_CARRIERS.csv_). Para carregar os dados é importante que vocês usem os seguintes argumentos: quote="\"", sep = "," . Note que a extensão ".csv_" está correta. O data frame do arquivo (X673598238_T_ONTIME_REPORTING)  possui apenas informações da companhia aérea por código. No entanto, queremos saber os nomes das companhias aéreas. Assim, faça o merge dos datasets "X673598238_T_ONTIME_REPORTING" e "L_UNIQUE_CARRIERS.csv_" através das colunas "OP_UNIQUE_CARRIER" e "Code". Em seguida, responda as questões abaixo.

# Carregar os dados
ontime <- read.csv("/Users/lucasaraujo/Projects/R_Projects/CPAD/673598238_T_ONTIME_REPORTING.csv", quote = "\"", sep = ",")
carriers <- read.csv("/Users/lucasaraujo/Projects/R_Projects/CPAD/L_UNIQUE_CARRIERS.csv_", quote = "\"", sep = ",")

# Realizar o merge
df_merged <- merge(ontime, carriers, by.x = "OP_UNIQUE_CARRIER", by.y = "Code")
colnames(df_merged)

# Qual companhia teve o maior atraso ?

df_merged %>%
  arrange(desc(DEP_DELAY_NEW)) %>%
  slice(1)

# Qual companhia atrasa mais na média ?
companhias_interesse <- c("B6", "AA", "HA", "9E", "OO", "WN")

df_merged %>%
  filter(OP_UNIQUE_CARRIER %in% companhias_interesse) %>%
  group_by(OP_UNIQUE_CARRIER, Description) %>%
  summarise(media_atraso = mean(DEP_DELAY_NEW, na.rm = TRUE)) %>%
  arrange(desc(media_atraso))

# Qual companhia atrasa menos na média ?

df_merged %>%
  filter(OP_UNIQUE_CARRIER %in% companhias_interesse) %>%
  group_by(OP_UNIQUE_CARRIER, Description) %>%
  summarise(media_atraso = mean(DEP_DELAY_NEW, na.rm = TRUE)) %>%
  arrange(media_atraso) %>%
  slice(1)

# Qual companhia teve a maior proporção dos atrasos? As linhas que não possuem informações dos atrasos precisam ser removidas.
df_merged %>%
  filter(!is.na(DEP_DELAY_NEW)) %>%  # Remover linhas sem informações de atraso
  filter(OP_UNIQUE_CARRIER %in% companhias_interesse) %>%  # Filtrar as companhias de interesse
  group_by(OP_UNIQUE_CARRIER, Description) %>%
  summarise(
    total_voos = n(),
    voos_atrasados = sum(DEP_DELAY_NEW > 0, na.rm = TRUE),  # Contar os voos atrasados
    proporcao_atrasos = voos_atrasados / total_voos  # Calcular a proporção de atrasos
  ) %>%
  arrange(desc(proporcao_atrasos)) %>%
  slice(1)  # Selecionar a companhia com a maior proporção

# Você está encarregado de analisar um conjunto de dados que contém casos de tuberculose (TB) relatados entre 1995 e 2013, ordenados por país, idade e sexo. O recurso mais exclusivo desses dados é o seu sistema de codificação. As colunas de três a vinte e três codificam quatro partes separadas de informações em seus nomes de coluna: (i) As três primeiras letras de cada coluna indicam se a coluna contém casos novos ou antigos de TB. (ii) As próximas duas letras descrevem os tipos de casos que estão sendo contados. (iii) A sexta letra descreve o sexo dos pacientes com tuberculose. Os números restantes descrevem a faixa etária dos pacientes com TB. Carregue o conjunto de dados de http://stat405.had.co.nz/data/tb.csv como um novo dataframe chamado TB. Observe que o conjunto de dados TB é desordenado de várias maneiras. Primeiramente, remova a coluna "new_sp" que contém o total de casos. Em seguida, mova os valores das colunas 3 até 22 para duas colunas chamadas de “Código” e "N_casos". Dica use o gather (). Após isso, divida os conteúdos da variável “Código” em cada sublinhado(”_”). Dica use o separate () e chame as colunas resultantes de "caso", "tipo” e "sexofaixa”. Por fim, divida a variável que contém o sexo e a faixa etária ("sexofaixa”) de modo a criar uma coluna de "sexo" e uma coluna de "faixa". De posse do data frame resultante, responda as questões abaixo.
install.packages("tidyverse")
# Carregar o pacote necessário
library(tidyverse)

# Carregar os dados
TB <- read.csv("http://stat405.had.co.nz/data/tb.csv")
TB <- TB %>% select(-new_sp)
TB_long <- TB %>%
  gather(key = "Código", value = "N_casos", 3:22)
TB_long <- TB_long %>%
  separate(Código, into = c("caso", "tipo", "sexofaixa"), sep = "_")
TB_long <- TB_long %>%
  separate(sexofaixa, into = c("sexo", "faixa"), sep = "(?<=\\D)(?=\\d)")

head(TB_long)

# Qual foi a quantidade de casos para a Tailândia (TH) de pessoas do sexo Masculino?
colnames(TB_long)

# Filtrar os dados para a Tailândia (iso2 == "TH") e sexo Masculino (sexo == "m")
casos_th_masculino <- TB_long %>%
  filter(iso2 == "TH", sexo == "m") %>%
  summarise(total_casos = sum(N_casos, na.rm = TRUE))

# Mostrar o total de casos
casos_th_masculino

# Qual a proporção de casos para os estados unidos (US) ? Não considerar valores NAs da coluna "N_casos".
# Filtrar os dados para os Estados Unidos (iso2 == "US")
casos_us <- TB_long %>%
  filter(iso2 == "US") %>%
  summarise(
    total_casos_us = sum(N_casos, na.rm = TRUE),  # Soma total de casos nos EUA
    total_casos_mundo = sum(TB_long$N_casos, na.rm = TRUE)  # Soma total de casos global
  ) %>%
  mutate(proporcao_casos_us = total_casos_us / total_casos_mundo)  # Calcular a proporção

# Mostrar a proporção de casos
casos_us

# Qual a quantidade de casos para a faixa etária 2534 do sexo feminino?

# Verificar os valores únicos de faixa etária
unique(TB_long$faixa)

# Verificar os valores únicos de sexo
unique(TB_long$sexo)

# Filtrar os dados para a faixa etária 25_34 e sexo feminino (f)
casos_feminino_25_34 <- TB_long %>%
  filter(faixa == "2534", sexo == "f") %>%
  summarise(total_casos = sum(N_casos, na.rm = TRUE))

# Mostrar a quantidade de casos
casos_feminino_25_34

# Qual foi a quantidade de casos para a década de 2000 ? A década de 2000, também referida como anos 2000, compreende o período de tempo entre 1 de janeiro de 2000 e 31 de dezembro de 2009.

# Filtrar os dados para a década de 2000 (anos de 2000 a 2009)
casos_decada_2000 <- TB_long %>%
  filter(year >= 2000 & year <= 2009) %>%
  summarise(total_casos = sum(N_casos, na.rm = TRUE))

# Mostrar a quantidade de casos na década de 2000
casos_decada_2000

