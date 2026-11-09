# ==========================================================
#  EJEMPLOS DE OPERADORES
#  Aritméticos, relacionales y lógicos
# ==========================================================
# Consejo: ejecuta el script línea a línea (Ctrl + Enter en RStudio).


# ----------------------------------------------------------
# 1. OPERADORES ARITMÉTICOS
# ----------------------------------------------------------
a <- 17
b <- 5

a + b          # 22   -> suma
a - b          # 12   -> resta
a * b          # 85   -> multiplicación
a / b          # 3.4  -> división (siempre con decimales)
a ^ 2          # 289  -> potencia
a ** 2         # 289  -> otra forma de escribir la potencia
a %% b         # 2    -> resto de la división (17 = 5*3 + 2)
a %/% b        # 3    -> cociente de la división entera

# Comprobación: cociente * divisor + resto = dividendo
(a %/% b) * b + (a %% b)      # 17

# Uso típico de %%: saber si un número es par
10 %% 2        # 0 -> par
7 %% 2         # 1 -> impar

# Orden de prioridad: como en matemáticas (potencia, * y /, + y -)
2 + 3 * 4      # 14
(2 + 3) * 4    # 20 -> los paréntesis cambian el orden
-2 ^ 2         # -4 -> ¡ojo! primero la potencia, luego el signo
(-2) ^ 2       # 4

# Casos especiales
5 / 0          # Inf  -> infinito
-5 / 0         # -Inf
0 / 0          # NaN  -> "Not a Number", resultado indefinido

# Con vectores, la operación se aplica ELEMENTO A ELEMENTO
v <- c(10, 20, 30)
w <- c(1, 2, 3)
v + w          # 11 22 33
v * w          # 10 40 90
v * 2          # 20 40 60 -> el 2 se aplica a cada elemento
v %% 7         # 3 6 2

# Ejemplo práctico: precio con IVA del 21 %
precios <- c(100, 49.99, 15)
precios * 1.21


# ----------------------------------------------------------
# 2. OPERADORES RELACIONALES
# ----------------------------------------------------------
# Comparan valores y devuelven TRUE o FALSE
x <- 8
y <- 12

x == y         # FALSE -> ¿son iguales?
x != y         # TRUE  -> ¿son distintos?
x < y          # TRUE  -> menor que
x <= 8         # TRUE  -> menor o igual que
x > y          # FALSE -> mayor que
y >= 12        # TRUE  -> mayor o igual que

# ¡OJO! = (o <-) asigna un valor; == compara
# x = 5        # asigna 5 a x
# x == 5       # pregunta si x vale 5

# También funcionan con texto (orden alfabético)
"ana" == "ana"         # TRUE
"Ana" == "ana"         # FALSE -> distingue mayúsculas y minúsculas
"casa" < "perro"       # TRUE  -> la c va antes que la p

# Con vectores: comparan elemento a elemento
edades <- c(15, 22, 17, 40, 18)
edades >= 18           # FALSE TRUE FALSE TRUE TRUE
edades[edades >= 18]   # 22 40 18 -> así se filtran datos
sum(edades >= 18)      # 3 -> cuántos son mayores de edad

# Curiosidad: los decimales no siempre son exactos en el ordenador
0.1 + 0.2 == 0.3               # FALSE
0.1 + 0.2                      # parece 0.3, pero internamente no lo es
isTRUE(all.equal(0.1 + 0.2, 0.3))   # TRUE -> forma segura de comparar decimales


# ----------------------------------------------------------
# 3. OPERADORES LÓGICOS
# ----------------------------------------------------------
# Combinan condiciones (valores TRUE / FALSE)

# Tabla de verdad básica
TRUE & TRUE        # TRUE  -> AND: las dos tienen que ser verdad
TRUE & FALSE       # FALSE
TRUE | FALSE       # TRUE  -> OR: basta con que una sea verdad
FALSE | FALSE      # FALSE
!TRUE              # FALSE -> NOT: niega el valor
!FALSE             # TRUE

# Combinar condiciones
edad <- 25
carnet <- TRUE
edad >= 18 & carnet        # TRUE -> mayor de edad Y con carnet
edad < 18 | carnet         # TRUE -> menor de edad O con carnet
!(edad >= 18)              # FALSE

# & y | trabajan ELEMENTO A ELEMENTO con vectores
edades <- c(15, 22, 17, 40, 70)
edades >= 18 & edades < 65     # FALSE TRUE FALSE TRUE FALSE
edades[edades >= 18 & edades < 65]   # 22 40 -> edad laboral
edades[edades < 18 | edades >= 65]   # 15 17 70

# && y || trabajan con UN SOLO valor (TRUE o FALSE)
# Se usan sobre todo en condiciones de if()
edad >= 18 && carnet           # TRUE

# Si se les pasa un vector de más de un elemento, desde R 4.3 dan ERROR
# c(TRUE, FALSE) && TRUE       # Error
# Para vectores hay que usar & y |

# Ventaja de && y ||: si con la primera condición ya saben el resultado,
# no evalúan la segunda (evaluación en cortocircuito)
FALSE && stop("esto no se ejecuta")   # FALSE, sin error
TRUE  || stop("esto no se ejecuta")   # TRUE, sin error

# xor(): TRUE solo si UNA de las dos es verdadera
xor(TRUE, FALSE)       # TRUE
xor(TRUE, TRUE)        # FALSE
xor(FALSE, FALSE)      # FALSE

# any(): TRUE si AL MENOS UNO es verdadero
notas <- c(6, 4, 8, 9, 3)
any(notas < 5)         # TRUE  -> ¿hay algún suspenso?
any(notas == 10)       # FALSE -> ¿hay algún 10?

# all(): TRUE si TODOS son verdaderos
all(notas >= 5)        # FALSE -> ¿han aprobado todos?
all(notas > 0)         # TRUE

# Ejemplo práctico combinando todo
temperaturas <- c(18, 25, 31, 22, 35, 28)
calor <- temperaturas > 30
calor                          # FALSE FALSE TRUE FALSE TRUE FALSE
sum(calor)                     # 2 días de calor
which(calor)                   # días 3 y 5
any(temperaturas > 30)         # TRUE -> ha habido algún día de calor
all(temperaturas > 15)         # TRUE -> todos los días por encima de 15
