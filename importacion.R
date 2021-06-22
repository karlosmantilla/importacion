
Texto <- read.table("datos.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)

head(Texto)

library(haven)
spss <- read_sav("DatosSPSS.sav")
colnames(spss) <- tolower(colnames(spss))

head(spss)

stata <- read_stata("datosStata.dta")

head(stata)

library(readxl)
excel <- read_excel('datos.xlsx')
head(excel)
