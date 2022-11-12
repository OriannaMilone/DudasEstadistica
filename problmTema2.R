#Cuadernillo de problemas tema 2 estadística.
#Sientete libre de incluir tus dudas si tienes. (lo de compartir codigo por whass se nos esta yendo de las manos)
#je je je ;)


#ULTIMO APARTADO NO FUNCIONA. (b.3)
#18. Se lanzan dos monedas y se tira un dado tantas veces como caras se hayan obtenido. (a) Halla la
#probabilidad de que la suma de las puntuaciones sea 6. (b) Si sabemos que el resultado del juego es que
#los dados han sumado 6, ¿Cu´al es la probabilidad de haber obtenido 0 caras, 1 cara o 2 caras?

#Para facilitar los calculos, vamos a asumir que las Caras son 1, y los 0 Cruz
#a)
N = 50000
sims = replicate(N,{
  monedas = sample(c(1,0), 2, replace = TRUE)
  lanzamiento = sum(monedas)
  if(lanzamiento != 0){
    dado = sample(c(1:6), lanzamiento, replace = TRUE)
  }else{
    dado = 0
  }
  exito = (sum(dado) == 6)
  sum(exito)
})
resultado6 = mean(sims)

#b) 
#b.2) P(H=1 | r=6) = P(H=1 Y r=6)/ P(r=6)
#Calculamos la intersección entre : Ha salido solo una cara y el resultado ha sido 6
N = 50000
sims = replicate(N,{
  monedas = sample(c(1,0),1)
  monedas
  if(monedas != 0){
    dado = sample(c(1:6), 1)
  }else{
    dado = 0
  }
  exito = (sum(dado) == 6)
  sum(exito)
})
interseccion = mean(sims)

#Aplicamos la formula, y dividimos la intersección entre la prob de obtener como resultado 6.
interseccion / resultado6

#b.3) Repetimos el procedimiento anterior, particularizando para caras = 2  
# P(H=2 | r=6) = P(H=2 Y r=6)/ P(r=6)

N = 50000
sim = replicate(N,{
  dado = sample(c(1:6), 2, replace = TRUE)
  exito = (sum(dado) == 6)
  sum(exito)
})

b3 = mean(sim)
b3/resultado6    ### DA UNA PROB >> 1 