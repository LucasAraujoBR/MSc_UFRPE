# 1 - Vetores aceitam apenas um tipo de dados. O que acontece com xx com o seguinte comando:  xx <- c(TRUE, 2) ?
xx <- c(TRUE,2)
xx

# 2 - No R, todos os tipos de dados a seguir são atômicos, EXCETO:
# No R, os tipos de dados atômicos são aqueles que contêm apenas elementos de um único tipo. Os tipos atômicos incluem:

#  Inteiro (integer) ✅

#Caracter (character) ✅

#Lógico (logical) ✅

#Por outro lado:

#  Lista (list) ❌ NÃO é atômica, pois pode conter diferentes tipos de dados dentro dela.

#DataFrame (data.frame) ❌ também NÃO é atômico, pois é uma estrutura de dados que pode conter colunas de diferentes tipos.


# 3 - Suponha que você tenha um vetor x <- 1:4 e y <- 2:3. O que é produzido pela expressão x * y?

x <- 1:4
y <- 2:3

x*y

# 4 - Dada a tabela no link abaixo que representa uma competição entre Maria e Joana,  determine quem foi a vencedora.  Dica: primeiro padronize os dados e depois calcule a média dos valores padronizados.


# Criando a tabela de dados
dados <- data.frame(
  Teste = c("Abdominais em 2 min", "Salto em extensão (cm)", "Suspensão braços flexionados (seg)",
            "Correr/andar em 12 min (m)", "Conhecimento desportivo"),
  Media = c(30, 155, 50, 1829, 75),
  Desvio_Padrao = c(6, 23, 8, 274, 12),
  Maria = c(42, 102, 38, 2149, 97),
  Joana = c(38, 173, 71, 1554, 70)
)

# Padronizando os dados (Z-score)
dados$Z_Maria <- (dados$Maria - dados$Media) / dados$Desvio_Padrao
dados$Z_Joana <- (dados$Joana - dados$Media) / dados$Desvio_Padrao

# Calculando a média dos valores padronizados
media_z_maria <- mean(dados$Z_Maria)
media_z_joana <- mean(dados$Z_Joana)

# Determinando a vencedora
if (media_z_maria > media_z_joana) {
  vencedora <- "Maria"
} else if (media_z_maria < media_z_joana) {
  vencedora <- "Joana"
} else {
  vencedora <- "Empate"
}

# Exibindo os resultados
print(dados)
cat("\nMédia dos valores padronizados:\n")
cat("Maria:", media_z_maria, "\n")
cat("Joana:", media_z_joana, "\n")
cat("\nVencedora:", vencedora, "\n")

# 5 - Para responder as questões abaixo, faça download do arquivo disponível em https://www.dropbox.com/s/6t7b44acy7yfczu/vetor.RData?dl=1 e mova-o para o seu diretório. Em seguida leia-o com o comando load(“vetor.RData”) . O vetor01 possui 15.000 observações referentes às notas dos candidatos do concurso público para auxiliar administrativo da Prefeitura de São Longuinho. Os dados foram disponibilizados pela empresa organizadora do concurso. As notas variam de 0 a 10 e os candidatos que não realizaram a prova estão com NA nos respectivos campos. De posse dos dados, responda as perguntas abaixo.
setwd("/Users/lucasaraujo/Projects/R_Projects")  # Altere para o caminho correto no seu computador

load("vetor.RData")

str(vetor01)  # Estrutura do vetor
summary(vetor01)  # Resumo estatístico das notas

mean(vetor01, na.rm = TRUE)

median(vetor01, na.rm = TRUE)

sd(vetor01, na.rm = TRUE)

sum(is.na(vetor01))

percentual_faltosos <- (sum(is.na(vetor01)) / length(vetor01)) #* 100
percentual_faltosos

sum(vetor01 > 7 & vetor01 < 8, na.rm = TRUE)

sum(vetor01 > 9 | vetor01 < 1, na.rm = TRUE)

vetor01 <- vetor01[!is.na(vetor01)]

sum(is.na(vetor01))


