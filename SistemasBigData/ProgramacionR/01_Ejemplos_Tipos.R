# ==========================================================
#  EJEMPLOS DE FUNCIONES BÁSICAS EN R
#  Números enteros, números reales, textos y valores lógicos
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio)
# y observa el resultado de cada instrucción en la consola.


# ----------------------------------------------------------
# 1. NÚMEROS ENTEROS
# ----------------------------------------------------------

# En R, un número escrito "tal cual" es real (numeric/double).
# Para que sea entero hay que añadir una L o usar as.integer().
a <- 5
b <- 5L

class(a)          # "numeric"
class(b)          # "integer"

# is.integer(x): comprueba si un objeto es de tipo entero
is.integer(a)     # FALSE -> ¡ojo! 5 sin L es un número real
is.integer(b)     # TRUE

# as.integer(x): convierte un valor a entero
as.integer(7.9)   # 7  -> elimina los decimales, NO redondea
as.integer(-7.9)  # -7
as.integer("42")  # 42 -> también convierte texto a número
as.integer("hola")# NA con un aviso: no se puede convertir

# is.numeric(x): comprueba si es numérico (entero o real)
is.numeric(a)     # TRUE
is.numeric(b)     # TRUE
is.numeric("5")   # FALSE -> es un texto

# as.numeric(x): convierte un entero a real
c <- as.numeric(b)
class(c)          # "numeric"
c / 2             # 2.5

# max() y min(): mayor y menor valor
max(10L, 25L)          # 25
min(10L, 25L)          # 10
max(3, 8, 1, 12, 5)    # 12 -> admiten más de dos valores
min(3, 8, 1, 12, 5)    # 1


# ----------------------------------------------------------
# 2. NÚMEROS REALES
# ----------------------------------------------------------

x <- 3.14159
y <- -2.7

# as.numeric() e is.numeric()
as.numeric("3.5")      # 3.5
is.numeric(x)          # TRUE

# round(x, digits): redondea al número de decimales indicado
round(x, 2)            # 3.14
round(x)               # 3
round(1.5)             # 2
round(2.5)             # 2 -> ¡curiosidad! R redondea al par más cercano

# signif(x, digits): redondea a un número de cifras significativas
signif(123456, 2)      # 120000
signif(x, 3)           # 3.14

# floor(), ceiling() y trunc()
floor(-2.7)               # -3 -> entero inmediatamente inferior
ceiling(-2.7)             # -2 -> entero inmediatamente superior
trunc(-2.7)               # -2 -> elimina los decimales sin redondear
floor(2.7);    # 2
ceiling(2.7);  # 3
trunc(2.7)     # 2

# abs(x): valor absoluto
abs(y)                 # 2.7


# ----------------------------------------------------------
# 3. TEXTOS
# ----------------------------------------------------------

frase <- "Big Data con R"
nombre <- "Ana"

# nchar(x): número de caracteres (los espacios también cuentan)
nchar(frase)                    # 14

# toupper() y tolower()
toupper(frase)                  # "BIG DATA CON R"
tolower(frase)                  # "big data con r"

# substr(x, start, stop): extrae una parte de la cadena
substr(frase, 1, 8)             # "Big Data"

# substring(x, first, last): si no indicamos last, llega hasta el final
substring(frase, 10)            # "con R"

# paste() y paste0()
paste("Hola", nombre, "bienvenida")           # "Hola Ana"   -> añade un espacio
paste("2026", "11", "03", sep = "-")   # "2026-11-03" -> separador personalizado
paste0("usuario_", 25)          # "usuario_25" -> sin espacio
paste("usuario_", 25, sep = "")          # igual que anterior

# strsplit(x, split): divide una cadena según un patrón
strsplit(frase, " ")            # lista con "Big" "Data" "con" "R"
strsplit("rojo,verde,azul", ",")

# grepl(pattern, x): TRUE si el patrón aparece en la cadena
grepl("Data", frase)            # TRUE
grepl("Python", frase)          # FALSE

# gsub(pattern, replacement, x): reemplaza las coincidencias
gsub("R", "Python", frase)      # "Big Data con Python"
gsub(" ", "_", frase)           # "Big_Data_con_R"

# sprintf(): formatea texto con plantillas (SÍ se puede guardar)
mensaje <- sprintf("%s tiene %d años y mide %.2f m", nombre, 30L, 1.6789)
mensaje                         # "Ana tiene 30 años y mide 1.68 m"
# %s = texto, %d = entero, %.2f = real con 2 decimales

# cat(): imprime en la consola (NO se puede guardar)
cat("Hola", nombre, "\n")       # Hola Ana
resultado <- cat("Prueba\n")    # imprime "Prueba"...
resultado                       # ...pero la variable queda vacía: NULL


# ----------------------------------------------------------
# 4. VALORES LÓGICOS
# ----------------------------------------------------------

v <- TRUE
f <- FALSE

# is.logical(x): comprueba si es de tipo lógico
is.logical(v)          # TRUE
is.logical("TRUE")     # FALSE -> es un texto

# as.logical(x): convierte a TRUE o FALSE cuando es posible
as.logical("TRUE")     # TRUE
as.logical("T")        # TRUE
as.logical("")         # NA -> no sabe interpretarlo
as.logical("false")    # FALSE
as.logical("si")       # NA 
as.logical(0)          # FALSE -> el 0 es FALSE
as.logical(5)          # TRUE  -> cualquier otro número es TRUE

# identical(x, y): comprueba si dos objetos son exactamente iguales
identical(5, 5)        # TRUE
identical(5, 5L)       # FALSE -> mismo valor, pero distinto tipo
5 == 5L                # TRUE  -> == solo compara el valor

# xor(x, y): TRUE solo si UNO de los dos es TRUE (no los dos)
xor(TRUE, FALSE)       # TRUE
xor(TRUE, TRUE)        # FALSE
xor(FALSE, FALSE)      # FALSE
xor(FALSE, TRUE)      # TRUE

# Ejemplo práctico: ¿informó la cuenta o la tarjeta, pero no ambas?  1234
tarjeta <- ""
cuenta <- "1234"
xor(tarjeta != "", cuenta != "")   # TRUE
