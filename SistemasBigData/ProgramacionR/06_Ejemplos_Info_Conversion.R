# ==========================================================
#  EJEMPLOS DE FUNCIONES DE INFORMACIÓN Y DE CONVERSIÓN
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# Objetos de ejemplo que vamos a analizar
# ----------------------------------------------------------
numeros <- c(4, 8, 15, 16, 23, 42)
enteros <- 1:10
texto   <- c("rojo", "verde", "azul")
logico  <- c(TRUE, FALSE, TRUE)
matriz  <- matrix(1:6, nrow = 2)
alumnos <- data.frame(
  nombre = c("Ana", "Luis", "Marta", "Pablo", "Sara", "Iván", "Eva"),
  edad   = c(20, 22, 19, 25, 21, 23, 20),
  nota   = c(7.5, 5.0, 9.2, 6.1, 8.4, 4.3, 7.0),
  grupo  = factor(c("A", "B", "A", "B", "A", "B", "A"))
)


# ==========================================================
# 1. FUNCIONES DE INFORMACIÓN
# ==========================================================

# ----------------------------------------------------------
# class(x) -> clase del objeto (cómo lo trata R)
# ----------------------------------------------------------
class(numeros)        # "numeric"
class(enteros)        # "integer"
class(texto)          # "character"
class(logico)         # "logical"
class(matriz)         # "matrix" "array"
class(alumnos)        # "data.frame"
class(alumnos$grupo)  # "factor"

# ----------------------------------------------------------
# typeof(x) -> tipo interno (cómo está guardado en memoria)
# ----------------------------------------------------------
typeof(numeros)       # "double"  -> número real
typeof(enteros)       # "integer"
typeof(matriz)        # "integer" -> una matriz guarda enteros dentro
typeof(alumnos)       # "list"    -> un data frame es internamente una lista
typeof(alumnos$grupo) # "integer" -> un factor guarda códigos numéricos
# La diferencia: class() dice QUÉ ES el objeto, typeof() CÓMO SE GUARDA

# ----------------------------------------------------------
# length(x) -> número de elementos
# ----------------------------------------------------------
length(numeros)       # 6
length(texto)         # 3
length(matriz)        # 6  -> total de celdas
length(alumnos)       # 4  -> ¡ojo! en un data frame cuenta las COLUMNAS

# ----------------------------------------------------------
# dim(x) -> dimensiones (filas y columnas)
# ----------------------------------------------------------
dim(matriz)           # 2 3
dim(alumnos)          # 7 4 -> 7 filas y 4 columnas
dim(numeros)          # NULL -> un vector no tiene dimensiones
nrow(alumnos)         # 7
ncol(alumnos)         # 4

# ----------------------------------------------------------
# names(x) -> nombres de los componentes o columnas
# ----------------------------------------------------------
names(alumnos)        # "nombre" "edad" "nota" "grupo"
names(numeros)        # NULL -> el vector no tiene nombres
temp <- c(lunes = 12, martes = 18)
names(temp)           # "lunes" "martes"

# ----------------------------------------------------------
# head(x) y tail(x) -> primeras y últimas filas o elementos
# ----------------------------------------------------------
head(alumnos)         # 6 primeras filas (valor por defecto)
head(alumnos, 3)      # 3 primeras filas
tail(alumnos, 2)      # 2 últimas filas
head(numeros, 2)      # 4 8
tail(numeros, 2)      # 23 42
# Muy útiles con datos grandes: no tiene sentido imprimir un millón de filas

# ----------------------------------------------------------
# str(x) -> estructura interna de forma compacta
# ----------------------------------------------------------
str(numeros)          # num [1:6] 4 8 15 16 23 42
str(alumnos)          # tipo de cada columna y primeros valores
# Es la PRIMERA función que conviene usar al cargar unos datos nuevos

# ----------------------------------------------------------
# summary(x) -> resumen según el tipo de objeto
# ----------------------------------------------------------
summary(numeros)          # mínimo, cuartiles, media y máximo
summary(texto)            # longitud, clase y modo
summary(logico)           # cuántos TRUE y FALSE
summary(alumnos$grupo)    # recuento de cada nivel
summary(alumnos)          # resumen de cada columna

# ----------------------------------------------------------
# attributes(x) -> atributos adicionales del objeto
# ----------------------------------------------------------
attributes(numeros)       # NULL -> un vector simple no tiene atributos
attributes(matriz)        # $dim
attributes(temp)          # $names
attributes(alumnos$grupo) # $levels y $class
attributes(alumnos)       # $names, $class y $row.names


