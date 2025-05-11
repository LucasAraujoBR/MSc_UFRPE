install.packages("stringr")
library(stringr)
install.packages("Ecdat")
library(Ecdat)
install.packages("TeachingDemos")


# Considere o seguinte texto:

texto <- "João tem 30 anos e Maria 25. Eles têm números de telefone diferentes: João - (123) 456-7890 e Maria - 098-765-4321. Além disso, eles têm endereços de e-mail diferentes: joao@example.com e maria@email.com. Ambos nasceram em 1990. João trabalha na empresa XYZ, enquanto Maria é freelancer. Pedro tem 28 anos e possui o número (111) 222-3333 e o e-mail pedro@example.com. Ana, com 29 anos, tem o telefone 999-888-7777 e o e-mail ana@example.com"

# Baseando-se no texto fornecido, submeta a expressão regular que será atribuída ao parâmetro 'pattern' da função str_extract_all(texto, pattern=" ")[[1]] para extrair somente os números seguidos da palavra "anos". Por exemplo: "30 anos".

str_extract_all(texto, pattern = "\\b\\d{1,3}\\sanos\\b")[[1]]


# Baseando-se no texto fornecido, submeta a expressão regular que será atribuída ao parâmetro 'pattern' da função str_extract_all(texto, pattern=" ")[[1]] para extrair todos os números de telefone.

str_extract_all(texto, pattern = "\\(?\\d{3}\\)?[-\\s]?\\d{3}[-]\\d{4}")[[1]]


# Baseando-se no texto fornecido, submeta a expressão regular que será atribuída ao parâmetro 'pattern' da função str_extract_all(texto, pattern=" ")[[1]] para extrair todos os endereços de e-mail.

