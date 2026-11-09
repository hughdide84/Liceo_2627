# ==========================================================
#  EJEMPLOS DE SELECCIÓN DE ELEMENTOS EN VECTORES
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio)
# y observa el resultado de cada instrucción en la consola.

# Vector de ejemplo: temperaturas máximas de 8 días
x <- c(12, 18, 25, 9, 30, 21, 15, 27)
x
length(x)            # 8 elementos

# Recuerda: en R las posiciones empiezan en 1 (no en 0 como en Python)


# ----------------------------------------------------------
# 1. x[n] -> elemento en la posición n
# ----------------------------------------------------------
x[1]                 # 12 -> primer elemento
x[3]                 # 25
x[length(x)]         # 27 -> último elemento
x[10]                # NA -> la posición no existe


# ----------------------------------------------------------
# 2. x[-n] -> el vector SIN el elemento de la posición n
# ----------------------------------------------------------
x[-1]                # 18 25 9 30 21 15 27 -> sin el primero
x[-3]                # 12 18 9 30 21 15 27 -> sin el tercero
x                    # ¡El vector original NO cambia!
# Para eliminarlo de verdad hay que guardar el resultado:
# x <- x[-3]


# ----------------------------------------------------------
# 3. x[1:n] -> desde la posición 1 hasta la n
# ----------------------------------------------------------
x[1:4]               # 12 18 25 9 -> los 4 primeros


# ----------------------------------------------------------
# 4. x[a:b] -> desde la posición a hasta la b
# ----------------------------------------------------------
x[3:6]               # 25 9 30 21
a <- 2
b <- 5
x[a:b]               # 18 25 9 30
x[6:3]               # 21 30 9 25 -> también funciona al revés


# ----------------------------------------------------------
# 5. x[-(1:n)] -> excluye desde la posición 1 hasta la n
# ----------------------------------------------------------
x[-(1:3)]            # 9 30 21 15 27 -> sin los 3 primeros

# ¡OJO con los paréntesis!
# x[-1:3]            # ERROR: no se pueden mezclar posiciones positivas y negativas


# ----------------------------------------------------------
# 6. x[-(a:b)] -> excluye desde la posición a hasta la b
# ----------------------------------------------------------
x[-(3:6)]            # 12 18 15 27
x[-(a:b)]            # 12 21 15 27


# ----------------------------------------------------------
# 7. x[c(a,b,c)] -> elementos en las posiciones indicadas
# ----------------------------------------------------------
x[c(1, 4, 8)]        # 12 9 27
x[c(8, 1)]           # 27 12 -> respeta el orden que indiquemos
x[c(2, 2, 2)]        # 18 18 18 -> se pueden repetir posiciones
x[-c(1, 4, 8)]       # todos menos esas tres posiciones


# ----------------------------------------------------------
# 8. x[x > a] -> elementos que cumplen una condición
# ----------------------------------------------------------
x > 20               # vector de TRUE/FALSE: se queda con los TRUE
x[x > 20]            # 25 30 21 27
x[x <= 15]           # 12 9 15
x[x == 30]           # 30

# Truco: which() devuelve las POSICIONES que cumplen la condición
which(x > 20)        # 3 5 6 8

# Truco: sum() cuenta cuántos elementos la cumplen (TRUE vale 1)
sum(x > 20)          # 4 días con más de 20 grados


# ----------------------------------------------------------
# 9. x[x > a & x < b] -> varias condiciones a la vez
# ----------------------------------------------------------
x[x > 15 & x < 26]   # 18 25 21 -> mayores que 15 Y menores que 26
x[x < 10 | x > 28]   # 9 30     -> menores que 10 O mayores que 28
# &  -> se tienen que cumplir las dos condiciones (Y)
# |  -> basta con que se cumpla una de ellas (O)


# ----------------------------------------------------------
# 10. x["nombre"] -> selección por nombre
# ----------------------------------------------------------
# Damos un nombre a cada elemento del vector
temp <- c(lunes = 12, martes = 18, miercoles = 25, jueves = 9)
temp
names(temp)                          # "lunes" "martes" "miercoles" "jueves"

temp["martes"]                       # 18
temp[c("lunes", "jueves")]           # 12 9
temp[temp > 15]                      # también funciona con condiciones

# También se pueden asignar nombres a un vector que ya existe
precios <- c(1.5, 0.8, 2.3)

names(precios) <- c("pan", "leche", "cafe")
precios["cafe"]                      # 2.3

# ¡OJO! Escribe siempre las comillas rectas " " desde el teclado.
# Las comillas tipográficas “ ” (las que pegan Word o las diapositivas)
# producen un error en R.


# ----------------------------------------------------------
# 11. Modificar elementos usando la selección
# ----------------------------------------------------------
y <- x                    # trabajamos con una copia
y[2] <- 100               # cambia el segundo elemento
y
y[y > 25] <- 25           # limita a 25 todos los valores mayores
y
