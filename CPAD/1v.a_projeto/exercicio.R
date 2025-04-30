# ====================================================
# Projeto 1VA - Detecção de Anomalias com LOF em R
# Autor: Lucas Edson Silva de Araujo
# Curso: Mestrado em Informática Aplicada - UFRPE/PPGIA - 2025 | CPAD
# Data: Abril de 2025
# Objetivo: Explorar parâmetros para tornar o algoritmo LOF (Local Outlier Factor) mais leve e eficiente na detecção de anomalias
# ====================================================


# === 1. Preparação do Ambiente ===
# Instalar os pacotes (descomente se necessário)
# install.packages("DMwR2")
# install.packages("ggplot2")
# install.packages("caret")
# install.packages("datasets")

library(DMwR2)
library(ggplot2)
library(caret)
library(datasets)

cat("Pacotes carregados com sucesso!\n")

# === 2. Importação e Normalização dos Dados ===

# === Caminho base para os arquivos RDS ===
caminho <- "/Users/lucasaraujo/Projects/R_Projects/CPAD/1v.a_projeto/pkl_datasets"

cat("Carregando arquivos do diretório...\n")

arquivos <- list.files(path = caminho, pattern = "\\.rds$", full.names = TRUE)
arquivos_normais <- arquivos[grepl("N", arquivos)]
arquivos_anom <- arquivos[grepl("A", arquivos)]
load_rds <- function(file_path) {
  readRDS(file_path)
}
dados_completo <- rbind(dados_treino, dados_teste)
if ("date_time" %in% colnames(dados_completo)) {
  dados_completo <- subset(dados_completo, select = -date_time)
}
dados <- na.omit(dados_completo)

# b) Normalizar apenas variáveis numéricas
dados_norm <- scale(dados[, 1:4])  # Sepal.Length, Sepal.Width, Petal.Length, Petal.Width

cat("Dados normalizados!\n")

# === 3. Aplicação do LOF ===

# a) Aplicar LOF com k = 5
lof_scores <- lofactor(dados_norm, k = 5)

# b) Visualizar scores (histograma simples)
hist(lof_scores, breaks = 20, main = "Distribuição dos Scores LOF (k=5)",
     col = "skyblue", xlab = "LOF Score")

# c) Adicionar coluna de anomalia (threshold = 1.5)
dados$Anomalia <- ifelse(lof_scores > 1.5, "Sim", "Não")

cat("Número de anomalias detectadas (k=5, LOF > 1.5):", sum(dados$Anomalia == "Sim"), "\n")

# === 4. Ajuste de Hiperparâmetros ===

anomalias_por_k <- data.frame(k = integer(), Anomalias = integer())

for (k in 3:20) {
  scores_k <- lofactor(dados_norm, k = k)
  n_anomalias <- sum(scores_k > 1.5)
  anomalias_por_k <- rbind(anomalias_por_k, data.frame(k = k, Anomalias = n_anomalias))
}

# Visualizar impacto do k no número de anomalias
ggplot(anomalias_por_k, aes(x = k, y = Anomalias)) +
  geom_line(color = "darkred") +
  geom_point() +
  labs(title = "Quantidade de Anomalias vs k (LOF)", x = "k (vizinhos)", y = "Anomalias")

# === 5. Redução de Dimensionalidade (PCA) ===

cat("Aplicando PCA para redução de dimensionalidade...\n")

pca <- prcomp(dados_norm)
pca_data <- pca$x[, 1:2]  # Manter apenas 2 componentes principais

# LOF nos dados reduzidos
lof_pca <- lofactor(pca_data, k = 5)
anom_pca <- ifelse(lof_pca > 1.5, "Sim", "Não")

cat("Anomalias detectadas com PCA + LOF:", sum(anom_pca == "Sim"), "\n")

# === 6. Visualização e Avaliação ===

# a) Visualizar pontos anômalos no espaço PCA
pca_plot <- data.frame(pca_data, Anomalia = anom_pca)

ggplot(pca_plot, aes(x = PC1, y = PC2, color = Anomalia)) +
  geom_point(size = 2) +
  labs(title = "Anomalias no Espaço PCA (LOF)", x = "PC1", y = "PC2") +
  scale_color_manual(values = c("Não" = "gray", "Sim" = "red"))


