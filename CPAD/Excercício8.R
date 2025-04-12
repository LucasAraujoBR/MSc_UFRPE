# Dado o vetor com valores de medidas de comprimento em metros v<-c(20,30,4,934,1077,22), submeta a função paste() que apenas adiciona a unidade metro (‘m’) após cada número do vetor. Note que não pode haver espaço entre o número e a unidade de medida. Além disso,  use aspas simples e remova todos os espaços em banco do comando.

v<-c(20,30,4,934,1077,22)

paste(v,'m',sep='')

# Copie o poema "No Meio do Caminho" de Drummond  através do link: https://www.culturagenial.com/poema-no-meio-do-caminho-de-carlos-drummond-de-andrade/. Note que tem que ser copiado e colado exatamente como está no site (sem o título). Calcule e submeta a quantidade de caracteres totais, incluindo os espaços em branco e as quebras de linha(‘\n’).

poema <- "No meio do caminho tinha uma pedra\ntinha uma pedra no meio do caminho\ntinha uma pedra\nno meio do caminho tinha uma pedra.\n\nNunca me esquecerei desse acontecimento\nna vida de minhas retinas tão fatigadas.\nNunca me esquecerei que no meio do caminho\ntinha uma pedra\ntinha uma pedra no meio do caminho\nno meio do caminho tinha uma pedra."
nchar(poema)

# Dado o vetor de strings  txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan"), submeta a expressão regular que deve ser escrita no atributo ‘pattern’  da função grep(pattern= " ", txt, value= TRUE) de modo que ela retorne as palavras: "can", "man" e "fan".

txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")

grep(pattern="^[cmf]an$", txt, value=TRUE)


# Dado a string txt = "eeer3GHJca1nfgSigmanfaUIOntafan",  qual a expressão regular que deve ser adicionada no atributo ‘pattern’ da função str_extract_all(string=string,pattern=" ") para que ela extraia apenas números e letras maiúsculas. Note que você precisa carregar o pacote  stringr. Também use o Regex.

txt = "eeer3GHJca1nfgSigmanfaUIOntafan"
install.packages("stringr")
library(stringr)
str_extract_all(string = txt, pattern = "[0-9A-Z]")

# Responda a questão anterior com o POSIX.
str_extract_all(string = txt, pattern = "[[:digit:][:upper:]]")

# Dado a string txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA", qual a expressão regular que deve ser adicionado no atributo ‘pattern’ da função str_extract_all(string=txt,pattern=" "), para que ela extraia os padrões "UFRPE19PPGIA"  e "UFRPEcapdPPGIA".

txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"

library(stringr)
str_extract_all(string = txt, pattern = "UFRPE[[:alnum:]]*?PPGIA")

# Copie o discurso de Marthin Luther King Jr. do seguinte link: https://www.dropbox.com/scl/fi/72sxh749yicv5iuzhzva5/Dream.txt?rlkey=ju5a34vbblhx5yxqlham5wrk5&dl=0. Qual a expressão regular trás "negro", "negros", "Negro", "Negros", "negra", "negras", "Negra" e "Negras"?

discurso <- "Eu estou contente em unir-me com vocês no dia que entrará para a história como a maior demonstração pela liberdade na história de nossa nação.


Cem anos atrás, um grande americano, na qual estamos sob sua simbólica sombra, assinou a Proclamação de Emancipação. Esse importante decreto veio como um grande farol de esperança para milhões de escravos negros que tinham murchados nas chamas da injustiça. Ele veio como uma alvorada para terminar a longa noite de seus cativeiros.
Mas cem anos depois, o Negro ainda não é livre.
Cem anos depois, a vida do Negro ainda é tristemente inválida pelas algemas da segregação e as cadeias de discriminação.
Cem anos depois, o Negro vive em uma ilha só de pobreza no meio de um vasto oceano de prosperidade material. Cem anos depois, o Negro ainda adoece nos cantos da sociedade americana e se encontram exilados em sua própria terra. Assim, nós viemos aqui hoje para dramatizar sua vergonhosa condição.


