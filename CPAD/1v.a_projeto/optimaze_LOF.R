# ====================================================
# Projeto 1VA - Detecção de Anomalias com LOF em R
# Autor: Lucas Edson Silva de Araujo
# Curso: Mestrado em Informática Aplicada - UFRPE/PPGIA - 2025 | CPAD
# Data: Abril de 2025
# Objetivo: Explorar parâmetros para tornar o algoritmo LOF (Local Outlier Factor) mais leve e eficiente na detecção de anomalias
# ====================================================


# === Carregar bibliotecas ===
library(reticulate)
library(ggplot2)
library(dbscan)
library(caret)

# === Caminho base para os arquivos RDS ===
caminho <- "/Users/lucasaraujo/Projects/R_Projects/CPAD/1v.a_projeto/pkl_datasets"

cat("Carregando arquivos do diretório...\n")

# === Etapa 1: Carregar dados RDS ===
arquivos <- list.files(path = caminho, pattern = "\\.rds$", full.names = TRUE)

# Separar arquivos normais e anômalos com base no nome
arquivos_normais <- arquivos[grepl("N", arquivos)]
arquivos_anom <- arquivos[grepl("A", arquivos)]

# Função para carregar RDS
load_rds <- function(file_path) {
  readRDS(file_path)
}

# Função para normalizar dados
normalize_data <- function(obj) {
  if (is.data.frame(obj) || is.matrix(obj)) {
    obj[] <- lapply(obj, as.numeric)
    normalized_data <- as.data.frame(scale(obj))
  } else if (is.list(obj) && !is.null(obj$pca_model$x)) {
    x_data <- obj$pca_model$x
    x_data[] <- lapply(x_data, as.numeric)
    normalized_data <- as.data.frame(scale(x_data))
  } else {
    stop("Formato inesperado de dados.")
  }
  return(normalized_data)
}

cat("Carregando e normalizando os dados...\n")

# Carregar e normalizar dados
dados_normais_scaled <- lapply(lapply(arquivos_normais, load_rds), normalize_data)
dados_anom_scaled <- lapply(lapply(arquivos_anom, load_rds), normalize_data)

# === Etapa 2: Preparar dados para LOF ===
cat("Agregando dados para cálculo de LOF...\n")

dados_treino <- do.call(rbind, dados_normais_scaled)
dados_teste <- do.call(rbind, dados_anom_scaled)

# Remover coluna de data se existir, e remover NAs
dados_completo <- rbind(dados_treino, dados_teste)
if ("date_time" %in% colnames(dados_completo)) {
  dados_completo <- subset(dados_completo, select = -date_time)
}
dados_completo <- na.omit(dados_completo)

# === Etapa 3: Calcular LOF ===
k_valor <- 20  # Número de vizinhos
cat(sprintf("Calculando LOF com k = %d...\n", k_valor))

lof_scores <- lof(dados_completo, minPts = k_valor)

# Separar scores
n_train <- nrow(dados_treino)
lof_treino <- lof_scores[1:n_train]
lof_teste <- lof_scores[(n_train + 1):length(lof_scores)]

# === Etapa 4: Visualizar distribuições ===
cat("Visualizando distribuições dos scores LOF...\n")

par(mfrow = c(1, 2))
hist(lof_treino, breaks = 50, col = "skyblue", main = "LOF - Dados Normais", xlab = "LOF Score")
hist(lof_teste, breaks = 50, col = "salmon", main = "LOF - Dados Anômalos", xlab = "LOF Score")

plot(density(lof_treino), col = "blue", main = "Densidade LOF: Treino vs Teste", xlab = "LOF Score")
lines(density(lof_teste), col = "red")
abline(v = quantile(lof_treino, 0.85), col = "darkgreen", lty = 2)
legend("topright", legend = c("Treino", "Teste", "Threshold 85%"), col = c("blue", "red", "darkgreen"), lty = c(1,1,2))

# === Etapa 5: Detecção com Threshold ===
threshold <- quantile(lof_treino, 0.85)
cat(sprintf("Threshold (85%% quantil dos dados normais): %.4f\n", threshold))

anomalias_detectadas <- lof_teste > threshold
cat("Número de anomalias detectadas:", sum(anomalias_detectadas), "de", length(lof_teste), "\n")

# === Etapa 6: Avaliação ===
rotulos_reais <- rep(1, nrow(dados_teste))  # Todos são anomalias reais
previsoes <- ifelse(lof_teste > threshold, 1, 0)

TP <- sum(previsoes == 1 & rotulos_reais == 1)
FN <- sum(previsoes == 0 & rotulos_reais == 1)

matriz_confusao <- matrix(c(TP, FN), nrow = 2, byrow = TRUE)
rownames(matriz_confusao) <- c("Previsto 1 (Anomalia)", "Previsto 0 (Normal)")
colnames(matriz_confusao) <- c("Real 1 (Anomalia)")

cat("\n=== Matriz de Confusão ===\n")
print(matriz_confusao)

# Métricas de desempenho
accuracy <- TP / (TP + FN)
recall <- TP / (TP + FN)

cat("\n=== Métricas ===\n")
cat(sprintf("Accuracy: %.2f%%\n", accuracy * 100))
cat(sprintf("Recall (Sensibilidade): %.2f%%\n", recall * 100))

# === Etapa 7: Salvar scores ===
saveRDS(lof_teste, file = "lof_scores_anomalias.rds")
cat("Scores LOF salvos em 'lof_scores_anomalias.rds'\n")
