#getwd()
#setwd("C:/Users/Kathy/Documents/Kathy/Estadistica/Proyecto Final")
setwd("C:/Users/Kathy/Documents/GitHub/ESTADISTICA-PROYECTO/Proyecto Final")

install.packages("readx1")
library(readxl)
Info <- read_excel("Info/Info.xlsx")
View(Info)

# install.packages("e1071") # Para sesgo y curtosis
# install.packages("knitr") # Para gráfico
# install.packages("kableExtra")
# install.packages("ggplot2") # Para gráfico también
# install.packages("gridExtra")
# install.packages("dplyr")
# install.packages("corrplot")

library(e1071)
library(knitr)
library(kableExtra)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(corrplot)

Info <- data.frame(
  Edad = c(21.00, 20.00, 22.00, 22.00, 22.00, 19.00, 20.00, 20.00, 23.00, 
           19.00, 20.00, 21.00, 20.00, 21.00, 23.00, 18.00, 19.00, 19.00, 
           20.00, 20.00, 21.00, 19.00, 20.00, 21.00, 20.00, 20.00, 22.00, 
           20.00, 21.00, 20.00, 22.00, 21.00, 22.00, 19.00, 19.00, 22.00, 
           22.00, 18.00, 20.00, 23.00, 21.00, 19.00, 20.00, 23.00, 20.00, 
           21.00, 22.00, 22.00, 23.00, 26.00),
  Foráneo = c("No", "No", "No", "No", "No", "No", "No", "No", "No", "No", 
              "No", "No", "No", "No", "No", "No", "Sí", "Sí", "No", "No", 
              "No", "No", "No", "No", "No", "No", "No", "No", "No", "No", 
              "No", "No", "No", "Sí", "Sí", "No", "No", "No", "No", "No", 
              "No", "No", "No", "No", "No", "No", "No", "Sí", "No", "Sí"),
  Laboral = c("Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Empleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Empleado", "Desempleado", "Desempleado", "Empleado", 
              "Desempleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Empleado", 
              "Empleado", "Desempleado", "Desempleado", "Desempleado", 
              "Desempleado", "Desempleado", "Desempleado", "Empleado", 
              "Desempleado", "Empleado", "Desempleado", "Empleado", 
              "Empleado", "Desempleado"),
  Economía = c("Mala", "Regular", "Buena", "Regular", "Regular", 
               "Regular", "Buena", "Buena", "Regular", "Regular", 
               "Mala", "Mala", "Regular", "Buena", "Buena", 
               "Buena", "Mala", "Regular", "Buena", "Regular", 
               "Regular", "Buena", "Regular", "Mala", "Mala", 
               "Regular", "Regular", "Regular", "Excelente", 
               "Regular", "Regular", "Regular", "Buena", 
               "Mala", "Regular", "Regular", "Regular", 
               "Regular", "Buena", "Regular", "Regular", 
               "Buena", "Regular", "Buena", "Regular", 
               "Regular", "Buena", "Regular", "Regular", 
               "Mala"),
  Estrés = c(95.00, 70.00, 90.00, 80.00, 70.00, 45.00, 45.00, 69.00, 
             95.00, 85.00, 80.00, 80.00, 55.00, 40.00, 60.00, 75.00, 
             95.00, 75.00, 20.00, 50.00, 70.00, 40.00, 35.00, 90.00, 
             95.00, 25.00, 40.00, 15.00, 35.00, 40.00, 85.00, 50.00, 
             25.00, 98.00, 80.00, 80.00, 70.00, 70.00, 65.00, 90.00, 
             85.00, 65.00, 55.00, 60.00, 50.00, 60.00, 70.00, 85.00, 
             50.00, 85.00),
  Gasto = c(20.00, 20.00, 50.00, 20.00, 10.00, 0.00, 15.00, 15.00, 
            6.00, 50.00, 20.00, 10.00, 20.00, 5.00, 5.00, 40.00, 
            20.00, 15.00, 15.00, 20.00, 5.00, 15.00, 8.00, 15.00, 
            20.00, 60.00, 10.00, 30.00, 30.00, 12.00, 20.00, 25.00, 
            10.00, 40.00, 20.00, 10.00, 25.00, 25.00, 20.00, 40.00, 
            20.00, 5.00, 20.00, 10.00, 15.00, 100.00, 15.00, 40.00, 
            0.00, 60.00),
  Deuda = c(1000.00, 500.00, 1000.00, 700.00, 300.00, 500.00, 600.00, 
            550.00, 870.00, 350.00, 600.00, 200.00, 40.00, 600.00, 
            100.00, 1000.00, 0.00, 400.00, 30.00, 300.00, 500.00, 
            300.00, 850.00, 200.00, 300.00, 400.00, 200.00, 300.00, 
            400.00, 400.00, 300.00, 20.00, 500.00, 200.00, 90.00, 
            0.00, 40.00, 0.00, 0.00, 700.00, 40.00, 1500.00, 500.00, 
            500.00, 300.00, 150.00, 400.00, 300.00, 700.00, 2500.00),
  Ingreso = c(500.00, 1300.00, 2500.00, 1000.00, 1000.00, 600.00, 1000.00, 
              1000.00, 900.00, 1600.00, 1300.00, 700.00, 1200.00, 1000.00, 
              600.00, 1400.00, 500.00, 2000.00, 1000.00, 900.00, 500.00, 
              900.00, 900.00, 500.00, 650.00, 900.00, 600.00, 800.00, 
              560.00, 700.00, 500.00, 250.00, 900.00, 400.00, 120.00, 
              700.00, 130.00, 800.00, 500.00, 700.00, 1500.00, 2000.00, 
              500.00, 800.00, 800.00, 950.00, 800.00, 350.00, 2000.00, 
              3000.00),
  Horas = c(16.00, 12.00, 15.00, 14.00, 10.00, 9.00, 8.00, 11.00, 
            12.00, 14.00, 13.00, 10.00, 8.00, 10.00, 14.00, 16.00, 
            13.00, 7.00, 9.00, 10.00, 8.00, 7.00, 15.00, 14.00, 
            7.00, 8.00, 5.00, 8.00, 8.00, 15.00, 10.00, 7.00, 
            17.00, 13.00, 12.00, 11.00, 10.00, 9.00, 15.00, 15.00, 
            13.00, 10.00, 11.00, 16.00, 12.00, 12.00, 14.00, 15.00, 
            15.00, 16.00),
  Promedio = c(7.00, 7.00, 6.00, 6.50, 8.00, 8.50, 8.50, 9.00, 
               6.00, 7.00, 7.00, 7.50, 8.00, 8.00, 8.00, 6.00, 
               6.50, 6.50, 7.00, 7.80, 8.00, 8.50, 8.70, 6.00, 
               6.50, 8.00, 8.00, 9.00, 9.00, 9.00, 6.50, 7.50, 
               8.00, 6.00, 7.00, 7.20, 7.28, 6.00, 7.50, 6.50, 
               7.00, 7.00, 8.00, 8.50, 7.00, 9.00, 7.80, 7.00, 
               8.00, 6.00),
  Materias = c(7.00, 5.00, 5.00, 5.00, 4.00, 4.00, 5.00, 4.00, 
               7.00, 5.00, 6.00, 8.00, 4.00, 4.00, 5.00, 5.00, 
               5.00, 5.00, 3.00, 5.00, 4.00, 3.00, 3.00, 6.00, 
               6.00, 4.00, 3.00, 3.00, 5.00, 3.00, 6.00, 4.00, 
               4.00, 6.00, 5.00, 6.00, 4.00, 4.00, 4.00, 5.00, 
               4.00, 5.00, 4.00, 3.00, 5.00, 8.00, 3.00, 5.00, 
               7.00, 6.00),
  Dificultad = c("Algo fácil", "Algo difícil", "Algo difícil", "Algo difícil", 
                "Normal", "Normal", "Normal", "Algo fácil", "Algo difícil", 
                "Normal", "Algo difícil", "Normal", "Normal", "Normal", 
                "Algo fácil", "Algo difícil", "Difícil", "Difícil", "Algo difícil", 
                "Normal", "Normal", "Algo fácil", "Algo fácil", "Difícil", 
                "Difícil", "Normal", "Algo fácil", "Difícil", "Normal", 
                "Normal", "Algo difícil", "Normal", "Algo fácil", "Algo difícil", 
                "Algo difícil", "Difícil", "Algo difícil", "Normal", "Algo difícil", 
                "Algo difícil", "Algo difícil", "Normal", "Algo difícil", 
                "Algo fácil", "Algo difícil", "Algo fácil", "Algo difícil", 
                "Algo difícil", "Normal", "Algo difícil")
)               

