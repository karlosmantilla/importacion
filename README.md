
# Importación de Datos

Existen varios formatos que contienen las bases de datos, R puede trabajar con el 95% de las extensiones de archivo existentes: archivo de texto, stata, spss, matlab, minitab, excel, exportado desde sas, etc. Realizaremos el ejercicio con las extensiones más comunes.

Antes de empezar a trabajar es necesario seleccionar el directorio de trabajo, esto se hace con la orden setwd(). La linea de comandos quedaría de la siguiente forma:

`setwd("~/GitHub/importacion")`

En este caso, estamos moviéndonos en un subdirectorio con profundidad de segundo nivel dentro del directorio original de trabajo. Si se quiere cambiar por completo la ubicación del directorio de trabajo es necesario escribir la ruta completa. Por ejemplo, si queremos movernos a un directorio llamado "llaves" ubicado en la partición "D" se escribe:

`setwd("~D:/llaves")`

Lo anterior se usa cuando se quiere que mediante el script se ubique el directorio de trabajo. Si el usuario quiere hacerlo manualmente puede recurrir en el menú contextual a la opción Archivo/Cambia dir...

Veamos ahora las extensiones de archivo que, comúnmente nos encontramos.

## Archivos de Texto

Los archivos de texto son los que se guardan en documentos tipo block de notas. Su extensión es `*.txt`. Son comunes a todos los sistemas operativos y no poseen propietario por lo que es posible trabajar con ellos sin inconvenientes de compatibilidad o licencia. El comando para realizar al importación es `read.table()` . Para saber cuáles son los argumentos completos se puede emplear `args(read.table)` y podremos ver cómo se define el comando. Los elementos que encontramos son:

`Nombre con el que se identifica el conjunto de datos<- read.table("nombre del archivo.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)`

Es decir, si queremos cargar un conjunto de datos al que llamaremos **Texto** usando un archivo denominado `datos.txt` la línea de comandos queda:


```R
Texto <- read.table("datos.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
```

Si queremos saber cómo quedan configurados los datos podemos escribir


```R
head(Texto)
```


<table class="dataframe">
<caption>A data.frame: 6 × 6</caption>
<thead>
	<tr><th></th><th scope=col>country</th><th scope=col>country.isocode</th><th scope=col>year</th><th scope=col>POP</th><th scope=col>ppp</th><th scope=col>cgnp</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>France</td><td>FRA</td><td>2000</td><td>61136.52</td><td>0.9140463</td><td>101.3730</td></tr>
	<tr><th scope=row>2</th><td>France</td><td>FRA</td><td>2001</td><td>61479.30</td><td>0.9103722</td><td>101.1844</td></tr>
	<tr><th scope=row>3</th><td>France</td><td>FRA</td><td>2002</td><td>61828.99</td><td>0.9105602</td><td>100.2736</td></tr>
	<tr><th scope=row>4</th><td>France</td><td>FRA</td><td>2003</td><td>62171.39</td><td>0.9079510</td><td>100.6268</td></tr>
	<tr><th scope=row>5</th><td>France</td><td>FRA</td><td>2004</td><td>62534.16</td><td>0.8972155</td><td>100.7924</td></tr>
	<tr><th scope=row>6</th><td>France</td><td>FRA</td><td>2005</td><td>62911.52</td><td>0.8858009</td><td>100.6463</td></tr>
</tbody>
</table>



## Archivos de SPSS

Otro tipo de archivo que es factible encontrar son los generados mediante SPSS. Su extensión es `*.sav`. Para importarlo, necesitamos una librería llamada `heaving`, (Si la librería no está disponible hay que proceder a instalarla. En la clase se explicará cómo instalar una librería) para emplearla se escribe:


```R
library(haven)
spss <- read_sav("DatosSPSS.sav")
colnames(spss) <- tolower(colnames(spss))
```

Es decir, hemos creado un conjunto de datos llamado `spss` y le hemos asignado a las columnas el mismo nombre que el archivo original llamado `DatosSPSS.sav`. Del mismo modo, si queremos conocer la conformación del conjunto de datos podemos escribir:


```R
head(spss)
```


