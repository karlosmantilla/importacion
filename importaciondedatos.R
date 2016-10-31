# Importación de Datos
# Importar datos desde Excel:

# El tradicional Copy+Paste:

datos.cp <- read.delim("clipboard")
head(datos.cp)
View(datos.cp)
sapply(datos.cp, class)
summary(datos.cp)

# Directamente de excel
# install.packages('XLConnect')
library(XLConnect)
wb <- loadWorkbook("Libro1.xls", create = TRUE)
excel <- readWorksheet(wb, sheet = "Hoja1")

# en un solo paso
excel2 <- readWorksheet(loadWorkbook("Libro1.xls", create = TRUE), sheet = "Hoja1")

## Importar archivos CSV
datos.csv <- read.csv("datos.csv", header = T)
head(datos.csv)  # así es como deben lucir los datos
sapply(datos.csv, class)  # esto es para conocer la clase de cada variable
summary(datos.csv)  # este es un breve resumen estadístico las variables

## Importar datos txt con tabulación
datos.txt <- read.delim("datos.txt", header = TRUE, sep = "\t")
head(datos.txt)

# alternativa
datos.txt2 <- read.table("datos.txt", header = TRUE, sep = "\t")
head(datos.txt2)

# Desde una web:
Web <- "http://people.cst.cmich.edu/lee1c/spss/V16_materials/DataSets_v16/Diseaseoutbreak.txt"
datosWeb1 <- read.table(Web)  # o puede escribirse la dirección directamente dentro
head(datosWeb1)  # un vistazo para ver cómo son los datos

# Otra alternativa:
Web <- "http://people.cst.cmich.edu/lee1c/spss/V16_materials/DataSets_v16/Diseaseoutbreak.txt"
nombres <- c("ID", "edad", "hijos", "coches", "yates", "motos")
datosWeb2 <- read.table(Web, col.names = nombres)
head(datosWeb2)  # un vistazo para ver cómo resulta

## Desde SPSS:
library(foreign)
empleados1 <- read.spss("Empleados_400.sav", to.data.frame = TRUE)
dim(empleados1)

# Otro ejemplo:
dspss <- read.spss("DatosSPSS.sav", to.data.frame = T)
dspss  # problema: variable dbay es una fecha y no sale como formato fecha :(
sapply(dspss, class)

# se puede arreglar:
dspss <- transform(dspss, bday = as.Date(ISOdate(1582, 10, 14) + dspss$bday))
dspss

## Desde Stata:
stata <- read.dta("datosStata.dta")
head(stata)
sapply(stata, class)

stata$treat <- as.factor(stata$treat)
# stata <- transform(stata, treat=as.factor(treat)) alternativa para
# convertir en factores
stata$gender <- as.factor(stata$gender)

## Extras, si queremos a los factores con etiquetas, entonces...
stata$gender <- factor(stata$gender, labels = c("Mujer", "Hombre"))
stata$treat <- factor(stata$treat, labels = c("Control", "Tratado"))
head(stata)

