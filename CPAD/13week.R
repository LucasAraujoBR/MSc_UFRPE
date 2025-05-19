# A tabela abaixo apresenta valores amostrais.  Com base nessa tabela, responda as questões a seguir.  

# Determine o tamanho da amostra. Note que X é um atributo dos elementos (ex.: idade, peso, etc.).

# Vetor com os valores de X
X <- c(5, 7, 12, 15, 10)

# Tamanho da amostra
tamanho_amostra <- length(X)

# Exibir resultado
tamanho_amostra


# Determine a média dos valores da amostra

# Vetor com os valores de X
X <- c(5, 7, 12, 15, 10)

# Média dos valores da amostra
media <- mean(X)

# Exibir resultado
media

# Determine a variância dos valores da amostra.

# Vetor com os valores de X
X <- c(5, 7, 12, 15, 10)

# Variância da amostra
variancia <- var(X)

# Exibir resultado
variancia

# Determine a proporção de valores pares dos valores da amostra.

# Vetor com os valores de X
X <- c(5, 7, 12, 15, 10)

# Verificar quais valores são pares
valores_pares <- X %% 2 == 0

# Calcular proporção de valores pares
proporcao_pares <- sum(valores_pares) / length(X)

# Exibir resultado
proporcao_pares

# Você deseja estimar a renda média dos ex-alunos da Ruralinda; admite-se que esta população seja infinita. Quantos valores de renda devem ser tomados, se o você deseja ter um nível de confiança 90% e um erro máximo de 300 reais? Suponha que saibamos, por um estudo prévio, que para tais rendas, σ = R$4250,00. Use apenas duas casas decimais para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

# Definir os parâmetros
z <- 1.645          # valor z para 90% de confiança
sigma <- 4250       # desvio padrão
E <- 300            # erro máximo permitido

# Calcular o tamanho da amostra
n <- (z * sigma / E)^2

# Exibir resultado com duas casas decimais sem arredondar
format(n, digits = 6, nsmall = 2)

# Suponha que a variável escolhida num estudo seja o peso dos alunos da Ruralinda e que a população é composta de 1500 alunos. Pelo um estudo  prévio dos pesos, o desvio-padrão é de 5 kg. Admitindo-se um nível de confiança de 95,5% e um erro amostral de 1,5 kg, calcule o tamanho da amostra para estimar o peso médio dos alunos da Ruralinda. Use apenas duas casas decimais para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

# Parâmetros fornecidos
z <- 2.00         # z para 95,5%
sigma <- 5        # desvio padrão
E <- 1.5          # erro máximo
N <- 1500         # população finita

# Tamanho da amostra para população infinita
n_infinito <- (z * sigma / E)^2

# Correção para população finita
n_corrigido <- n_infinito / (1 + ((n_infinito - 1) / N))

# Exibir resultado com duas casas decimais sem arredondar
format(n_corrigido, digits = 6, nsmall = 2)

# A ministro da educação está interessado em conhecer o gasto médio por estudante nos restaurantes universitários. O ministro admite que a despesa de um aluno possa variar entre R$ 10,00 e R$ 30,00. Ele desejam um grau de confiança de 98 % e admite uma margem de erro de R$ 1. Calcule o tamanho da amostra para esta pesquisa. Use apenas duas casas decimais para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

# Parâmetros
z <- 2.33                   # valor z para 98% de confiança
amplitude <- 30 - 10
sigma <- amplitude / 4      # estimativa do desvio padrão
E <- 1                      # erro máximo permitido

# Cálculo do tamanho da amostra
n <- (z * sigma / E)^2

# Exibir resultado com duas casas decimais sem arredondar
format(n, digits = 6, nsmall = 2)

# Supondo que a mesma pesquisa seja realizada na Rural e que os valores acima sejam verdadeiros para a Rural. Como ela possui 5.000,00 estudantes, qual seria o tamanho da amostra para a pesquisa. Use apenas duas casas decimais para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

# Parâmetros
z <- 2.33
sigma <- (30 - 10) / 4  # Estimativa do desvio padrão
E <- 1
N <- 5000               # Tamanho da população finita

# Tamanho da amostra para população infinita
n0 <- (z * sigma / E)^2

# Correção para população finita
n <- n0 / (1 + ((n0 - 1) / N))

# Exibir resultado com duas casas decimais sem arredondar
format(n, digits = 6, nsmall = 2)

# Em um hospital psiquiátrico, os pacientes permaneceram internados, em média, cinquenta dias, com desvio padrão de dez dias. Se for razoável pressupor que o tempo de permanência tem distribuição aproximadamente normal, qual a probabilidade de um paciente permanecer no hospital por mais de trinta dias ? Submeta a resposta em porcentagem com duas casas decimais. Por exemplo: 0.9452899 -> 94.52%.

# Dados
media <- 50
desvio <- 10
x <- 30

# Probabilidade P(X > 30)
prob <- 1 - pnorm(x, mean = media, sd = desvio)

# Converter para porcentagem com 2 casas decimais
prob_percent <- round(prob * 100, 2)

prob_percent

