# Crie os vetores a seguir: ‘mouse.color' com os valores: ‘purple’, ‘red’, ‘yellow’,‘brown’; ‘mouse.weight’ com os valores 23, 21, 18, 26. Crie um data frame chamado de ‘mouse.info’ com esses vetores, formando 4 linhas e 2 colunas. Nomeie a primeira coluna para ‘colour’ e a segunda para ‘weight’. De posse desse data frame, responda as perguntas abaixo. OBS.: Ao submeter o comando, retire todos os espaço em branco.

mouse.color<-c('purple','red','yellow','brown')
mouse.weight<-c(23,21,18,26)
mouse.info<-data.frame(colour=mouse.color,weight=mouse.weight)
mouse.info

# Qual comando imprima a estrutura do  data frame no console ?
str(mouse.info)

# Qual comando imprima apenas a linha 3 no console ?
mouse.info[3,]

# Qual comando imprima apenas a coluna 1 no console ?
mouse.info[,1] 
#ou 
mouse.info$colour

#Qual comando imprima o item na linha 4 da coluna 1 ?
mouse.info[4,1]

# Para as questões abaixo use o dataset airquality já incluído no RStudio.

# Qual foi o valor  mínimo de ozônio no mês de maio ?
min(airquality$Ozone[airquality$Month==5],na.rm=TRUE)

# Extraia o subconjunto do data frame em que os valores de Ozônio estão acima de 25 e os valores da temperatura (Temp) estão abaixo de 90. Qual é a média do Solar.R nesse subconjunto?
subset_data <- subset(airquality, Ozone > 25 & Temp < 90)
mean(subset_data$Solar.R, na.rm = TRUE)

# Qual a quantidade de casos completos no dataset airquality ? Ou seja, a quantidade de observação (linhas) sem NAs.
sum(complete.cases(airquality))

# Carregue o arquivo genomes.csv numa variável chamada genomas através do seguinte comando: genomas <- as.data.frame(read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1")). De posse desse dado, responda as perguntas abaixo.
genomas <- as.data.frame(read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))

# Selecione os organismos com mais de 40 cromossomos.
genomas_filtrados <- genomas[genomas$Chromosomes > 40, ]
genomas_filtrados$Organism

# Selecione os organismos que contém plasmídeos e também possui mais de um cromossomo.
genomas_filtrados_plasmidos <- genomas[genomas$Chromosomes > 1 & genomas$Plasmids > 0, ]
genomas_filtrados_plasmidos$Organism

# Quantos grupos diferentes existem?
grupos_diferentes <- length(unique(genomas$Groups))
grupos_diferentes


# Carregue o arquivo cancer_stats.csv numa variável chamada cancer_stats através do seguinte comando: cancer_stats <- as.data.frame(read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1")). De posse desse dado, responda as perguntas abaixo.
cancer_stats <- as.data.frame(read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))

# Exibir as colunas e as primeiras linhas do dataframe
colnames(cancer_stats)
head(cancer_stats)


# Para qual local do câncer (site) do sistema digestivo (Digestive System) existem mais casos femininos do que masculinos?
# Filtrar os dados para o sistema digestivo
digestive_system <- subset(cancer_stats, Class == "Digestive System")
comparison <- digestive_system[digestive_system$Female.Cases > digestive_system$Male.Cases, ]
print(comparison$Site)

# Qual local do câncer tem a melhor taxa de sobrevivência para os homens?
# Calcular a taxa de sobrevivência para os homens
cancer_stats$Male.Survival.Rate <- (cancer_stats$Male.Cases - cancer_stats$Male.Deaths) / cancer_stats$Male.Cases
male_survival <- cancer_stats[cancer_stats$Class != "Total", ]
best_male_survival <- male_survival[order(-male_survival$Male.Survival.Rate), ]
best_male_survival_site <- best_male_survival[1, ]
print(best_male_survival_site$Site)

# Qual local de câncer tem a pior taxa de sobrevivência para as mulheres?
cancer_stats$Female.Survival.Rate <- (cancer_stats$Female.Cases - cancer_stats$Female.Deaths) / cancer_stats$Female.Cases
female_survival <- cancer_stats[cancer_stats$Class != "Total", ]
worst_female_survival <- female_survival[order(female_survival$Female.Survival.Rate), ]
worst_female_survival_site <- worst_female_survival[1, ]
print(worst_female_survival_site$Site)