str_extract_all(texto, pattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")[[1]]

# Escreva uma função chamada 'ranqueamento' que gera o ranqueamento do dataset  Forbes2000 de acordo com o valor de mercado (marketvalue). Esse ranqueamento pode ser tanto por categoria quanto geral. A função  'ranqueamento ' recebe três argumentos: 'ranque', 'categoria' e 'opcao'. Se a 'opcao' 1 for escolhida, o ranqueamento geral deverá ser feito. Por outro lado, se a 'opcao' 2 for escolhida, o ranqueamento por categoria deverá ser realizado. Dado esses argumentos, a função retorna o nome da empresa, a categoria e o ranque.  O protótipo dessa função é:  ranqueamento  <- function( ranque,  categoria=NULL, opcao){}. Adicionalmente, se o raking ou a categoria não existir uma mensagem de erro deverá ser apresentada. De posse dessa função, responda as questões abaixo.

ranqueamento <- function(ranque, categoria = NULL, opcao) {
  # Verifica se o dataset Forbes2000 está disponível
  if (!exists("Forbes2000")) {
    stop("O dataset Forbes2000 não está carregado no ambiente!")
  }
  
  # Verifica se o 'ranque' solicitado é válido
  if (!is.numeric(ranque) || ranque < 1) {
    stop("Ranque inválido!")
  }
  
  # Ranqueamento geral
  if (opcao == 1) {
    Forbes2000_ord <- Forbes2000[order(-Forbes2000$marketvalue), ]
    if (ranque > nrow(Forbes2000_ord)) {
      stop("Ranque fora do intervalo!")
    }
    resultado <- Forbes2000_ord[ranque, c("name", "category")]
    resultado$ranking <- ranque
    return(resultado)
    
  } else if (opcao == 2) {
    # Validação da categoria
    if (!(categoria %in% Forbes2000$category)) {
      return("Categoria não existe!")
    }
    
    subset_cat <- subset(Forbes2000, category == categoria)
    subset_cat_ord <- subset_cat[order(-subset_cat$marketvalue), ]
    
    if (ranque > nrow(subset_cat_ord)) {
      stop("Ranque fora do intervalo da categoria!")
    }
    
    resultado <- subset_cat_ord[ranque, c("name", "category")]
    resultado$ranking <- ranque
    return(resultado)
    
  } else {
    stop("Opção inválida! Use 1 para geral ou 2 para por categoria.")
  }
}


# Qual o nome da empresa do seguinte código ranqueamento(ranque=1234, opcao=1) ?

Forbes2000 <- read.csv("/Users/lucasaraujo/Projects/R_Projects/Prova 1v.a/Forbes2000_V2.csv")

ranqueamento(ranque = 1234, opcao = 1)

# Qual a categoria da empresa do seguinte código ranqueamento(ranque=198, opcao=1) ?
ranqueamento(ranque=198, opcao=1)

# Qual o nome da empresa do seguinte código ranqueamento(ranque=45, categoria="Technology hardware & equipment", opcao=2) ?
ranqueamento(ranque=45, categoria="Technology hardware & equipment", opcao=2)

# Qual o nome da empresa do seguinte código ranqueamento(ranque=7, categoria="Bancos", opcao=2) ?
ranqueamento(ranque=7, categoria="Bancos", opcao=2)

# Verifique o dataset diamonds que pode ser encontrado no pacote ggplot2. Você pode obter uma descrição dos dados digitando ?diamonds ou help(diamonds) no console. Note que para visualizar os dados você precisa instalar e carregar o pacote ggplot2. Também carregue o pacote dplyr. Após isso, responda as perguntas abaixo.

# Qual o preço médio (price) dos diamantes cujo o corte (cut)  é  "Very Good" e o quilate (carat) é maior que 0.7.

# Instale os pacotes, se necessário
install.packages("ggplot2")
install.packages("dplyr")

# Carregue os pacotes
library(ggplot2)
library(dplyr)

# Calcule o preço médio
media_preco <- diamonds %>%
  filter(cut == "Very Good", carat > 0.7) %>%
  summarise(preco_medio = mean(price))

print(media_preco)

# Qual a cor (color ) do diamante que possui o menor preço (price) com mais de  0.5 quilates (carat)  ?

# Filtra e localiza o diamante com menor preço
menor_preco_cor <- diamonds %>%
  filter(carat > 0.5) %>%
  arrange(price) %>%
  slice(1) %>%
  select(color, price, carat)

print(menor_preco_cor)



# Qual a proporção de Diamantes cujo o corte (cut)  é  "Premium" ?

# Número total de diamantes
total <- nrow(diamonds)

# Número de diamantes com corte "Premium"
n_premium <- diamonds %>%
  filter(cut == "Premium") %>%
  nrow()

# Proporção
proporcao <- n_premium / total

print(proporcao)


# Instale e carregue o pacote AER e execute o comando data("Fertility") que carregará o dataset Fertility no seu RStudio. Esse dataset apresenta informações do censo americano de 1980 de mulheres casadas entre 21 e 35 anos com dois ou mais filhos. Resolva as questões abaixo. No entanto, primeiro verifique o dataset Fertility digitando "?Fertility" ou "help(Fertility)" no console.  

# Digite o código que seleciona as linhas de 35 a 50 das variáveis idade (age) e trabalho (work). Remova todos os espaços em branco, não altere o nome do dataset e use o dplyr.
install.packages("AER")

library(AER)
library(dplyr)
data("Fertility")

Fertility %>%
  slice(35:50) %>%
  select(age,work)

Fertility%>%slice(35:50)%>%select(age,work)


# Qual a proporção de mulheres passaram a ter um terceiro filho (morekids) com mais de 30 semanas trabalhadas (work)?

prop <- Fertility %>%
  filter(work > 30) %>%
  mutate(morekids = as.numeric(as.character(morekids))) %>%
  pull(morekids) %>%
  mean(na.rm = TRUE)

print(prop)


# Filtre o subconjunto de mulheres entre 22 e 24 anos e determine à proporção que tiveram menino como primogênito (gender1).  Note que 22 e 24 deve ser incluído.

prop <- Fertility %>%
  filter(age >= 22, age <= 24) %>%
  pull(gender1) %>%
  as.character() %>%
  { . == "male" } %>%
  mean()

print(prop)



# Faça o download dos arquivos de dados Catfish.csv e Treatment.csv do Google classroom e importe-os para o R. Catfish.csv contém medições de peso (variáveis de março e abril) de duas espécies de bagres que são comumente usadas na aquicultura. Ambas as espécies foram criadas sob diferentes tratamentos de temperatura e alimentos, os quais são especificados em Treatment.csv. Obtenha uma visão geral da estrutura dos dados usando as funções str () e head (). Após isso, realize os seguintes tratamentos: (a) converta o dataframe do arquivo Catfish.csv em um formato longo, de modo que as medições de peso para março e abril sejam combinadas em duas colunas denominada de Meses e Weight, respectivamente. (b) Una as colunas Genus e Species em uma variável chamada Species. O resultado deve ficar assim: Silirus.glanis. (c) faça a combinação dos dados de Treatment.csv e Catfish.csv e salve o objeto resultante numa variável chamada de Catfish_Treatment. A mesclarem deve ser feita através da coluna Tank.  Em posse do novo Catfish_Treatment, responda as perguntas abaixo.

library(tidyr)
library(dplyr)

# Leitura dos dados
catfish <- read.csv("/Users/lucasaraujo/Projects/R_Projects/Prova 1v.a/Catfish.csv")
treatment <- read.csv("/Users/lucasaraujo/Projects/R_Projects/Prova 1v.a/Treatment.csv")

unique(catfish$Species)

treatment

library(tidyr)
library(dplyr)

# 1. Transforma catfish em formato longo
catfish_long <- catfish %>%
  pivot_longer(cols = c(March, April), names_to = "Meses", values_to = "Weight")

# 2. Junta Genus + Species, padroniza sexos e meses
catfish_long <- catfish_long %>%
  mutate(
    SpeciesFull = paste(Genus, Species, sep = "."),
    Sex = tolower(Sex),
    Meses = tolower(Meses)
  ) %>%
  select(-Genus, -Species)

# 3. Padroniza o tratamento para minúsculas (se desejar)
treatment <- treatment %>%
  mutate(Food = tolower(Food))

# 4. Faz a junção
Catfish_Treatment <- left_join(catfish_long, treatment, by = "Tank")
Catfish_Treatment




# Qual o peso médio dos bagres do sexo masculino considerando o mês de Abril e o tratamento 2?

Catfish_Treatment %>%
  filter(Sex == "male", Meses == "april", Food == "treatment2") %>%
  summarise(PesoMedio = mean(Weight, na.rm = TRUE))

# Qual tratamento e qual tanque possuem mais bagres com peso maior ou igual a 80?

Catfish_Treatment %>%
  filter(Weight >= 80) %>%
  count(Tank, Food, sort = TRUE)

# Considere os dados abaixo das pontuações médias de quatro jogadores da NBA em pontos por jogo (PPG), assistências por jogo (APG) e rebotes por jogo (RPG).  Com base nessas estatísticas, qual jogador teve o melhor desempenho geral durante a temporada passada? Normalize os dados, visto que eles são de natureza distinta.



#Jogador                   PPG   APG  RPG
#1        LeBron James            25.0   7.7    7.9
#2        Kevin Durant               28.3   5.0    7.1
#3       Stephen Curry             30.1   6.7    5.5
#4 Giannis Antetokounmpo 20.7   5.9   11.1


# Dados
dados <- data.frame(
  Jogador = c("LeBron James", "Kevin Durant", "Stephen Curry", "Giannis Antetokounmpo"),
  PPG = c(25.0, 28.3, 30.1, 20.7),
  APG = c(7.7, 5.0, 6.7, 5.9),
  RPG = c(7.9, 7.1, 5.5, 11.1)
)

# Normalização z-score (padronização)
dados_norm <- as.data.frame(scale(dados[, c("PPG", "APG", "RPG")]))

# Soma dos z-scores
dados$Desempenho_Total <- rowSums(dados_norm)

# Exibir os dados com desempenho total
print(dados[order(-dados$Desempenho_Total), ])

# Melhor jogador
melhor <- dados$Jogador[which.max(dados$Desempenho_Total)]
cat("\nO jogador com melhor desempenho geral foi:", melhor, "\n")


# Faça o download do arquivo Universal2023_ResultadoPreliminar.xls do Google Classroom e importe-os para o R. É importante observar que os dados se referem ao resultado preliminar do Universal do CNPq 2023 e estão propositalmente sem nenhum tratamento, no formato xls. Recomendações: comece removendo manualmente as linhas desnecessárias e os caracteres especiais ou espaços dos nomes das colunas. Veja que essa etapa pode ser feita diretamente no Excel (ou semelhantes). Em seguida, converta o arquivo para o formato csv.

install.packages("readxl")
library(readxl)

# Defina o caminho para o arquivo .xls
caminho_arquivo <- "/Users/lucasaraujo/Projects/R_Projects/Prova 1v.a/Universal2023_ResultadoPreliminar.xls"

# Verifique as planilhas disponíveis (caso tenha mais de uma)
excel_sheets(caminho_arquivo)

# Importe a primeira planilha (ou especifique o nome se necessário)
dados <- read_excel(caminho_arquivo, sheet = 1, skip=4)

# Veja as primeiras linhas
head(dados)

# Veja os nomes das colunas
names(dados)

# Qual foi a região que teve a menor taxa de recursos aprovados ?

names(dados)
library(dplyr)

resumo <- dados %>%
  group_by(`Região`) %>%
  summarise(
    total_aprovado = sum(`Total Aprovado`, na.rm = TRUE),
    total_propostas = n(),  # número de propostas submetidas
    propostas_aprovadas = sum(`Aprovação` == "Aprovado", na.rm = TRUE),
    taxa_aprovacao = propostas_aprovadas / total_propostas
  ) %>%
  arrange(taxa_aprovacao)

print(resumo)

cat("\nRegião com menor taxa de aprovação:", resumo$`Região`[1], "\n")

# Qual foi a classificação da UFRPE em termos de captação total de recursos do Universal do CNPq 2023 em comparação com outras instituições do Nordeste?

library(dplyr)

# Filtrar apenas as instituições da região Nordeste
ranking_nordeste <- dados %>%
  filter(Região == "NE") %>%
  group_by(Instituição) %>%
  summarise(
    recursos_totais = sum(`Total Aprovado`, na.rm = TRUE)
  ) %>%
  arrange(desc(recursos_totais)) %>%
  mutate(classificacao = row_number())

# Ver a classificação da UFRPE
ufrpe_posicao <- ranking_nordeste %>%
  filter(Instituição == "UFRPE")

print(ufrpe_posicao)

cat("A UFRPE ficou em", ufrpe_posicao$classificacao,
    "º lugar entre as instituições da região Nordeste, com um total de R$",
    format(ufrpe_posicao$recursos_totais, big.mark = ".", decimal.mark = ","), "aprovados.\n")

# Qual universidade do nordeste que recebeu o maior número de recomendações sem ter o recurso aprovado em comparação com todas as outras instituições ?

library(dplyr)

# Filtra propostas da região NE recomendadas pelo CA, mas não aprovadas
recomendadas_nao_aprovadas <- dados %>%
  filter(Região == "NE",
         `Recomendação CA` == "Recomendada",
         Aprovação != "Aprovada")

# Conta por instituição
instituicoes_mais_afetadas <- recomendadas_nao_aprovadas %>%
  group_by(Instituição) %>%
  summarise(qtd_recomendadas_nao_aprovadas = n()) %>%
  arrange(desc(qtd_recomendadas_nao_aprovadas))

# Exibe a instituição no topo
print(head(instituicoes_mais_afetadas, 1))



