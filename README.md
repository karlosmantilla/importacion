<h2 style="text-align: left;">Importación de Datos</h2>
<p>Existen varios formatos que contienen las bases de datos, <strong>R</strong> puede trabajar con el 95% de las extensiones de archivo existentes: archivo de texto, stata, spss, matlab, minitab, excel, exportado desde sas, etc. Realizaremos el ejercicio con las extensiones más comunes.</p>
<p>Antes de empezar a trabajar es necesario seleccionar el directorio de trabajo, esto se hace con la orden <span style="font-family: 'courier new', courier, monospace;"><strong>setwd()</strong></span>. La linea de comandos quedaría de la siguiente forma:</p>
<pre><code class="r">setwd("~/GitHub/importacion")
</code></pre>
<p>En este caso, estamos moviéndonos en un subdirectorio con profundidad de segundo nivel dentro del directorio original de trabajo. Si se quiere cambiar por completo la ubicación del directorio de trabajo es necesario escribir la ruta completa. Por ejemplo, si queremos movernos a un directorio llamado "llaves" ubicado en la partición "D" se escribe:</p>
<pre><code class="r">setwd("~D:/llaves")
</code></pre>
<p>Lo anterior se usa cuando se quiere que mediante el script se ubique el directorio de trabajo. Si el usuario quiere hacerlo manualmente puede recurrir en el menú contextual a la opción Archivo/Cambia dir...</p>
<p>Veamos ahora las extensiones de archivo que, comúnmente nos encontramos.</p>
<h3>Archivos de Texto</h3>
<p>Los archivos de texto son los que se guardan en documentos tipo block de notas. Su extensión es<i> </i><span style="font-family: 'courier new', courier, monospace;"><strong>"*.txt"</strong></span>. Son comunes a todos los sistemas operativos y no poseen propietario por lo que es posible trabajar con ellos sin inconvenientes de compatibilidad o licencia. El comando para realizar al importación es <span style="font-family: 'courier new', courier, monospace;"><strong>read.table()</strong></span>. Para saber cuáles son los argumentos completos se puede emplear <span style="font-family: 'courier new', courier, monospace;"><strong>args(read.table)</strong></span> y podremos ver cómo se define el comando. Los elementos que encontramos son:</p>
<pre><code class="r">Nombre con el que se identifica el conjunto de datos&lt;- read.table("nombre del archivo.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)</code></pre>
<p>Es decir, si queremos cargar un conjunto de datos al que llamaremos <strong><span style="font-family: 'courier new', courier, monospace;">Texto</span></strong> usando un archivo denominado <strong><span style="font-family: 'courier new', courier, monospace;">datos.txt</span></strong> la línea de comandos queda:</p>
<pre><code class="r">Texto &lt;- read.table("datos.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
</code></pre>
<p>Si queremos saber cómo quedan configurados los datos podemos escribir</p>
<pre><code class="r">head(Texto)
</code></pre>
<p>Y obtenemos como salida:</p>
<pre><code>##   country country.isocode year      POP       ppp     cgnp
## 1  France             FRA 2000 61136.52 0.9140463 101.3730
## 2  France             FRA 2001 61479.30 0.9103722 101.1844
## 3  France             FRA 2002 61828.99 0.9105602 100.2736
## 4  France             FRA 2003 62171.39 0.9079510 100.6268
## 5  France             FRA 2004 62534.16 0.8972155 100.7924
## 6  France             FRA 2005 62911.52 0.8858009 100.6463
</code></pre>
<h3>Archivos de SPSS</h3>
<p>Otro tipo de archivo que es factible encontrar son los generados mediante SPSS. Su extensión es <span style="font-family: 'courier new', courier, monospace;"><strong>"*.sav"</strong></span>. Para importarlo, necesitamos una librería llamada <strong><span style="font-family: 'courier new', courier, monospace;">foreign</span></strong>, para emplearla se escribe</p>
<pre><code class="r">library(foreign, pos=15)
</code></pre>
<p>Si la librería no está disponible hay que proceder a instalarla. En la clase se explicará cómo instalar una librería.</p>
<p>Siguiendo el mismo orden de ideas del caso de archivos de texto, la linea de comandos queda:</p>
<pre><code class="r">spss &lt;- read.spss("DatosSPSS.sav",   use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(spss) &lt;- tolower(colnames(spss))
</code></pre>
<p>Es decir, hemos creado un conjunto de datos llamado <span style="font-family: 'courier new', courier, monospace;"><strong>spss</strong></span> y le hemos asignado a las columnas el mismo nombre que el archivo original llamado <span style="font-family: 'courier new', courier, monospace;"><strong>DatosSPSS.sav</strong></span>. Del mismo modo, si queremos conocer la conformación del conjunto de datos podemos escribir</p>
<pre><code class="r">head(spss)
</code></pre>
<p>Y obtenemos como salida:</p>
<pre><code>##      nom eda alt pes    sex        bday
## 1 Laura   25 167  65  Mujer 12846211200
## 2 Maria   21 160  57  Mujer 12850531200
## 3 Pedro   23 178  83 Hombre 13044931200
## 4 Josep   29 170  69 Hombre 12571718400
## 5 Martha  23 163  65  Mujer 12692678400
## 6 Jordi   19 185  90 Hombre 12129177600
</code></pre>
<h3>Archivos de STATA</h3>
<p>Otro tipo de archivo que podemos encontrar son los de STATA. Su extensión es <span style="font-family: 'courier new', courier, monospace;"><strong>"*.dat"</strong></span>. Para importarlo, necesitamos también la librería llamada <strong><span style="font-family: 'courier new', courier, monospace;">foreign</span>.</strong> Similar al caso de Texto y SPSS, para importar los datos escribimos</p>
<pre><code class="r">stata &lt;- read.dta("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/datosStata.dta", 
  convert.dates=TRUE, convert.factors=TRUE, missing.type=TRUE, convert.underscore=TRUE, 
  warn.missing.labels=TRUE)
</code></pre>
<pre><code class="r">head(stata)
</code></pre>
<pre><code>##   pers   postrem treat gender     priori
## 1    1 2492.1555     0      0 0.19019672
## 2    2 2871.1895     0      0 0.16711207
## 3    3 2370.7405     0      0 0.15091535
## 4    4 3726.5693     0      0 0.09395168
## 5    5  859.6276     0      0 0.05056068
## 6    6 3705.2524     0      0 0.06708307
</code></pre>
<h3>Archivos de EXCEL</h3>
<p>Finalmente, tenemos los archivos de EXCEL. Son los más comunes. Para importarlo, necesitamos de nuevo la librería <span style="font-family: 'courier new', courier, monospace;"><strong>foreign</strong></span>. Continuando con la dinámica de los casos anteriores escribimos</p>
<pre><code class="r">excel &lt;- readXL("H:/DOCUMENTOS/Nueva carpeta/GitHub/importacion/datos.xls", rownames=FALSE,
   header=TRUE, na="", sheet="datos", stringsAsFactors=TRUE)
</code></pre>
<pre><code class="r">head(excel)
</code></pre>
<pre><code>##   country country.isocode year      POP       ppp     cgnp
## 1  France             FRA 2000 61136.52 0.9140463 101.3730
## 2  France             FRA 2001 61479.30 0.9103722 101.1844
## 3  France             FRA 2002 61828.99 0.9105602 100.2736
## 4  France             FRA 2003 62171.39 0.9079510 100.6268
## 5  France             FRA 2004 62534.16 0.8972155 100.7924
## 6  France             FRA 2005 62911.52 0.8858009 100.6463
</code></pre>
<h3>Ejercicios</h3>
<p>Con los archivos suministrados mediante el enlace realice la actividad de importación</p>
<p>Enlace: <a href="https://www.dropbox.com/sh/1gxpj6s6q1k9iqc/AACuejTbXPoLZ8iiYgF877joa?dl=0" target="_blank">https://www.dropbox.com/sh/1gxpj6s6q1k9iqc/AACuejTbXPoLZ8iiYgF877joa?dl=0</a></p>
