# Universidad Politécnica de Baja California

# Ejercicio Práctico de Estimación 1: Migración e Integración de un Sistema de Gestión Hospitalaria

**Alumno:** Peyman Miandashti  
**Docente:** Héctor Alonso Noriega García  
**Grupo / ciclo:** ITID 5AFM · 2026-3  
**Fecha:** 22 de octubre de 2026  
**Fecha límite:** 24 de octubre de 2026, 11:59 p. m.  
**Método:** COCOMO II.2000 (Post-Architecture)

## 1. Resumen ejecutivo

Una clínica privada requiere desarrollar un módulo web en TypeScript/Node.js para gestionar citas médicas, historiales clínicos y facturación electrónica. Se estima un tamaño de **15 KSLOC (15,000 SLOC)**, se evalúan cinco scale drivers y diecisiete cost drivers, y se comparan un plazo normal (SCED Nominal) con uno de lanzamiento acelerado (SCED Very Low).

| Resultado | SCED Nominal | SCED Very Low |
| --- | ---: | ---: |
| Esfuerzo total estimado | **51.87 PM** | **74.18 PM** |
| Tiempo de desarrollo (TDEV) | **12.53 meses** | **9.40 meses** |
| Equipo promedio equivalente | **4.14 FTE** | **7.90 FTE** |
| Contratación orientativa | **5 desarrolladores** | **8 desarrolladores** |

Con SCED Very Low el tiempo nominal se comprime un **25 %**, pero se requieren **43 % más personas-mes**, aproximadamente **22.30 PM** extra.

## 2. Objetivo y contexto

COCOMO II permite expresar de modo paramétrico el esfuerzo de software en **personas-mes (PM)**, el tiempo de calendario en **TDEV** y el tamaño de equipo promedio como el cociente `PM / TDEV`. Un PM es una unidad de esfuerzo y no equivale automáticamente a un mes de calendario.

El ejercicio evalúa una aplicación hospitalaria que debe ser confiable, almacenar datos voluminosos y ejecutar lógica de negocio con alta complejidad. El equipo ha realizado sistemas web, pero no aplicaciones sanitarias similares; sí dispone de flexibilidad parcial, prototipo arquitectónico, dos años de trabajo conjunto y procesos de madurez media.

## 3. Datos para la calculadora

### 3.1 Tamaño

- `Sizing Method`: **Source Lines of Code**.
- `New`: **15000 SLOC** (equivalentes a **15 KSLOC**).
- `Reused`: **0 SLOC**.
- `Modified`: **0 SLOC**.
- `Maintenance`: **Off**.

Se utiliza únicamente código nuevo porque el enunciado no proporciona métricas de código modificado o reutilizado.

### 3.2 Factores de escala

| Factor | Evaluación | Valor | Justificación |
| --- | --- | ---: | --- |
| PREC | Nominal | 3.72 | Existe experiencia web, no sanitaria. |
| FLEX | High | 2.03 | El cliente permite flexibilidad en módulos. |
| RESL | High | 2.83 | Se desarrolló un prototipo de arquitectura. |
| TEAM | High | 2.19 | El equipo trabajó junto dos años. |
| PMAT | Nominal | 4.68 | Procesos de madurez media. |

`ΣSF = 3.72 + 2.03 + 2.83 + 2.19 + 4.68 = 15.45`.

### 3.3 Controladores de costo destacados

| Factor | Calificación | EM | Interpretación |
| --- | --- | ---: | --- |
| RELY | High | 1.10 | Impacto de fallos en expedientes y citas. |
| DATA | High | 1.14 | Repositorios con datos voluminosos. |
| CPLX | High | 1.17 | Complejidad funcional e integración. |
| ACAP | High | 0.85 | Analistas con alta capacidad. |
| PCAP | High | 0.88 | Programadores con alta capacidad. |
| TOOL | High | 0.90 | IDE, CI/CD y herramientas de calidad. |

Se mantienen **Nominal (1.00)** los demás controladores: RUSE, DOCU, TIME, STOR, PVOL, PCON, APEX, PLEX, LTEX, SITE y **SCED** para el caso base.

## 4. Desarrollo matemático paso a paso

### 4.1 Exponente de escala

`E = 0.91 + 0.01 × ΣSF = 0.91 + 0.1545 = 1.0645`.

### 4.2 Factor multiplicador agregado de esfuerzo

`EAF = 1.10 × 1.14 × 1.17 × 0.85 × 0.88 × 0.90 × 1.00^11`

`EAF = 0.987705576`.

### 4.3 Esfuerzo nominal

`PM_NS = A × (KSLOC)^E × EAF`, con `A = 2.94`.

`PM_NS = 2.94 × 15^1.0645 × 0.987705576 = 51.87092363 PM`.

Por redondeo, el esfuerzo estimado es **51.87 personas-mes**.

### 4.4 Exponente y tiempo de desarrollo nominal

`F = D + 0.2 × (E − B)`, con `D = 0.28` y `B = 0.91`.

`F = 0.28 + 0.2 × (1.0645 − 0.91) = 0.3109`.

`TDEV_NS = C × (PM_NS)^F`, con `C = 3.67`.

`TDEV_NS = 3.67 × (51.87092363)^0.3109 = 12.52667846 meses`.

Por redondeo, se estiman **12.53 meses**.

### 4.5 Equipo promedio nominal

`Equipo_NS = PM_NS / TDEV_NS`