# ESTADÍSTICA DESCRIPTIVA UNIVARIANTE
# VARIABLES CUANTITATIVAS

#### VARIABLE EDAD

Edad <- Info[["Edad"]]

media <- mean(Edad)
mediana <- median(Edad)
desviacion <- sd(Edad)
q1 <- as.numeric(quantile(Edad, 0.25))
q3 <- as.numeric(quantile(Edad, 0.75))
curtosis <- kurtosis(Edad)
sesgo <- skewness(Edad)
minimo <- min(Edad)
maximo <- max(Edad)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Edad"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Edad, breaks=seq(min(Edad), max(Edad) + 5, by = 5), right = FALSE)

limites <- seq(min(Edad), max(Edad) + 5, by = 5)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Edad))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Edad, 
     main = "Histograma de Edad",
     xlab = "Edad",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Edad,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Edad",
        ylab = "Edad",                       
        col = "white",             
        border = "black")     

#### VARIABLE PORCENTAJE DE ESTRÉS PROMEDIO SEMANAL

Estres <- Info[["Estrés"]]

media <- mean(Estres)
mediana <- median(Estres)
desviacion <- sd(Estres)
q1 <- as.numeric(quantile(Estres, 0.25))
q3 <- as.numeric(quantile(Estres, 0.75))
curtosis <- kurtosis(Estres)
sesgo <- skewness(Estres)
minimo <- min(Estres)
maximo <- max(Estres)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Estrés Promedio Semanal"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Estres, breaks=seq(0, 101, by = 25.25), right = FALSE)

