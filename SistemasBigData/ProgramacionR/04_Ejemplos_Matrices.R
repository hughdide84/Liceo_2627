# ==========================================================
#  EJEMPLOS DE MATRICES
# ==========================================================
# Una matriz es una tabla de datos con filas y columnas en la que
# TODOS los elementos son del mismo tipo (todos números, todos texto...).

# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# 0. Crear una matriz con matrix()
# ----------------------------------------------------------
A <- matrix(1:12, nrow = 3, ncol = 4)
A                        # se rellena por COLUMNAS por defecto

B <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
B                        # byrow = TRUE -> se rellena por FILAS


# ----------------------------------------------------------
# 1. rbind() -> une objetos apilándolos por filas
# ----------------------------------------------------------
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)

M1 <- rbind(x, y, z)
M1                       # cada vector es una FILA (con el nombre del vector)

# Añadir una fila nueva a una matriz existente
nueva <- c(10, 11, 12)
rbind(M1, nueva)

# ----------------------------------------------------------
# 2. cbind() -> une objetos lado a lado por columnas
# ----------------------------------------------------------
M2 <- cbind(x, y, z)
M2                       # cada vector es una COLUMNA

# Añadir una columna nueva
cbind(M2, total = x + y + z)

# Si los vectores no tienen la misma longitud, R recicla y avisa
#cbind(c(1, 2, 3), c(1, 2))


# ----------------------------------------------------------
# 3. dim() -> número de filas y columnas
# ----------------------------------------------------------
dim(A)                   # 3 4 -> 3 filas y 4 columnas
nrow(A)                  # 3
ncol(A)                  # 4


# ----------------------------------------------------------
# 4. A[m,n] -> elemento en la fila m y columna n
# ----------------------------------------------------------
A
A[2, 3]                  # 8 -> fila 2, columna 3
A[3, 4]                  # 12 -> último elemento
# Regla para recordarlo: primero FILA, después COLUMNA -> [fila, columna]


# ----------------------------------------------------------
# 5. A[a:b, c:d] -> sub-bloque de la matriz
# ----------------------------------------------------------
A[1:2, 2:3]              # filas 1 a 2 y columnas 2 a 3 -> matriz 2x2
A[2:3, 1:4]              # filas 2 a 3, todas las columnas


# ----------------------------------------------------------
# 6. A[, c:d] -> todas las filas, solo columnas c a d
# ----------------------------------------------------------
A[, 2:3]                 # dejar vacío antes de la coma = TODAS las filas


# ----------------------------------------------------------
# 7. A[a:b, ] -> filas a a b, todas las columnas
# ----------------------------------------------------------
A[1:2, ]                 # dejar vacío después de la coma = TODAS las columnas


# ----------------------------------------------------------
# 8. A[, c(a,b,c)] -> columnas concretas
# ----------------------------------------------------------
A[, c(1, 4)]             # columnas 1 y 4
A[, c(4, 1)]             # el orden se respeta
A[, -2]                  # todas las columnas menos la 2


# ----------------------------------------------------------
# 11. colSums() y rowSums()
# ----------------------------------------------------------
colSums(A)               # suma de cada columna: 6 15 24 33
rowSums(A)               # suma de cada fila: 22 26 30

# También existen las medias
colMeans(A)
rowMeans(A)


# ----------------------------------------------------------
# 12. Ejemplo práctico: notas de alumnos
# ----------------------------------------------------------
ana   <- c(7, 8, 6)
luis  <- c(5, 7, 6)
marta <- c(9, 6, 8)

notas <- rbind(ana, luis, marta)              # cada alumno es una fila
colnames(notas) <- c("R", "SQL", "Python")    # nombres de las columnas
notas

dim(notas)                 # 3 alumnos y 3 asignaturas
notas["luis", "SQL"]       # 7 -> también se puede seleccionar por nombre
notas[, "R"]               # todas las notas de R
notas["marta", ]           # todas las notas de Marta

rowMeans(notas)            # nota media de cada alumno
colMeans(notas)            # nota media de cada asignatura

# Añadir la media como nueva columna
notas <- cbind(notas, media = round(rowMeans(notas), 2))
notas

# Alumnos con media mayor o igual que 7
notas[notas[, "media"] >= 7, ]
