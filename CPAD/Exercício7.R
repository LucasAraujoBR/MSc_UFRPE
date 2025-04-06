# Qual o resultado da função abaixo

y <- 5
mult <- function(x,y){
  return(x*y)
}

mult(10)

# Erro, faltaria passar o y na função

# Qual o resultado da função abaixo.

y <- 5
mult <- function(x){
  return (x*y)
}
mult(10)
# 50

#Escreva uma função chamada 'prisoes' que calcula a soma das prisões em estados americanos do dataset USArrests. A função 'prisoes' recebe dois argumentos: 'estados' e 'tiposPrisoes'. Dado esses argumentos, a função retorna o total de prisões. Se não existir nem o estado ou o tipo de prisão, então uma mensagem de erro deve ser retornada. O protótipo dessa função é: prisoes <- function(estados, tiposPrisoes){}. As seguintes mensagens precisam ser apresentadas caso o estado ou o tipo de prisão estejam inválidos: "Estado Inválido"  ou "Tipo de Prisão Inválida". De posse dessa função, responda as questões abaixo.
prisoes <- function(estados, tiposPrisoes) {
  # Verifica se o pacote 'datasets' está disponível e carrega o dataset USArrests
  data("USArrests")
  
  # Nomes válidos de estados e tipos de prisão
  estados_validos <- rownames(USArrests)
  tipos_validos <- colnames(USArrests)
  
  # Verifica se todos os estados informados são válidos
  if (!all(estados %in% estados_validos)) {
    return("Estado Inválido")
  }
  
  # Verifica se todos os tipos de prisão informados são válidos
  if (!all(tiposPrisoes %in% tipos_validos)) {
    return("Tipo de Prisão Inválida")
  }
  
  # Filtra os dados conforme os estados e tipos informados
  dados_filtrados <- USArrests[estados, tiposPrisoes, drop = FALSE]
  
  # Soma total
  total <- sum(dados_filtrados)
  
  # Formata o nome dos estados na resposta
  if (length(estados) == 1) {
    return(paste("O total de prisoes do estado", estados, "é", total))
  } else {
    return(paste("O total de prisoes dos estados", paste(estados, collapse = ", "), "é", total))
  }
}

# Qual é o total de prisões do código a seguir? prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))
prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))

# Qual é o total de prisões do código a seguir? prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))
prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))

# Qual é o total de prisões do código a seguir? prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))
prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))

# Qual é o total de prisões do código a seguir? prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))
prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))

#Para responder as questões abaixo ver o documento " Detalhamento de Questões". Mais especificamente, Questão 'minhasNotas_1'.
#Questão 'minhasNotas_1'

#Escreva uma função chamada 'minhasNotas_1' que calcula a média das suas notas para a disciplina de Computação para Análise de Dados. A função 'minhasNotas_1' recebe 8 argumentos: 'Exe_1', "VA_1", 'Exe_2', "Proj" "VA_2", "VA_3", "Opt", e "threshold". “Opt" pode receber quatro opções: 1 para retornar a média da 1 VA, 2 para retornar a média da 2 VA, 3 para retornar a média da 3 VA e 4 para retornar a Média Final, incluindo a 3 VA. Note que se qualquer opção for selecionada, as demais devem ser ignoradas. Além disso, a Média Final da UFRPE consiste de uma média aritmética das duas maiores médias (1VA, 2VA e 3VA). Para a 1 e a 2 VA as notas de 'Exe_1', "VA_1", "Exe_2", "Proj" e "VA_2" possuem os seguintes pesos,  respectivamente, 5, 5, 2, 5, 3. Assim, por exemplo, a média da 1 VA é uma média ponderada dada pela seguinte equação: 1VA = (('Exe_1'*5) + ("VA_1"*5)/10). Por fim, o argumento "threshold" consiste na média mínima de aprovação. 

#A função  'minhasNotas_1' retorna a média do aluno de acordo com a opção escolhida e também se a mesma está abaixo ou a cima do "threshold". Vale ser ressaltado que se a opção “4” for escolhida então uma mensagem será retornada informando a média e se o aluno foi aprovado ou se está na final. Adicionalmente, uma mensagem de erro deve ser apresentada caso notas acima de 10 ou menores que zero forem passadas. O mesmo deve acontecer se for escolhido uma opção incorreta ou se o aluno não tiver notas para uma determinada VA. Por fim, NAs devem ser tratado como nota zero e a "VA_1", o "Proj", a "VA_2" e a "VA_3" devem receber apenas um único valor. 

#O protótipo dessa função é descrito a seguir: minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7){}. Por exemplo, as seguintes mensagens poderão ser apresentadas caso o aluno selecione a nota da 1 VA (Opt=1) e o threshold igual a 7,0:  "Média da 1VA: 9.0 -- Acima da Média" ou “Aluno não possui nota para a 1 VA”. Se Opt=3 for selecionada e o threshold for igual a 7,0 as seguintes mensagens poderão ser apresentadas: “Aluno não possui nenhuma nota -- Reprovado!!", “9,0 -- Aprovado!!" ou “6,0 -- Na Final!!".

minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7) {
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  
  todas_notas <- c(Exe_1, VA_1, Exe_2, Proj, VA_2, VA_3)
  if (any(todas_notas > 10 | todas_notas < 0)) {
    return("Nota(s) Inválida(s)")
  }
  
  if (length(VA_1) != 1 || length(Proj) != 1 || length(VA_2) != 1 || length(VA_3) != 1) {
    return("Quantidade de Notas Inválidas para a 1 VA!")
  }
  
  if (Opt == 1) {
    if (length(Exe_1) == 0 || is.na(VA_1)) {
      return("Aluno não possui nota para a 1 VA")
    }
    media1 <- (mean(Exe_1) * 5 + VA_1 * 5) / 10
    status <- ifelse(media1 >= threshold, "Acima da Média", "Abaixo da Média")
    return(paste("Média da 1VA:", media1, "--", status))
  }
  
  if (Opt == 2) {
    if (length(Exe_2) == 0 || is.na(Proj) || is.na(VA_2)) {
      return("Aluno não possui nota para a 2 VA")
    }
    media2 <- (mean(Exe_2) * 2 + Proj * 5 + VA_2 * 3) / 10
    status <- ifelse(media2 >= threshold, "Acima da Média", "Abaixo da Média")
    return(paste("Média da 2VA:", media2, "--", status))
  }
  
  if (Opt == 3) {
    if (is.na(VA_3) || length(VA_3) == 0) {
      return("Aluno não possui nenhuma nota -- Reprovado!!")
    }
    status <- ifelse(VA_3 >= threshold, "Aprovado!!", "Na Final!!")
    return(paste(VA_3, "--", status))
  }
  
  if (Opt == 4) {
    media1 <- (mean(Exe_1) * 5 + VA_1 * 5) / 10
    media2 <- (mean(Exe_2) * 2 + Proj * 5 + VA_2 * 3) / 10
    medias <- c(media1, media2, VA_3)
    duas_maiores <- sort(medias, decreasing = TRUE)[1:2]
    media_final <- mean(duas_maiores)
    status <- ifelse(media_final >= threshold, "Aprovado!!", "Na Final!!")
    return(paste(media_final, "--", status))
  }
  
  return("Opção Inválida")
}


# Qual o retorno da seguinte função? minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)

# Qual o retorno da seguinte função? minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)
minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)


# Qual o retorno da seguinte função? minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)

# Qual o retorno da seguinte função? minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, threshold=7)
minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, threshold=7)

# Qual o retorno da seguinte função? minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)