limites <- seq(0, 101, by = 25.25)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Estres))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Estres, 
     main = "Histograma de Porcentaje de Estrés Promedio Semanal",
     xlab = "Porcentaje de Estrés Promedio Semanal",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Estres,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Porcentaje de Estrés Promedio Semanal",
        ylab = "Porcentaje de Estrés Promedio Semanal",                       
        col = "white",             
        border = "black")     

#### VARIABLE GASTO SEMANAL UNIVERSITARIO

Gasto <- Info[["Gasto"]]

media <- mean(Gasto)
mediana <- median(Gasto)
desviacion <- sd(Gasto)
q1 <- as.numeric(quantile(Gasto, 0.25))
q3 <- as.numeric(quantile(Gasto, 0.75))
curtosis <- kurtosis(Gasto)
sesgo <- skewness(Gasto)
minimo <- min(Gasto)
maximo <- max(Gasto)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Gasto Semanal Universitario"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Gasto, breaks=seq(min(Gasto), max(Gasto) + 20, by = 20), right = FALSE)

limites <- seq(min(Gasto), max(Gasto) + 20, by = 20)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Gasto))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Gasto, 
     main = "Histograma de Gasto Semanal Universitario",
     xlab = "Gasto Semanal Universitario",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Gasto,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Gasto Semanal Universitario",
        ylab = "Gasto Semanal Universitario",                       
        col = "white",             
        border = "black")     

#### VARIABLE DEUDAS MENSUALES DEL HOGAR

Deuda <- Info[["Deuda"]]

media <- mean(Deuda)
mediana <- median(Deuda)
desviacion <- sd(Deuda)
q1 <- as.numeric(quantile(Deuda, 0.25))
q3 <- as.numeric(quantile(Deuda, 0.75))
curtosis <- kurtosis(Deuda)
sesgo <- skewness(Deuda)
minimo <- min(Deuda)
maximo <- max(Deuda)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Deudas Mensuales Del Hogar"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Deuda, breaks=seq(min(Deuda), max(Deuda) + 500, by = 500), right = FALSE)

limites <- seq(min(Deuda), max(Deuda) + 500, by = 500)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Deuda))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Deuda, 
     main = "Histograma de Deudas Mensuales del Hogar",
     xlab = "Deudas Mensuales del Hogar",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Deuda,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Deudas Mensuales del Hogar",
        ylab = "Deudas Mensuales del Hogar",                       
        col = "white",             
        border = "black")     

#### VARIABLE INGRESOs MENSUALES DEL HOGAR

Ingreso <- Info[["Ingreso"]]