`Equipo_NS = 51.87092363 / 12.52667846 = 4.14083620 FTE`.

Un FTE representa una persona equivalente a tiempo completo. Para presupuestar capacidad se redondea hacia arriba a **5 desarrolladores**, aclarando que las asignaciones reales varían por fase.

## 5. Análisis crítico de SCED Very Low

Para el escenario acelerado se cambia solamente **SCED de Nominal a Very Low**. El modelo COCOMO II asigna:

- `SCED esfuerzo = 1.43`: 43 % más PM.
- `SCED calendario = 0.75`: 75 % de la duración nominal, es decir, 25 % de ahorro de tiempo.

La fórmula de duración usa **PM sin SCED**; después aplica el porcentaje de compresión del calendario, para evitar introducir la penalización de esfuerzo dos veces.

`PM_VL = 51.87092363 × 1.43 = 74.17542079 PM`.

`TDEV_VL = 12.52667846 × 0.75 = 9.39500885 meses`.

`Equipo_VL = 74.17542079 / 9.39500885 = 7.89519435 FTE`.

El escenario acelerado demanda **74.18 PM**, **9.40 meses** y **8 desarrolladores** como recomendación orientativa de contratación.

### 5.1 Comparación de efectos

| Medida | Nominal | Very Low | Cambio |
| --- | ---: | ---: | ---: |
| Esfuerzo PM | 51.87 | 74.18 | +22.30 PM (+43 %) |
| Duración meses | 12.53 | 9.40 | −3.13 meses (−25 %) |
| Promedio de FTE | 4.14 | 7.90 | +3.75 FTE aprox. |
| Personal redondeado | 5 | 8 | +3 plazas |

El costo de acelerar no consiste sólo en contratar más personas. Hay un mayor esfuerzo por coordinación, trabajo paralelo, reuniones, conflictos de integración, automatización y corrección de fallas bajo presión. En un sistema clínico, esas presiones afectan procesos delicados como validación de historia clínica, citas, facturación, control de acceso y privacidad de datos. Por ello, reducir plazos no debe implicar eliminar pruebas ni controles de calidad.

### 5.2 Incremento de costo monetario

Si `R` es la tarifa efectiva por persona-mes y se mantiene sin cambios:

- `Costo_nominal = 51.87092363 × R`.
- `Costo_acelerado = 74.17542079 × R`.
- `Incremento = 22.30449716 × R`, equivalente a **43 %** del costo laboral nominal.

**No se facilita una tarifa real en el enunciado.** Como demostración únicamente hipotética, para una tarifa **inventada** de **30,000 MXN/PM**:

| Caso ilustrativo | Nominal | Acelerado |
| --- | ---: | ---: |
| Tarifa supuesta | 30,000 MXN/PM | 30,000 MXN/PM |
| Costo laboral | 1,556,127.71 MXN | 2,225,262.62 MXN |
| Incremento respecto al base | — | 669,134.91 MXN |

Este ejemplo no representa un presupuesto real. No integra de forma independiente infraestructura, licencias, prestaciones, contingencias ni gastos administrativos.

## 6. Paso a paso en la calculadora

1. Abrir https://softwarecost.org/tools/COCOMO/.
2. Seleccionar **Source Lines of Code** e introducir `15000` en **New SLOC**.
3. Elegir PREC Nominal, FLEX High, RESL High, TEAM High y PMAT Nominal.
4. Configurar RELY High, DATA High, CPLX High, ACAP High, PCAP High, TOOL High.
5. Mantener el resto en Nominal, incluido SCED, y Maintenance = Off.
6. Dejar el costo por persona-mes sin completar si no se dispone de la tarifa.
7. Pulsar **Calculate** y registrar PM, TDEV, EAF y tamaño equivalente. Hacer una captura real.
8. Cambiar únicamente SCED a Very Low, volver a pulsar Calculate y obtener otra captura real.

**Límite de evidencia:** la captura de referencia presentada por el estudiante sólo contiene el formulario antes de completarlo, de modo que no se afirma haber verificado los resultados mostrados por el sitio. Los valores expuestos son los del modelo estándar; puede haber diferencias de calibración/redondeo según la implementación del portal.

## 7. Conclusiones

El caso de estudio requiere aproximadamente **51.87 personas-mes** y **12.53 meses** en condiciones nominales, con un promedio de **4.14 FTE** que puede orientar una dotación inicial de **5 desarrolladores**. Cuando el cliente solicita SCED Very Low para entregar antes, el tiempo estimado se reduce a **9.40 meses**, pero el esfuerzo aumenta hasta **74.18 personas-mes**, con un equipo promedio equivalente a **7.90 FTE** y una dotación orientativa de **8 desarrolladores**.

Esta comparación confirma la principal compensación gerencial: **acelerar el calendario puede encarecer considerablemente el esfuerzo**. Se recomienda negociar un cronograma factible por módulos, mantener revisiones de seguridad, realizar pruebas automatizadas, presupuestar los recursos adicionales y actualizar la estimación conforme evolucione el proyecto.

## 8. Referencias

1. USC Center for Software Engineering, *COCOMO II Model Definition Manual*. https://personal.utdallas.edu/~John.Cole/CoCoMo2.pdf
2. Ray Madachy, *COCOMO II - Constructive Cost Model*. https://softwarecost.org/tools/COCOMO/
3. *COCOMO Quick Reference*, Software Effort Estimation Course. https://dvwl.github.io/software-effort-estimation-course/references/cocomo-reference.html