De certo modo, nós viemos à capital de nossa nação para trocar um cheque. Quando os arquitetos de nossa república escreveram as magníficas palavras da Constituição e a Declaração da Independência, eles estavam assinando uma nota promissória para a qual todo americano seria seu herdeiro. Esta nota era uma promessa que todos os homens, sim, os homens negros, como também os homens brancos, teriam garantidos os direitos inalienáveis de vida, liberdade e a busca da felicidade. Hoje é óbvio que aquela América não apresentou esta nota promissória. Em vez de honrar esta obrigação sagrada, a América deu para o povo negro um cheque sem fundo, um cheque que voltou marcado com fundos insuficientes.


Mas nós nos recusamos a acreditar que o banco da justiça é falível. Nós nos recusamos a acreditar que há capitais insuficientes de oportunidade nesta nação. Assim nós viemos trocar este cheque, um cheque que nos dará o direito de reclamar as riquezas de liberdade e a segurança da justiça.


Nós também viemos para recordar à América dessa cruel urgência. Este não é o momento para descansar no luxo refrescante ou tomar o remédio tranqüilizante do gradualismo.
Agora é o tempo para transformar em realidade as promessas de democracia.
Agora é o tempo para subir do vale das trevas da segregação ao caminho iluminado pelo sol da justiça racial.
Agora é o tempo para erguer nossa nação das areias movediças da injustiça racial para a pedra sólida da fraternidade. Agora é o tempo para fazer da justiça uma realidade para todos os filhos de Deus.


Seria fatal para a nação negligenciar a urgência desse momento. Este verão sufocante do legítimo descontentamento dos Negros não passará até termos um renovador outono de liberdade e igualdade. Este ano de 1963 não é um fim, mas um começo. Esses que esperam que o Negro agora estará contente, terão um violento despertar se a nação votar aos negócios de sempre


. Mas há algo que eu tenho que dizer ao meu povo que se dirige ao portal que conduz ao palácio da justiça. No processo de conquistar nosso legítimo direito, nós não devemos ser culpados de ações de injustiças. Não vamos satisfazer nossa sede de liberdade bebendo da xícara da amargura e do ódio. Nós sempre temos que conduzir nossa luta num alto nível de dignidade e disciplina. Nós não devemos permitir que nosso criativo protesto se degenere em violência física. Novamente e novamente nós temos que subir às majestosas alturas da reunião da força física com a força de alma. Nossa nova e maravilhosa combatividade mostrou à comunidade negra que não devemos ter uma desconfiança para com todas as pessoas brancas, para muitos de nossos irmãos brancos, como comprovamos pela presença deles aqui hoje, vieram entender que o destino deles é amarrado ao nosso destino. Eles vieram perceber que a liberdade deles é ligada indissoluvelmente a nossa liberdade. Nós não podemos caminhar só.


E como nós caminhamos, nós temos que fazer a promessa que nós sempre marcharemos à frente. Nós não podemos retroceder. Há esses que estão perguntando para os devotos dos direitos civis, Quando vocês estarão satisfeitos?


Nós nunca estaremos satisfeitos enquanto o Negro for vítima dos horrores indizíveis da brutalidade policial. Nós nunca estaremos satisfeitos enquanto nossos corpos, pesados com a fadiga da viagem, não poderem ter hospedagem nos motéis das estradas e os hotéis das cidades. Nós não estaremos satisfeitos enquanto um Negro não puder votar no Mississipi e um Negro em Nova Iorque acreditar que ele não tem motivo para votar. Não, não, nós não estamos satisfeitos e nós não estaremos satisfeitos até que a justiça e a retidão rolem abaixo como águas de uma poderosa correnteza.


