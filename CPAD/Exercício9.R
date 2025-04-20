# Carregue o dataset do link abaixo. Esse dataset contém informações do peso do coração e corporal de 97 gatos adultos que foram usados para experimentos com a droga "digitalis". Com posse desses dados responda as perguntas abaixo.  Qual foi a média do peso dos gatos  (Bwt) ? https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1 

# Carregar o dataset a partir do link
url <- "https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1"
cats_data <- read.csv(url)

# Visualizar as primeiras linhas (opcional)
head(cats_data)

# Calcular a média do peso corporal dos gatos (coluna Bwt)
mean_bwt <- mean(cats_data$Bwt, na.rm = TRUE)

# Exibir o resultado
mean_bwt

# Para as questões abaixo considere o dataset "Caracol_data_checked.csv". Note que para você obter esse dataset você precisa executar todos os passos apresentado na aula de Manipulação Básica.
# Carregar o dataset (assumindo que o arquivo está no diretório de trabalho)

Caracol_data <- read.csv(file = "/Users/lucasaraujo/Projects/R_Projects/CPAD/Snail_feeding.csv",
                         header = T,
                         strip.white = T,
                         na.strings = "")

# 3. Remover colunas extras (mantendo apenas as 7 primeiras)
Caracol_data <- Caracol_data[, 1:7]

# 4. Corrigir os níveis da variável Sex
levels(Caracol_data$Sex)[levels(Caracol_data$Sex) %in% c("female s")] <- "female"
levels(Caracol_data$Sex)[levels(Caracol_data$Sex) %in% c("males", "Male")] <- "male"

# 5. Corrigir a variável Distance (de fator para numérico)
Caracol_data$Distance <- as.character(Caracol_data$Distance)
Caracol_data$Distance <- as.numeric(Caracol_data$Distance)

# 6. Corrigir valores ausentes (NAs) de Distance
Caracol_data[682, "Distance"] <- 0.58
Caracol_data[755, "Distance"] <- 0.356452

# 7. Corrigir valor absurdo da profundidade (162 → 1.62)
Caracol_data[8, "Depth"] <- 1.62

# 8. Remover dados duplicados
Caracol_data <- Caracol_data[!duplicated(Caracol_data), ]

# 9. Verificar estatísticas gerais (opcional)
summary(Caracol_data)

# 10. Calcular a média da profundidade (Depth)
mean_depth <- mean(Caracol_data$Depth, na.rm = TRUE)
mean_depth

# Qual foi a maior distância coletada para o Caracol Marinho Pequeno e Feminino ?
# Filtrar caracóis pequenos e femininos
filtro <- subset(Caracol_data, Size == "small" & Sex == "female")

# Maior distância
maior_distancia <- max(filtro$Distance, na.rm = TRUE)
maior_distancia


# Para as questões abaixo carregue os dados do dataset Sparrows.csv.
# O arquivo de dados Sparrows.csv contém medidas de asa, tarso, cabeça e bico de duas espécies de pardal. Use read.table(file = "Sparrows.csv", header = TRUE) para carregar os dados para um objeto chamado Sparrows. Depois, use a função View () para exibir os dados. Note que algo deu errado! Todas as variáveis foram combinadas em uma grande coluna. Qual foi o problema ?

# Faltou o argumento sep=",".

# Qual o tamanho mínimo e máximo da cabeça da especie "SSTS" ?

Sparrows <- read.csv("/Users/lucasaraujo/Projects/R_Projects/CPAD/Sparrows.csv")


# Filtrar somente a espécie SSTS
sparrows_ssts <- subset(Sparrows, Species == "SSTS")

# Verificar o mínimo e máximo da variável 'Head'
min_head <- min(sparrows_ssts$Head, na.rm = TRUE)
max_head <- max(sparrows_ssts$Head, na.rm = TRUE)

# Exibir os resultados
min_head
max_head

# Durante a entrada de dados, três linhas foram inseridas duas vezes. Quais são essas linhas duplicadas?

# Verificar quais linhas são duplicadas
duplicadas <- which(duplicated(Sparrows))

# Exibir os índices (linhas) duplicadas
duplicadas

# Exiba os níveis do fator Sex. Veja que os níveis estão bagunçados. Altere de modo que a variável sexo contenha apenas os níveis "Male" e "Female".  Por exemplo,  "Femal" deve ser "Female". Após isso, determine qual é a media do tarso dos pardais femininos e masculinos.
# Ver os níveis únicos da variável Sex
unique(Sparrows$Sex)

# Padronizar os valores manualmente
Sparrows$Sex[Sparrows$Sex %in% c("Femal", "female", "Female", "Femal e")] <- "Female"
Sparrows$Sex[Sparrows$Sex %in% c("Males","Male")] <- "Male"  # só pra garantir

# Verificar os níveis após correção
unique(Sparrows$Sex)

# Calcular a média para cada grupo
tapply(Sparrows$Tarsus, Sparrows$Sex, mean, na.rm = TRUE)

# Digite o comando que verifica quais linhas na variável Wing contém NAs. Use a função which. OBS.: Remova todos os espaços em branco.

which(!complete.cases(Sparrows$Wing))

# Substitua todos os NAs da questão anterior pelos valores 59, 56.5 e 57 (nessa ordem). Qual a média das asas dos pardais ?

# Substituindo os NAs na coluna Wing pelos valores 59, 56.5 e 57
na_indices <- which(!complete.cases(Sparrows$Wing))
Sparrows$Wing[na_indices] <- c(59, 56.5, 57)

# Calculando a média das asas dos pardais
mean(Sparrows$Wing, na.rm = TRUE)

# Qual o comando ordena o data frame pelas colunas Wing e Head e crie um novo objeto chamado de Sparrows_Ordenado ?
Sparrows_Ordenado <- Sparrows[order(Sparrows$Wing, Sparrows$Head), ]
Sparrows_Ordenado