media <- mean(Ingreso)
mediana <- median(Ingreso)
desviacion <- sd(Ingreso)
q1 <- as.numeric(quantile(Ingreso, 0.25))
q3 <- as.numeric(quantile(Ingreso, 0.75))
curtosis <- kurtosis(Ingreso)
sesgo <- skewness(Ingreso)
minimo <- min(Ingreso)
maximo <- max(Ingreso)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Ingresos Mensuales del Hogar"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Ingreso, breaks=seq(min(Ingreso), max(Ingreso) + 500, by = 500), right = FALSE)

limites <- seq(min(Ingreso), max(Ingreso) + 500, by = 500)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Ingreso))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Ingreso, 
     main = "Histograma de Ingresos Mensuales del Hogar",
     xlab = "Ingresos Mensuales del Hogar",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Ingreso,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Ingresos Mensuales del Hogar",
        ylab = "Ingresos Mensuales del Hogar",                       
        col = "white",             
        border = "black")     

#### VARIABLE HORAS DEDICADAS AL ESTUDIO DIARIAMENTE (SIN CONTAR LAS HORAS DE CLASE)

Horas <- Info[["Horas"]]

media <- mean(Horas)
mediana <- median(Horas)
desviacion <- sd(Horas)
q1 <- as.numeric(quantile(Horas, 0.25))
q3 <- as.numeric(quantile(Horas, 0.75))
curtosis <- kurtosis(Horas)
sesgo <- skewness(Horas)
minimo <- min(Horas)
maximo <- max(Horas)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Horas Dedicadas al Estudio Diariamente"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Horas, breaks=seq(min(Horas), max(Horas) + 3, by = 3), right = FALSE)

limites <- seq(min(Horas), max(Horas) + 3, by = 3)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Horas))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Horas, 
     main = "Histograma de Horas Diarias de Estudio",
     xlab = "Horas Diarias de Estudio",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Horas,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Horas Diarias de Estudio",
        ylab = "Horas Diarias de Estudio",                       
        col = "white",             
        border = "black")     

#### VARIABLE PROMEDIO OBTENIDO EN EL ÚLTIMO TÉRMINO

Promedio <- Info[["Promedio"]]

media <- mean(Promedio)
mediana <- median(Promedio)
desviacion <- sd(Promedio)
q1 <- as.numeric(quantile(Promedio, 0.25))
q3 <- as.numeric(quantile(Promedio, 0.75))
curtosis <- kurtosis(Promedio)
sesgo <- skewness(Promedio)
minimo <- min(Promedio)
maximo <- max(Promedio)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Promedio Obtenido en el Último Término"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Promedio, breaks=seq(min(Promedio), max(Promedio) + 0.5, by = 0.5), right = FALSE)

limites <- seq(min(Promedio), max(Promedio) + 0.5, by = 0.5)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Promedio))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Promedio, 
     main = "Histograma de Promedio Obtenido en el Último Término",
     xlab = "Promedio Obtenido en el Último Término",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Promedio,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Promedio Obtenido en el Último Término",
        ylab = "Promedio Obtenido en el Último Término",                       
        col = "white",             
        border = "black")     

#### VARIABLE NÚMERO DE MATERIAS TOMADAS EN EL ÚLTIMO TÉRMINO

Materias <- Info[["Materias"]]

media <- mean(Materias)
mediana <- median(Materias)
desviacion <- sd(Materias)
q1 <- as.numeric(quantile(Materias, 0.25))
q3 <- as.numeric(quantile(Materias, 0.75))
curtosis <- kurtosis(Materias)
sesgo <- skewness(Materias)
minimo <- min(Materias)
maximo <- max(Materias)

tabla_estadisticos <- data.frame(
  Media = media,
  "Desv. Estándar" = desviacion,
  Mediana = mediana,
  Q1 = q1,
  Q3 = q3,
  Sesgo = sesgo,
  Curtosis = curtosis,
  Mínimo = minimo,
  Máximo = maximo
)

print(tabla_estadisticos)

kable_styling(add_header_above(kable(tabla_estadisticos),c("Número de Materias Tomadas en el Último Término"=9)), bootstrap_options = c("striped", "hover", "condensed"))


intervalos <- cut(Materias, breaks=seq(min(Materias), max(Materias) + 2, by = 2), right = FALSE)

limites <- seq(min(Materias), max(Materias) + 2, by = 2)

m_clase <- (limites[-length(limites)] + limites[-1]) / 2

f_absoluta <- table(intervalos)

f_abs_acum <- cumsum(f_absoluta)