# ==========================================================
# 2. FUNCIONES DE CONVERSIÓN
# ==========================================================

# ----------------------------------------------------------
# as.numeric(x) -> a número
# ----------------------------------------------------------
as.numeric("3.75")            # 3.75
as.numeric(c("10", "20", "30")) + 1   # 11 21 31 -> ya se puede operar
as.numeric(TRUE)              # 1
as.numeric(FALSE)             # 0
as.numeric("3,75")            # NA -> R usa el PUNTO como separador decimal
as.numeric("hola")            # NA con aviso

# ----------------------------------------------------------
# as.integer(x) -> a entero
# ----------------------------------------------------------
as.integer(9.99)              # 9 -> corta los decimales, no redondea
as.integer("42")              # 42

# ----------------------------------------------------------
# as.character(x) -> a texto
# ----------------------------------------------------------
as.character(123)             # "123"
as.character(numeros)         # "4" "8" "15" ...
as.character(TRUE)            # "TRUE"

# ----------------------------------------------------------
# as.logical(x) -> a TRUE o FALSE
# ----------------------------------------------------------
as.logical(c("TRUE", "false", "T", "si"))   # TRUE FALSE TRUE NA
as.logical(c(0, 1, 5))                      # FALSE TRUE TRUE

# ----------------------------------------------------------
# as.factor(x) -> a factor
# ----------------------------------------------------------
ciudades <- c("Valencia", "Madrid", "Valencia", "Bilbao")
f <- as.factor(ciudades)
f
levels(f)                     # "Bilbao" "Madrid" "Valencia"

# ----------------------------------------------------------
# as.Date(x) -> a fecha
# ----------------------------------------------------------
fecha <- as.Date("2026-11-03")        # formato estándar: año-mes-día
fecha
class(fecha)                          # "Date"
fecha + 30                            # 30 días después
as.Date("2026-12-25") - fecha         # días que faltan hasta Navidad

# Si la fecha viene en formato español, hay que indicar el formato
as.Date("03/11/2026", format = "%d/%m/%Y")
# %d = día, %m = mes, %Y = año con 4 cifras

format(fecha, "%d/%m/%Y")             # de fecha a texto con nuestro formato

# ----------------------------------------------------------
# as.POSIXct(x) -> a fecha y hora
# ----------------------------------------------------------
momento <- as.POSIXct("2026-11-03 15:40:00", tz = "Europe/Madrid")
momento
momento + 3600                        # se suman SEGUNDOS: una hora más
format(momento, "%H:%M")              # "15:40"
difftime(as.POSIXct("2026-11-03 18:00:00", tz = "Europe/Madrid"),
         momento, units = "mins")     # 140 minutos

# ----------------------------------------------------------
# as.vector(x) -> a vector
# ----------------------------------------------------------
matriz
as.vector(matriz)             # 1 2 3 4 5 6 -> se recorre por columnas

# ----------------------------------------------------------
# as.matrix(x) -> a matriz
# ----------------------------------------------------------
as.matrix(numeros)            # vector convertido en matriz de 1 columna
as.matrix(alumnos[, c("edad", "nota")])   # columnas numéricas -> matriz numérica
# ¡OJO! Si el data frame mezcla texto y números, la matriz será toda de texto
as.matrix(head(alumnos, 2))

# ----------------------------------------------------------
# as.data.frame(x) -> a data frame
# ----------------------------------------------------------
as.data.frame(matriz)         # columnas V1, V2, V3
df <- as.data.frame(matriz)
names(df) <- c("enero", "febrero", "marzo")
df


# ----------------------------------------------------------
# 3. EJEMPLO PRÁCTICO: limpiar datos que llegan como texto
# ----------------------------------------------------------
# Muy habitual al leer ficheros: todo llega como texto
importes_txt <- c("12.50", "8", "15.75", "error", "20")
fechas_txt   <- c("01/10/2026", "15/10/2026", "03/11/2026", "05/11/2026", "10/11/2026")

str(importes_txt)                 # chr -> no se puede sumar

importes <- as.numeric(importes_txt)    # "error" pasa a NA (con aviso)
importes
sum(importes, na.rm = TRUE)       # 56.25 -> na.rm = TRUE ignora los NA

fechas <- as.Date(fechas_txt, format = "%d/%m/%Y")
fechas
fechas[fechas >= as.Date("2026-11-01")]   # solo las de noviembre