<table class="dataframe">
<caption>A tibble: 6 × 6</caption>
<thead>
	<tr><th scope=col>nom</th><th scope=col>eda</th><th scope=col>alt</th><th scope=col>pes</th><th scope=col>sex</th><th scope=col>bday</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl+lbl&gt;</th><th scope=col>&lt;date&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Laura </td><td>25</td><td>167</td><td>65</td><td>2</td><td>1989-11-12</td></tr>
	<tr><td>Maria </td><td>21</td><td>160</td><td>57</td><td>2</td><td>1990-01-01</td></tr>
	<tr><td>Pedro </td><td>23</td><td>178</td><td>83</td><td>1</td><td>1996-02-29</td></tr>
	<tr><td>Josep </td><td>29</td><td>170</td><td>69</td><td>1</td><td>1981-03-02</td></tr>
	<tr><td>Martha</td><td>23</td><td>163</td><td>65</td><td>2</td><td>1984-12-31</td></tr>
	<tr><td>Jordi </td><td>19</td><td>185</td><td>90</td><td>1</td><td>1967-02-22</td></tr>
</tbody>
</table>



## Archivos de STATA

Otro tipo de archivo que podemos encontrar son los de STATA. Su extensión es `*.dat`. Para importarlo, necesitamos también la librería llamada foreign. Similar al caso de Texto y SPSS, para importar los datos escribimos


```R
stata <- read_stata("datosStata.dta")
```


```R
head(stata)
```


<table class="dataframe">
<caption>A tibble: 6 × 5</caption>
<thead>
	<tr><th scope=col>pers</th><th scope=col>postrem</th><th scope=col>treat</th><th scope=col>gender</th><th scope=col>priori</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1</td><td>2492.1555</td><td>0</td><td>0</td><td>0.19019672</td></tr>
	<tr><td>2</td><td>2871.1895</td><td>0</td><td>0</td><td>0.16711207</td></tr>
	<tr><td>3</td><td>2370.7405</td><td>0</td><td>0</td><td>0.15091535</td></tr>
	<tr><td>4</td><td>3726.5693</td><td>0</td><td>0</td><td>0.09395168</td></tr>
	<tr><td>5</td><td> 859.6276</td><td>0</td><td>0</td><td>0.05056068</td></tr>
	<tr><td>6</td><td>3705.2524</td><td>0</td><td>0</td><td>0.06708307</td></tr>
</tbody>
</table>



## Archivos de EXCEL

Finalmente, tenemos los archivos de EXCEL. Son los más comunes. Para importarlo, necesitamos de nuevo la librería `readxl`. Continuando con la dinámica de los casos anteriores escribimos


```R
library(readxl)
excel <- read_excel('datos.xlsx')
head(excel)
```


<table class="dataframe">
<caption>A tibble: 6 × 6</caption>
<thead>
	<tr><th scope=col>country</th><th scope=col>country isocode</th><th scope=col>year</th><th scope=col>POP</th><th scope=col>ppp</th><th scope=col>cgnp</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>France</td><td>FRA</td><td>2000</td><td>61136.52</td><td>0.9140463</td><td>101.3730</td></tr>
	<tr><td>France</td><td>FRA</td><td>2001</td><td>61479.30</td><td>0.9103722</td><td>101.1844</td></tr>
	<tr><td>France</td><td>FRA</td><td>2002</td><td>61828.99</td><td>0.9105602</td><td>100.2736</td></tr>
	<tr><td>France</td><td>FRA</td><td>2003</td><td>62171.39</td><td>0.9079510</td><td>100.6268</td></tr>
	<tr><td>France</td><td>FRA</td><td>2004</td><td>62534.16</td><td>0.8972155</td><td>100.7924</td></tr>
	<tr><td>France</td><td>FRA</td><td>2005</td><td>62911.52</td><td>0.8858009</td><td>100.6463</td></tr>
</tbody>
</table>



## Ejercicios

Con los archivos suministrados mediante el enlace realice la actividad de importación

Enlace: https://www.dropbox.com/sh/2vkytdx76al71xz/AAByhIYhp-CYXfuthUSgG-1ba?dl=0

También se puede consultar: https://github.com/karlosmantilla/importacion

El script no comentado lo consigue en: https://github.com/karlosmantilla/importacion/blob/master/importacion.R