f_relativa <- as.numeric(table(intervalos)/length(Materias))

f_rel_acum <- cumsum(f_relativa)


tabla_frecuencias <- data.frame(
  "Marca de Clase" = m_clase,
  "Frecuencia Absoluta" = as.numeric(f_absoluta),
  "Frecuencia Abs. Acumulada" = f_abs_acum,
  "Frecuencia Relativa" = f_relativa,
  "Frecuencia Rel. Acumulada" = f_rel_acum
)

print(tabla_frecuencias)

hist(Materias, 
     main = "Histograma de Número de Materias Tomadas en el Último Término",
     xlab = "Número de Materias Tomadas en el Último Término",       
     ylab = "Frecuencia",       
     col = "lightblue",                
     border = "black")     

boxplot(Materias,
        horizontal = TRUE,
        main = "Diagrama de Cajas de Número de Materias Tomadas en el Último Término",
        ylab = "Número de Materias Tomadas en el Último Término",                       
        col = "white",             
        border = "black")     

####

# VARIBLES CUALITATIVAS

#### VARIABLE ES PERSONA FORÁNEA

Foraneo <- Info[["Foráneo"]]

f_absoluta <- table(Foraneo)

barplot(f_absoluta, 
        main = "Diagrama de Barras de Es Foráneo",
        xlab = "Es Foráneo",
        ylab = "Frecuencia",
        col = "gold",
        border = "black")

#### VARIABLE SITUACIÓN LABORAL

Laboral <- Info[["Laboral"]]

f_absoluta <- table(Laboral)

barplot(f_absoluta, 
        main = "Diagrama de Barras de Situación Laboral",
        xlab = "Situación Laboral",
        ylab = "Frecuencia",
        col = "gold",
        border = "black")

#### VARIABLE CALIDAD DE ECONOMÍA

Economia <- Info[["Economía"]]

f_absoluta <- table(Economia)

barplot(f_absoluta, 
        main = "Diagrama de Barras de Calidad de Economía",
        xlab = "Calidad de Economía",
        ylab = "Frecuencia",
        col = "gold",
        border = "black")

#### VARIABLE DIFICULTAD PARA EQUILIBRAR LA VIDA PERSONAL Y LA ACADÉMICA

Dificultad <- Info[["Dificultad"]]

f_absoluta <- table(Dificultad)

barplot(f_absoluta, 
        main = "Diagrama de Barras de Dificultad para Equilibrar la Vida Personal y la Académica",
        xlab = "Dificultad para Equilibrar la Vida Personal y la Académica",
        ylab = "Frecuencia",
        col = "gold",
        border = "black")

####

# ESTADÍSTICA DESCRIPTIVA BIVARIANTE O MULTIVARIANTE
# VARIABLES CUANTITATIVAS

#### MATRIZ DE COVARIANZA & CORRELACIÓN

datos <- data.frame(
  Edad = Edad,
  Estres = Estres,
  Gasto_Universitario = Gasto,
  Deuda = Deuda,
  Ingreso = Ingreso,
  Horas_Estudio = Horas,
  Promedio = Promedio,
  Materias = Materias
)

# MATRIZ DE COVARIANZA

matriz_cov <- cov(datos)

print(matriz_cov)

# MATRIZ DE CORRELACIÓN

matriz_cor <- cor(datos)

print(matriz_cor)

# MATRIZ GRÁFICA DE CORRELACIÓN

corrplot(matriz_cor, method = "circle", addCoef.col = "black",)

pairs(datos)

####

# VARIABLES CUALITATIVAS

# GRÁFICOS SEGMENTADOS POR UNA VARIABLE CUALITATIVA

datos <- data.frame(
  Foraneo <- Info[["Foráneo"]],
  Laboral <- Info[["Laboral"]],
  Economia <- Info[["Economía"]],
  Dificultad <- Info[["Dificultad"]],
  Estres <- Info[["Estrés"]],
  Gasto <- Info[["Gasto"]],
  Horas <- Info[["Horas"]],
  Ingreso <- Info[["Ingreso"]],
  Deuda <- Info[["Deuda"]],
  Promedio <- Info[["Promedio"]]
)

boxplot(Estres ~ Foraneo, data=datos, main="Diagrama de Cajas de Estrés por Condición de Foráneo",
        xlab="Es Foráneo", ylab="Estrés", col=c("skyblue", "lightgreen"))