Eu não esqueci que alguns de você vieram até aqui após grandes testes e sofrimentos. Alguns de você vieram recentemente de celas estreitas das prisões. Alguns de vocês vieram de áreas onde sua busca pela liberdade lhe deixaram marcas pelas tempestades das perseguições e pelos ventos de brutalidade policial. Você são o veteranos do sofrimento. Continuem trabalhando com a fé que sofrimento imerecido é redentor. Voltem para o Mississippi, voltem para o Alabama, voltem para a Carolina do Sul, voltem para a Geórgia, voltem para Louisiana, voltem para as ruas sujas e guetos de nossas cidades do norte, sabendo que de alguma maneira esta situação pode e será mudada. Não se deixe caiar no vale de desespero.


Eu digo a você hoje, meus amigos, que embora nós enfrentemos as dificuldades de hoje e amanhã. Eu ainda tenho um sonho. É um sonho profundamente enraizado no sonho americano.


Eu tenho um sonho que um dia esta nação se levantará e viverá o verdadeiro significado de sua crença - nós celebraremos estas verdades e elas serão claras para todos, que os homens são criados iguais.


Eu tenho um sonho que um dia nas colinas vermelhas da Geórgia os filhos dos descendentes de escravos e os filhos dos desdentes dos donos de escravos poderão se sentar junto à mesa da fraternidade.


Eu tenho um sonho que um dia, até mesmo no estado de Mississippi, um estado que transpira com o calor da injustiça, que transpira com o calor de opressão, será transformado em um oásis de liberdade e justiça.


Eu tenho um sonho que minhas quatro pequenas crianças vão um dia viver em uma nação onde elas não serão julgadas pela cor da pele, mas pelo conteúdo de seu caráter. Eu tenho um sonho hoje!
  
  Eu tenho um sonho que um dia, no Alabama, com seus racistas malignos, com seu governador que tem os lábios gotejando palavras de intervenção e negação; nesse justo dia no Alabama meninos negros e meninas negras poderão unir as mãos com meninos brancos e meninas brancas como irmãs e irmãos. Eu tenho um sonho hoje!
  
  Eu tenho um sonho que um dia todo vale será exaltado, e todas as colinas e montanhas virão abaixo, os lugares ásperos serão aplainados e os lugares tortuosos serão endireitados e a glória do Senhor será revelada e toda a carne estará junta.


Esta é nossa esperança. Esta é a fé com que regressarei para o Sul. Com esta fé nós poderemos cortar da montanha do desespero uma pedra de esperança. Com esta fé nós poderemos transformar as discórdias estridentes de nossa nação em uma bela sinfonia de fraternidade. Com esta fé nós poderemos trabalhar juntos, rezar juntos, lutar juntos, para ir encarcerar juntos, defender liberdade juntos, e quem sabe nós seremos um dia livre. Este será o dia, este será o dia quando todas as crianças de Deus poderão cantar com um novo significado.


Meu país, doce terra de liberdade, eu te canto.


Terra onde meus pais morreram, terra do orgulho dos peregrinos,


De qualquer lado da montanha, ouço o sino da liberdade!


E se a América é uma grande nação, isto tem que se tornar verdadeiro.


E assim ouvirei o sino da liberdade no extraordinário topo da montanha de New Hampshire.


Ouvirei o sino da liberdade nas poderosas montanhas poderosas de Nova York.


Ouvirei o sino da liberdade nos engrandecidos Alleghenies da Pennsylvania.


Ouvirei o sino da liberdade nas montanhas cobertas de neve Rockies do Colorado.


Ouvirei o sino da liberdade nas ladeiras curvas da Califórnia.


Mas não é só isso. Ouvirei o sino da liberdade na Montanha de Pedra da Geórgia.


Ouvirei o sino da liberdade na Montanha de Vigilância do Tennessee.


Ouvirei o sino da liberdade em todas as colinas do Mississipi.


Em todas as montanhas, ouviu o sino da liberdade.


E quando isto acontecer, quando nós permitimos o sino da liberdade soar, quando nós deixarmos ele soar em toda moradia e todo vilarejo, em todo estado e em toda cidade, nós poderemos acelerar aquele dia quando todas as crianças de Deus, homens pretos e homens brancos, judeus e gentios, protestantes e católicos, poderão unir mãos e cantar nas palavras do velho spiritual negro:
  
  Livre afinal, livre afinal.


