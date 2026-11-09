# ==========================================================
#  EJEMPLOS DE ARRAYS Y LISTAS
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ==========================================================
# 1. ARRAYS
# ==========================================================
# Un array es como una matriz, pero con MÁS de dos dimensiones.
# Imagínalo como varias matrices apiladas (capas).
# Igual que en vectores y matrices, todos los elementos son del mismo tipo.

# ----------------------------------------------------------
# Crear un array: array(datos, dim = c(filas, columnas, capas))
# ----------------------------------------------------------
A <- array(1:24, dim = c(3, 4, 2))
A                        # 2 capas, cada una una matriz de 3 filas x 4 columnas

class(A)                 # "array"
dim(A)                   # 3 4 2
length(A)                # 24 -> total de elementos

# Una matriz es un array de 2 dimensiones
M <- array(1:6, dim = c(2, 3))
class(M)                 # "matrix" "array"


# ----------------------------------------------------------
# Seleccionar elementos: A[fila, columna, capa]
# ----------------------------------------------------------
A[2, 3, 1]               # 8  -> fila 2, columna 3, capa 1
A[2, 3, 2]               # 20 -> la misma posición, en la capa 2
A[, , 1]                 # capa 1 completa (es una matriz)
A[1, , ]                 # fila 1 de todas las capas
A[, 2, ]                 # columna 2 de todas las capas
A[1:2, 1:2, 2]           # sub-bloque de la capa 2


# ----------------------------------------------------------
# Poner nombres a las dimensiones
# ----------------------------------------------------------
# Ejemplo: ventas de 3 productos, en 2 tiendas, durante 2 años
ventas <- array(
  c(120, 80, 45,   100, 90, 60,      # año 2025 (tienda Centro, tienda Norte)
    130, 85, 50,   110, 95, 70),     # año 2026
  dim = c(3, 2, 2),
  dimnames = list(
    producto = c("camisetas", "pantalones", "chaquetas"),
    tienda   = c("Centro", "Norte"),
    anio     = c("2025", "2026")
  )
)
ventas

ventas["camisetas", "Norte", "2026"]   # 110
ventas[, , "2026"]                     # todas las ventas de 2026
ventas["chaquetas", , ]                # chaquetas en todas las tiendas y años


# ----------------------------------------------------------
# Operaciones con arrays
# ----------------------------------------------------------
sum(ventas)                     # total de todas las ventas
sum(ventas[, , "2026"])         # total de 2026
ventas * 1.10                   # subida del 10 % a todos los valores

# apply(): aplica una función sobre una dimensión
apply(ventas, 1, sum)           # total por producto  (dimensión 1)
apply(ventas, 2, sum)           # total por tienda    (dimensión 2)
apply(ventas, 3, sum)           # total por año       (dimensión 3)
apply(ventas, c(1, 3), sum)     # por producto y año


# ==========================================================
# 2. LISTAS
# ==========================================================
# Una lista es un "contenedor" que puede guardar objetos de
# DISTINTO tipo y tamaño: números, textos, vectores, matrices,
# data frames... e incluso otras listas.

# ----------------------------------------------------------
# Crear una lista
# ----------------------------------------------------------
alumno <- list(
  nombre  = "Ana",
  edad    = 21,
  notas   = c(7.5, 8, 6.2),
  becada  = TRUE
)
alumno

class(alumno)            # "list"
length(alumno)           # 4 -> número de componentes
names(alumno)            # "nombre" "edad" "notas" "becada"
str(alumno)              # muy útil para ver la estructura de una lista


# ----------------------------------------------------------
# Acceder a los elementos: [ ], [[ ]] y $
# ----------------------------------------------------------
alumno$nombre            # "Ana"         -> por nombre con $
alumno[["notas"]]        # 7.5 8.0 6.2   -> por nombre con [[ ]]
alumno[[3]]              # 7.5 8.0 6.2   -> por posición con [[ ]]

# ¡IMPORTANTE! Diferencia entre [ ] y [[ ]]
alumno[3]                # devuelve una LISTA que contiene las notas
alumno[[3]]              # devuelve el CONTENIDO: el vector de notas

class(alumno[3])         # "list"
class(alumno[[3]])       # "numeric"

# mean(alumno[3])        # ¡Aviso! no se puede hacer la media de una lista
mean(alumno[[3]])        # 7.233333 -> correcto

# Comparación: [ ] es la caja con el objeto dentro; [[ ]] es el objeto

# Acceder a un elemento dentro de un componente
alumno$notas[2]          # 8 -> segunda nota
alumno[["notas"]][2]     # 8 -> lo mismo

# Seleccionar varios componentes (siempre con [ ])
alumno[c("nombre", "edad")]


# ----------------------------------------------------------
# Modificar, añadir y eliminar componentes
# ----------------------------------------------------------
alumno$edad <- 22                    # modificar
alumno$ciudad <- "Valencia"          # añadir un componente nuevo
alumno[["email"]] <- "ana@correo.es" # otra forma de añadir
names(alumno)

alumno$email <- NULL                 # eliminar un componente
names(alumno)


# ----------------------------------------------------------
# Listas que contienen objetos complejos
# ----------------------------------------------------------
curso <- list(
  nombre     = "Sistemas de Big Data",
  horas      = 120,
  modulos    = c("Fundamentos", "R", "SQL", "NoSQL", "Visualización"),
  calendario = matrix(1:6, nrow = 2),
  alumnos    = data.frame(nombre = c("Ana", "Luis"), nota = c(8.5, 6.0)),
  profesor   = list(nombre = "Hugo", email = "profesor@centro.es")  # lista dentro de lista
)
str(curso)

curso$modulos[3]               # "SQL"
curso$alumnos                  # el data frame completo
curso$alumnos$nota             # una columna del data frame
curso$profesor$nombre          # "Hugo" -> lista anidada
curso[["profesor"]][["nombre"]]   # lo mismo con [[ ]]