boxplot(Gasto ~ Foraneo, data=datos, main="Diagrama de Cajas de Gasto Semanal Universitario por Condición de Foráneo",
        xlab="Es Foráneo", ylab="Gasto Semanal Universitario", col=c("skyblue", "lightgreen"))

boxplot(Estres ~ Laboral, data=datos, main="Diagrama de Cajas de Estrés por Situación Laboral",
        xlab="Situación Laboral", ylab="Estrés", col=c("skyblue", "lightgreen"))

boxplot(Horas ~ Laboral, data=datos, main="Diagrama de Cajas de Horas Diarias de Estudio por Situación Laboral",
        xlab="Situación Laboral", ylab="Horas Diarias de Estudio", col=c("skyblue", "lightgreen"))

boxplot(Gasto ~ Laboral, data=datos, main="Diagrama de Cajas de Gasto Semanal Universitario por Situación Laboral",
        xlab="Situación Laboral", ylab="Gasto Semanal Universitario", col=c("skyblue", "lightgreen"))

boxplot(Gasto ~ Economia, data=datos, main="Diagrama de Cajas de Gasto Semanal Universitario por Calidad de Economía",
        xlab="Calidad de Economía", ylab="Gasto Semanal Universitario", col=c("skyblue", "lightgreen"))

boxplot(Estres ~ Economia, data=datos, main="Diagrama de Cajas de Estrés por Calidad de Economía",
        xlab="Calidad de Economía", ylab="Estrés", col=c("skyblue", "lightgreen"))

boxplot(Estres ~ Dificultad, data=datos, main="Diagrama de Cajas de Estrés por Dificultad para Equilibrar la Vida Personal y la Académica",
        xlab="Dificultad para Equilibrar la Vida Personal y la Académica", ylab="Estrés", col=c("skyblue", "lightgreen"))

boxplot(Gasto ~ Dificultad, data=datos, main="D. de Cajas de Gasto Semanal Universitario por Dificultad para Equilibrar Vida Personal y Académica",
        xlab="Dificultad para Equilibrar la Vida Personal y la Académica", ylab="Gasto Semanal Universitario", col=c("skyblue", "lightgreen"))

boxplot(Promedio ~ Dificultad, data=datos, main="D. de Cajas de Promedio Obtenido en el Último Término por Dificultad para Equilibrar Vida Personal y Académica",
        xlab="Dificultad para Equilibrar la Vida Personal y la Académica", ylab="Promedio Obtenido en el Último Término", col=c("skyblue", "lightgreen"))

####

# ESTADÍSTICA INFERENCIAL

### INTERVALOS DE CONFIANZA

Estres <- Info[["Estrés"]]
Promedio <- Info[["Promedio"]]
Materias <- Info[["Materias"]]

muestra <- length(Estres)
alpha <- 0.05
zalpha <- abs(qnorm(alpha/2))

# INTERVALO DE CONFIANZA PARA LA MEDIA DE LA VARIABLE ESTRÉS CON UN 0.05% DE SIGNIFICANCIA

mediaE <- mean(Estres)
sdE <- sd(Estres)

linfEstres <- mediaE - ((sdE/sqrt(muestra))*zalpha)
lsupEstres <- mediaE + ((sdE/sqrt(muestra))*zalpha)

print(paste0("[",linfEstres,", ",lsupEstres,"]"))

# INTERVALO DE CONFIANZA PARA LA MEDIA DE LA VARIABLE PROMEDIO CON UN 0.05% DE SIGNIFICANCIA

mediaP <- mean(Promedio)
sdP <- sd(Promedio)

linfPromedio <- mediaP - ((sdP/sqrt(muestra))*zalpha)
lsupPromedio <- mediaP + ((sdP/sqrt(muestra))*zalpha)

print(paste0("[",linfPromedio,", ",lsupPromedio,"]"))

# INTERVALO DE CONFIANZA PARA LA MEDIA DE LA VARIABLE MATERIAS CON UN 0.05% DE SIGNIFICANCIA

mediaM <- mean(Materias)
sdM <- sd(Materias)

linfMaterias <- mediaM - ((sdM/sqrt(muestra))*zalpha)
lsupMaterias <- mediaM + ((sdM/sqrt(muestra))*zalpha)

print(paste0("[",linfMaterias,", ",lsupMaterias,"]"))

###

### PRUEBAS DE HIPÓTESIS

# PR
