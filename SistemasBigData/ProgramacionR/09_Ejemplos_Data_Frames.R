# ==========================================================
#  EJEMPLOS DE MARCOS DE DATOS (DATA FRAMES)
# ==========================================================
# Un data frame es una TABLA: cada fila es un registro (una observación)
# y cada columna una variable. A diferencia de la matriz, cada columna
# puede ser de un tipo distinto (texto, números, lógicos, factores...).
# Es la estructura más usada en análisis de datos.

# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# 0. Crear un data frame
# ----------------------------------------------------------
empleados <- data.frame(
  id       = 1:10,
  nombre   = c("Ana", "Luis", "Marta", "Pablo", "Sara",
               "Iván", "Eva", "Jorge", "Lucía", "Raúl"),
  depto    = c("Ventas", "IT", "IT", "RRHH", "Ventas",
               "IT", "Ventas", "RRHH", "IT", "Ventas"),
  edad     = c(34, 28, 45, 39, 25, 31, 52, 29, 36, 41),
  salario  = c(32000, 38000, 52000, 30000, 26000,
               41000, 45000, 28000, 47000, 35000),
  remoto   = c(FALSE, TRUE, TRUE, FALSE, FALSE,
               TRUE, FALSE, FALSE, TRUE, FALSE)
)
empleados

View(empleados)       # Abre el visor de datos de RStudio

# ----------------------------------------------------------
# 1. head() y tail() -> primeras y últimas filas
# ----------------------------------------------------------
head(empleados)          # 6 primeras filas (por defecto)
head(empleados, 3)       # 3 primeras
tail(empleados, 2)       # 2 últimas


# ----------------------------------------------------------
# 2. str() -> estructura y tipo de cada columna
# ----------------------------------------------------------
str(empleados)
# chr = texto, num = número, int = entero, logi = lógico


# ----------------------------------------------------------
# 3. summary() -> resumen descriptivo de cada columna
# ----------------------------------------------------------
summary(empleados)
# Para las columnas numéricas: mínimo, cuartiles, media y máximo
# Para las lógicas: cuántos TRUE y FALSE


# ----------------------------------------------------------
# 4. nrow() y ncol() -> número de filas y columnas
# ----------------------------------------------------------
nrow(empleados)          # 10
ncol(empleados)          # 6
dim(empleados)           # 10 6 -> las dos cosas a la vez


# ----------------------------------------------------------
# 5. colnames() -> ver o cambiar el nombre de las columnas
# ----------------------------------------------------------
colnames(empleados)              # igual que names(empleados)

colnames(empleados)[3] <- "departamento"     # cambiar solo la 3ª
colnames(empleados)


# ----------------------------------------------------------
# 6. rownames() -> ver o cambiar el nombre de las filas
# ----------------------------------------------------------
rownames(empleados)              # "1" "2" ... "10" por defecto

copia <- empleados
rownames(copia) <- copia$nombre  # usar el nombre como etiqueta de fila
head(copia, 3)
copia["Marta", "salario"]        # 52000 -> seleccionar por nombre de fila


# ----------------------------------------------------------
# 7. Acceder a los datos (repaso de selección)
# ----------------------------------------------------------
empleados$salario                # una columna como vector (con $)
empleados[["salario"]]           # lo mismo
empleados[, "salario"]           # lo mismo, con [fila, columna]
empleados[2, ]                   # la fila 2 completa
empleados[2, "nombre"]           # "Luis"
empleados[1:3, c("nombre", "edad")]

# Filtrar filas con una condición
empleados[empleados$salario > 40000, ]
empleados[empleados$departamento == "IT" & empleados$remoto, ]

# Cálculos sobre columnas
mean(empleados$salario)          # salario medio
max(empleados$edad)              # edad máxima
table(empleados$departamento)    # empleados por departamento


# ----------------------------------------------------------
# 8. subset() -> filtrar filas y elegir columnas de forma cómoda
# ----------------------------------------------------------
# No hace falta repetir "empleados$" dentro de la condición
subset(empleados, salario > 40000)
subset(empleados, departamento == "Ventas" & edad < 40)

# Argumento select: qué columnas mostrar
subset(empleados, remoto == TRUE, select = c(nombre, departamento))
subset(empleados, edad >= 40, select = -id)     # todas menos id


# ----------------------------------------------------------
# 9. Añadir columnas: con $ o con cbind()
# ----------------------------------------------------------
# Con cbind(): unir una columna nueva
antiguedad <- c(5, 2, 15, 8, 1, 4, 20, 3, 9, 12)
empleados <- cbind(empleados, antiguedad)
head(empleados, 3)

# Columna calculada a partir de una condición
empleados$senior <- empleados$antiguedad >= 10
head(empleados, 3)


# ----------------------------------------------------------
# 10. rbind() -> añadir filas
# ----------------------------------------------------------
# La fila nueva debe tener LAS MISMAS columnas y con los mismos nombres
nuevo <- data.frame(
  id = 11, nombre = "Nuria", departamento = "IT", edad = 27,
  salario = 36000, remoto = TRUE, salario_mes = round(36000 / 14, 2),
  antiguedad = 0, senior = FALSE
)
empleados <- rbind(empleados, nuevo)
tail(empleados, 3)
nrow(empleados)                  # 11


# ----------------------------------------------------------
# 11. merge() -> combinar data frames por una columna común
# ----------------------------------------------------------
# Tabla con información de cada departamento
departamentos <- data.frame(
  departamento = c("Ventas", "IT", "RRHH", "Marketing"),
  responsable  = c("Carmen", "David", "Elena", "Fran"),
  planta       = c(1, 3, 2, 1)
)
departamentos

# Unimos las dos tablas usando la columna "departamento" como clave
completo <- merge(empleados[, c("nombre", "departamento", "salario")],
                  departamentos, by = "departamento")
completo
# Es la misma idea que un JOIN en SQL

# Por defecto solo se quedan las coincidencias (INNER JOIN): Marketing no aparece
# all = TRUE mantiene todas las filas de ambas tablas (FULL JOIN)
merge(empleados[, c("nombre", "departamento")], departamentos,
      by = "departamento", all = TRUE)

