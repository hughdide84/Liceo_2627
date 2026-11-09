# ==========================================================
#  EJEMPLOS BÁSICOS DE FACTORES
# ==========================================================
# Un factor es un vector que guarda datos CATEGÓRICOS:
# variables que solo pueden tomar un conjunto limitado de valores
# (sexo, provincia, nivel de estudios, talla, día de la semana...).
# Cada valor posible se llama NIVEL (level).

# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# 1. Crear un factor a partir de un vector de texto
# ----------------------------------------------------------
colores <- c("rojo", "azul", "rojo", "verde", "azul", "rojo")
colores                  # vector de texto normal

f_colores <- factor(colores)
f_colores                # aparece también la línea "Levels"

class(colores)           # "character"
class(f_colores)         # "factor"


# ----------------------------------------------------------
# 2. Niveles del factor
# ----------------------------------------------------------
levels(f_colores)        # "azul" "rojo" "verde" -> orden alfabético
nlevels(f_colores)       # 3 -> número de niveles distintos
length(f_colores)        # 6 -> número de elementos


# ----------------------------------------------------------
# 3. Contar cuántas veces aparece cada nivel
# ----------------------------------------------------------
table(f_colores)         # azul 2, rojo 3, verde 1
summary(f_colores)       # mismo resultado


# ----------------------------------------------------------
# 4. Indicar los niveles y su orden
# ----------------------------------------------------------
tallas <- c("M", "S", "L", "M", "XL", "S", "M")

f_tallas <- factor(tallas)
levels(f_tallas)         # "L" "M" "S" "XL" -> alfabético, no tiene sentido

f_tallas <- factor(tallas, levels = c("S", "M", "L"))
levels(f_tallas)         # "S" "M" "L" "XL" -> el orden que queremos
table(f_tallas)
table(f_tallas, useNA = "ifany")

# Podemos incluir niveles que todavía no aparecen en los datos
f_tallas2 <- factor(tallas, levels = c("XS", "S", "M", "L", "XL"))
table(f_tallas2)         # XS aparece con 0


# ----------------------------------------------------------
# 5. Factores ordenados (con orden lógico entre niveles)
# ----------------------------------------------------------
satisfaccion <- c("media", "alta", "baja", "alta", "media")

f_satisf <- factor(satisfaccion,
                   levels = c("baja", "media", "alta"),
                   ordered = TRUE)
f_satisf                 # Levels: baja < media < alta

# Al estar ordenado, se puede comparar
f_satisf > "baja"        # TRUE si es media o alta
f_satisf[f_satisf >= "media"]
max(f_satisf)            # "alta"

# Con un factor NO ordenado esta comparación no tiene sentido
# f_colores > "azul"     # devuelve NA con un aviso


# ----------------------------------------------------------
# 6. Valores que no están entre los niveles
# ----------------------------------------------------------
dias <- c("lunes", "martes", "lunes", "domingo")
f_dias <- factor(dias, levels = c("lunes", "martes", "miercoles"))
f_dias                   # "domingo" se convierte en NA


# ----------------------------------------------------------
# 7. Cambiar el nombre de los niveles
# ----------------------------------------------------------
sexo <- c("H", "M", "M", "H", "M")
f_sexo <- factor(sexo)
levels(f_sexo)                       # "H" "M"
levels(f_sexo) <- c("Hombre", "Mujer")
f_sexo

# ----------------------------------------------------------
# 8. Añadir valores a un factor
# ----------------------------------------------------------
f_colores[7] <- "azul"       # funciona: "azul" ya es un nivel
f_colores
f_colores[8] <- "negro"      # aviso: "negro" no es un nivel -> queda NA
f_colores

# Para poder usarlo, primero hay que añadir el nivel
levels(f_colores) <- c(levels(f_colores), "negro")
f_colores[8] <- "negro"
f_colores


# ----------------------------------------------------------
# 9. Eliminar niveles que no se usan
# ----------------------------------------------------------
f_tallas2                    # tiene el nivel XS, pero sin datos
droplevels(f_tallas2)        # elimina los niveles vacíos


# ----------------------------------------------------------
# 10. Convertir un factor
# ----------------------------------------------------------
as.character(f_tallas)       # vuelve a ser texto
as.integer(f_tallas)         # código interno de cada nivel (S=1, M=2...)

# ¡OJO con los factores de números!
notas <- factor(c("7", "5", "10", "7"))
as.numeric(notas)                  # 3 2 1 3 -> ¡son los códigos, no las notas!
as.numeric(as.character(notas))    # 7 5 10 7 -> forma correcta


# ----------------------------------------------------------
# 11. ¿Para qué sirven? Un ejemplo práctico
# ----------------------------------------------------------
# Ventas en distintas provincias
provincia <- factor(c("Valencia", "Madrid", "Valencia", "Sevilla",
                      "Madrid", "Valencia"))
ventas <- c(120, 300, 80, 150, 220, 95)

table(provincia)                   # nº de ventas por provincia
tapply(ventas, provincia, sum)     # importe total por provincia
tapply(ventas, provincia, mean)    # importe medio por provincia