Agradeço ao Deus todo-poderoso, nós somos livres afinal.
"

matches <- str_extract_all(string = discurso, pattern = "\\b[Nn]egr[oa]s?\\b")
matches

# Qual das opções abaixo correspondem a regexp "a(ab)*a" ? 

# Define a expressão regular
regex <- "^a(ab)*a$"

# Lista de strings para verificar
strings <- c("abababa", "aaba", "aabbaa", "aba", "aabababa")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

#  Qual das opções abaixo correspondem a regexp "ab+c?" ?  

# Define a expressão regular
regex <- "ab+c?"

# Lista de strings para verificar
strings <- c("abc", "ac", "abbb", "bbc")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "a.[bc]+" ? 

# Define a expressão regular
regex <- "a.[bc]+"

# Lista de strings para verificar
strings <- c("abc", "abbbbbbbb", "azc", "abcbcbcbc", "ac", "asccbbbbcbcccc")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "abc|xyz" ? 

# Define a expressão regular
regex <- "abc|xyz"

# Lista de strings para verificar
strings <- c("abc", "xyz", "abc|xyz")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "[a-z]+[\.\?!]" ?


# Define a expressão regular
regex <- "[a-z]+[\\.\\?!]"

# Lista de strings para verificar
strings <- c("battle!", "Hot", "green","swamping","jump up.","undulate?", "is.?")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "[a-zA-Z]*[^,]=" ? 

# Define a expressão regular
regex <- "[a-zA-Z]*[^,]="

# Lista de strings para verificar
strings <- c("Butt=", "BotHEr,=", "Ample","FIdDlE7h=","Brittle =", "Other.=")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "[a-z][\.\?!]\s+[A-Z]" ?

# Define a expressão regular
regex <- "[a-z][\\.\\?!]\\s+[A-Z]"

# Lista de strings para verificar
strings <- c("A. B", "c! d", "e f","g.   H","i?  J", "k L")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "(very )+(fat )?(tall|ugly) man" ? 

# Define a expressão regular
regex <- "(very )+(fat )?(tall|ugly) man"

# Lista de strings para verificar
strings <- c("very fat man", "fat tall man", "very very fat ugly man","very very very tall man")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Qual das opções abaixo correspondem a regexp "<[^>]+>" ? 

# Define a expressão regular
regex <- "<[^>]+>"

# Lista de strings para verificar
strings <- c("<an xml tag>", "<opentag> <closetag>", "</closetag>","<>", "<with attribute=”77”>")

# Verificar se cada string corresponde à expressão regular
resultados <- sapply(strings, function(x) grepl(regex, x))

# Mostrar resultados
names(resultados) <- strings
print(resultados)

# Baixe o dataset Gapminder  através do seguinte comando: aux<- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1"). Após isso, responda as questões a seguir.
aux<- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1")

# Usando as expressões regulares, encontre todos os países que possuem uma palavra "and" em seu nome, exemplo "Blulu and Blele".  Abaixo submeta apenas a expressão regular.  Dica: para evitar repetições dos países uso os níveis. 
# Encontrar os países com "and" no nome
countries_with_and <- unique(aux$country[grep("\\b\\w*and\\w*\\b", aux$country)])
print(countries_with_and)

# Encontre os nomes de países que: (i) começam com “Ba”; (ii) terminam com “land”; e (iii) tenham uma palavra no nome que começa com “Ga” (dica: veja \b). Após isso, submeta o total de países encontrados para os itens anteriores. Note que apenas um único número será submetido.  Dica: para evitar repetições dos países uso os níveis. 
# Filtrar países de acordo com os critérios
countries_Ba <- unique(aux$country[grep("^Ba\\w*", aux$country)])
countries_land <- unique(aux$country[grep("\\w*land$", aux$country)])
countries_Ga <- unique(aux$country[grep("\\bGa\\w*\\b", aux$country)])

# Combinar os resultados e contar o número total de países únicos
all_countries <- unique(c(countries_Ba, countries_land, countries_Ga))
total_countries <- length(all_countries)

# Submeter o total
total_countries