#  Considerando a questão anterior, qual a probabilidade de um paciente permanecer no hospital por menos de trinta dias ?Submeta a resposta em porcentagem com duas casas decimais. Por exemplo: 0.9452899 -> 94.52%.

# Dados
media <- 50
desvio <- 10
x <- 30

# Probabilidade P(X < 30)
prob <- pnorm(x, mean = media, sd = desvio)

# Converter para porcentagem com 2 casas decimais
prob_percent <- round(prob * 100, 2)

prob_percent

# Considere uma distribuição normal reduzida para os casos abaixo. Submeta todas as respostas em porcentagem com duas casas decimais. Por exemplo: 0.9452899 -> 94.52%.

# Qual a proporção de casos acima de z = 1 ?

prob <- 1 - pnorm(1)
prob_percent <- round(prob * 100, 2)
prob_percent


# Qual a proporção de casos abaixo de z = -2 ?

prob <- pnorm(-2)
prob_percent <- round(prob * 100, 2)
prob_percent

# Qual a proporção de casos abaixo de z = 0 ?

prob <- pnorm(0)
prob_percent <- round(prob * 100, 2)
prob_percent

# Qual a proporção de casos acima de z = 1,28 ?

prob <- 1 - pnorm(1.28)
prob_percent <- round(prob * 100, 2)
prob_percent


# Sabe-se que o tempo médio para completar a 1VA de Cálculo II da Rural é 90 minutos, com desvio padrão igual a 21 minutos. Se o professor responsável pela disciplina quiser que apenas 90% dos alunos terminem a 1 VA, quanto tempo deve dar aos candidatos para que o entreguem ? Dica: Use equação da normal padroniza. Também lembre de encontrar o valor de z equivalente a probabilidade de 90%. Use apenas duas casas decimais para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

z <- qnorm(0.90)
media <- 90
desvio <- 21
p <- 0.90

z <- qnorm(p)
t <- media + z * desvio

# Truncar para duas casas decimais (sem arredondar)
t_trunc <- floor(t * 100) / 100

t_trunc

# Num estudo sobre a qualidades nutricionais de lanches rápidos, mediu-se a quantidade de gordura em cem hambúrgueres  de determinada cadeira de restaurantes. Foram obtidos a média de 30,2 gramas e o desvio padrão de 3,8 gramas. Construa um intervalo de 95% de confiança para a quantidade média de gordura em hambúrgueres servidos nesses restaurantes. Submeta a resposta  com duas casas decimais e sem espaço. Por exemplo: [ 23.4551 - 34.44589 ] -> [23.45-34.44].

n <- 100
media <- 30.2
desvio <- 3.8
conf <- 0.95

z <- qnorm(1 - (1 - conf)/2)
erro <- z * desvio / sqrt(n)

lim_inf <- media - erro
lim_sup <- media + erro

# Formatação com duas casas decimais, sem espaço
ic <- paste0("[", 
             format(round(lim_inf, 2), nsmall = 2), 
             "-", 
             format(round(lim_sup, 2), nsmall = 2), 
             "]")

ic

# Para o mesmo estudo anterior, foi medida a quantidade de sal e se obtiveram a média de 658 mg e o desvio padrão de 47 mg. Ache o intervalo de 90% de confiança. Submeta a resposta  com duas casas decimais e sem espaço. Por exemplo: [ 23.4551 - 34.44589 ] -> [23.45-34.44].

n <- 100
media <- 658
desvio <- 47
conf <- 0.90

z <- qnorm(1 - (1 - conf)/2)
erro <- z * desvio / sqrt(n)

lim_inf <- media - erro
lim_sup <- media + erro

ic <- paste0("[", 
             format(round(lim_inf, 2), nsmall = 2), 
             "-", 
             format(round(lim_sup, 2), nsmall = 2), 
             "]")

ic

# Um engenheiro metalúrgico está interessado em analisar a porcentagem de carbono em uma liga de ferro produzido por sua empresa.Dez unidades amostrais de ferro apresentam as seguintes quantidades de carbono (em gramas) para cada cem gramas da liga: 4.37, 3.63, 2.78, 5.46, 2.18, 6.07, 3.24, 5.89, 4.86 e 4.64. Suponha que o objetivo é determinar, com base na amostra, um intervalo de confiança de 90% para o verdadeiro conteúdo médio de carbono na liga de ferro produzida pela empresa. Submeta a resposta  com duas casas decimais e sem espaço. Por exemplo: [ 23.4551 - 34.44589 ] -> [23.45-34.44].

dados <- c(4.37, 3.63, 2.78, 5.46, 2.18, 6.07, 3.24, 5.89, 4.86, 4.64)
n <- length(dados)
media <- mean(dados)
desvio <- sd(dados)
conf <- 0.90

t <- qt(1 - (1 - conf)/2, df = n - 1)
erro <- t * desvio / sqrt(n)

lim_inf <- media - erro
lim_sup <- media + erro

ic <- paste0("[",
             format(round(lim_inf, 2), nsmall = 2),
             "-",
             format(round(lim_sup, 2), nsmall = 2),
             "]")

ic











