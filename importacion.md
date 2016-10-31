


```r
Texto <- read.table("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/datos.txt", header=TRUE, 
  sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
```


```r
head(Texto)
```

```
##   country country.isocode year      POP       ppp     cgnp
## 1  France             FRA 2000 61136.52 0.9140463 101.3730
## 2  France             FRA 2001 61479.30 0.9103722 101.1844
## 3  France             FRA 2002 61828.99 0.9105602 100.2736
## 4  France             FRA 2003 62171.39 0.9079510 100.6268
## 5  France             FRA 2004 62534.16 0.8972155 100.7924
## 6  France             FRA 2005 62911.52 0.8858009 100.6463
```



```r
library(foreign, pos=15)
```



```r
spss <- read.spss("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/DatosSPSS.sav", 
  use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(spss) <- tolower(colnames(spss))
```


```r
head(spss)
```

```
##      nom eda alt pes    sex        bday
## 1 Laura   25 167  65  Mujer 12846211200
## 2 Maria   21 160  57  Mujer 12850531200
## 3 Pedro   23 178  83 Hombre 13044931200
## 4 Josep   29 170  69 Hombre 12571718400
## 5 Martha  23 163  65  Mujer 12692678400
## 6 Jordi   19 185  90 Hombre 12129177600
```



```r
stata <- read.dta("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/datosStata.dta", 
  convert.dates=TRUE, convert.factors=TRUE, missing.type=TRUE, convert.underscore=TRUE, 
  warn.missing.labels=TRUE)
```


```r
head(stata)
```

```
##   pers   postrem treat gender     priori
## 1    1 2492.1555     0      0 0.19019672
## 2    2 2871.1895     0      0 0.16711207
## 3    3 2370.7405     0      0 0.15091535
## 4    4 3726.5693     0      0 0.09395168
## 5    5  859.6276     0      0 0.05056068
## 6    6 3705.2524     0      0 0.06708307
```



```r
excel <- readXL("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/datos.xls", rownames=FALSE,
   header=TRUE, na="", sheet="datos", stringsAsFactors=TRUE)
```


```r
head(excel)
```

```
##   country country.isocode year      POP       ppp     cgnp
## 1  France             FRA 2000 61136.52 0.9140463 101.3730
## 2  France             FRA 2001 61479.30 0.9103722 101.1844
## 3  France             FRA 2002 61828.99 0.9105602 100.2736
## 4  France             FRA 2003 62171.39 0.9079510 100.6268
## 5  France             FRA 2004 62534.16 0.8972155 100.7924
## 6  France             FRA 2005 62911.52 0.8858009 100.6463
```



