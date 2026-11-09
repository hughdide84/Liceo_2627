# ==========================================================
#  EJEMPLOS DE SECUENCIAS
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# 1. Operador :  -> secuencia simple de uno en uno
# ----------------------------------------------------------
1:10           # 1 2 3 4 5 6 7 8 9 10
5:1            # 5 4 3 2 1 -> también hacia atrás
-3:3           # -3 -2 -1 0 1 2 3
1.5:5          # 1.5 2.5 3.5 4.5 -> avanza de 1 en 1 y no supera el 5

# ¡OJO con la prioridad de los operadores!
n <- 5
1:n-1          # 0 1 2 3 4 -> hace (1:5) - 1
1:(n-1)        # 1 2 3 4   -> esto es lo que normalmente queremos


# ----------------------------------------------------------
# 2. seq(from, to, by) -> secuencia con un incremento concreto
# ----------------------------------------------------------
seq(0, 100, by = 10)       # 0 10 20 ... 100
seq(1, 20, by = 2)         # 1 3 5 ... 19 -> números impares
seq(2, 20, by = 2)         # números pares
seq(0, 1, by = 0.25)       # 0.00 0.25 0.50 0.75 1.00
seq(10, 0, by = -2)        # 10 8 6 4 2 0 -> hacia atrás, by negativo
seq(1, 10, by = 4)         # 1 5 9 -> se detiene antes de pasarse del 10


# ----------------------------------------------------------
# 3. seq(from, to, length.out) -> n valores equidistantes
# ----------------------------------------------------------
seq(0, 1, length.out = 5)      # 0.00 0.25 0.50 0.75 1.00
seq(0, 100, length.out = 3)    # 0 50 100
seq(1, 2, length.out = 4)      # 1.000 1.333 1.667 2.000
# Diferencia: con "by" decides el SALTO; con "length.out", CUÁNTOS valores


# ----------------------------------------------------------
# 4. rep(x, times) -> repite el conjunto completo
# ----------------------------------------------------------
rep(0, times = 5)              # 0 0 0 0 0
rep("hola", 3)                 # "hola" "hola" "hola"
rep(c(1, 2, 3), times = 2)     # 1 2 3 1 2 3
rep(c("A", "B"), times = c(3, 2))   # "A" "A" "A" "B" -> veces distintas para cada uno


# ----------------------------------------------------------
# 5. rep(x, each) -> repite cada valor antes de pasar al siguiente
# ----------------------------------------------------------
rep(c(1, 2, 3), each = 2)            # 1 1 2 2 3 3
rep(c("A", "B"), each = 3)           # "A" "A" "A" "B" "B" "B"

# Comparación directa
rep(c("x", "y"), times = 3)          # x y x y x y
rep(c("x", "y"), each = 3)           # x x x y y y
rep(c("x", "y"), times = 2, each = 2)   # x x y y x x y y -> combinados

# length.out: repite hasta alcanzar una longitud
rep(c(1, 2, 3), length.out = 7)      # 1 2 3 1 2 3 1


# ----------------------------------------------------------
# 6. seq_along(x) -> de 1 hasta la longitud de un objeto
# ----------------------------------------------------------
frutas <- c("manzana", "pera", "uva", "kiwi")
seq_along(frutas)              # 1 2 3 4

# Muy útil para recorrer un vector con un bucle
for (i in seq_along(frutas)) {
  cat(i, "-", frutas[i], "\n")
}


# ----------------------------------------------------------
# 7. seq_len(n) -> de 1 hasta n
# ----------------------------------------------------------
seq_len(5)                     # 1 2 3 4 5

# ¿Por qué no usar simplemente 1:n? Por el caso n = 0
n <- 0
1:n                            # 1 0      -> ¡dos elementos! Un bucle se ejecutaría 2 veces
seq_len(n)                     # integer(0) -> vacío, que es lo correcto

vacio <- c()
1:length(vacio)                # 1 0      -> mismo problema
seq_along(vacio)               # integer(0) -> correcto


# ----------------------------------------------------------
# 8. Ejemplos prácticos
# ----------------------------------------------------------

# Crear identificadores
paste0("cliente_", 1:5)        # "cliente_1" ... "cliente_5"

# Fechas: un día cada semana durante dos meses
seq(as.Date("2026-11-02"), as.Date("2026-12-31"), by = "week")

# Fechas: el día 1 de cada mes del año
seq(as.Date("2026-01-01"), by = "month", length.out = 12)

