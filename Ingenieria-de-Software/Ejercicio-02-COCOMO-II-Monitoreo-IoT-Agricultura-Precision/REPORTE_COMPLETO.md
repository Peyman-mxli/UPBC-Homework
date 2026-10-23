# UNIVERSIDAD POLITÉCNICA DE BAJA CALIFORNIA

# Ejercicio Práctico de Estimación 2: Sistema de Monitoreo IoT para Agricultura de Precisión

**Alumno:** Peyman Miandashti  
**Docente:** Héctor Alonso Noriega García  
**Carrera:** Ingeniería en Tecnologías de la Información e Innovación Digital  
**Grupo / ciclo:** ITID 5AFM · 2026-3  
**Fecha de elaboración:** 22 de octubre de 2026  
**Fecha de entrega:** 24 de octubre de 2026, 11:59 p. m.  
**Modelo aplicado:** COCOMO II.2000, Post-Architecture

## 1. Resumen ejecutivo

Se analiza la estimación de un sistema de monitoreo IoT para agricultura de precisión. La startup necesita una plataforma en la nube para recolectar, procesar y analizar en tiempo real datos de sensores instalados en cultivos. La solución utilizará servicios backend en Python y un panel web desarrollado en React. El tamaño estimado es **35 KSLOC = 35,000 líneas de código fuente**. Se comparan el escenario base y una propuesta de capacitación y arquitectura que modifica exactamente dos parámetros: **PEXP/PLEX Low → High** y **RESL Low → High**.

| Indicador | Escenario base | Escenario mejorado |
| --- | ---: | ---: |
| Esfuerzo total | **245.70 PM** | **185.56 PM** |
| Tiempo de desarrollo (TDEV) | **22.37 meses** | **19.81 meses** |
| Equipo promedio (FTE) | **10.98** | **9.37** |
| Equipo a tiempo completo, redondeado | **11 personas** | **10 personas** |

El escenario mejorado representa **60.14 personas-mes de ahorro (24.48%)** y una reducción del cronograma de **2.56 meses (11.45%)**. Son resultados matemáticos con los coeficientes estándar de COCOMO II.2000, no lecturas afirmadas de una sesión web.

## 2. Objetivo, alcance y supuestos

**Objetivo:** configurar COCOMO II con los parámetros entregados por el docente; obtener esfuerzo en PM, tiempo en meses y personal promedio; evaluar las mejoras PEXP y RESL; justificar un posible beneficio económico.

**Alcance técnico:** capturar telemetría IoT, procesamiento de eventos con restricciones de tiempo real, comunicación intermitente en campo, almacenamiento, analítica y visualización en React. Estos detalles contextualizan los factores TIME, PVOL y RESL, pero el ejercicio es de estimación, no de implementación de una aplicación.

**Supuestos declarados:** se consideran nuevas las 35 KSLOC; no se entregaron líneas reutilizadas o modificadas; los 12 controladores de esfuerzo no destacados mantienen valor Nominal = 1.00, como también STOR, TOOL y SCED. No se proporcionó ninguna tarifa laboral ni un presupuesto de capacitación o arquitecto.

## 3. Datos exactos para configurar la calculadora

| Campo | Valor introducido |
| --- | --- |
| Sizing Method | Source Lines of Code |
| New SLOC | **35000** |
| Reused SLOC | **0** |
| Modified SLOC | **0** |
| Maintenance | **Off** |
| Cost per Person-Month | Sin dato; dejar vacío |

La conversión es **35 KSLOC × 1,000 = 35,000 SLOC**. No deben escribirse 35 ni 35,000 en una casilla que ya use KSLOC; en el sitio mostrado en la tarea la casilla es **SLOC**.

## 4. Scale Factors (factores de escala)

| Factor | Escenario base | Puntos base | Escenario mejorado | Puntos mejora |
| --- | --- | ---: | --- | ---: |
| PREC — Precedentedness | Low | 4.96 | Low | 4.96 |
| FLEX — Development Flexibility | Low | 4.05 | Low | 4.05 |
| RESL — Architecture / Risk Resolution | **Low** | **5.65** | **High** | **2.83** |
| TEAM — Team Cohesion | Nominal | 3.29 | Nominal | 3.29 |
| PMAT — Process Maturity | Low | 6.24 | Low | 6.24 |
| **Total ΣSF** | | **24.19** | | **21.37** |

**PREC Low:** es la primera experiencia del equipo con protocolos IoT de comunicación masiva. **FLEX Low:** las normas de comunicación y las regulaciones hacen poco flexible el desarrollo. **RESL Low:** inicialmente existen riesgos no resueltos sobre conectividad intermitente y comportamiento de sensores. **TEAM Nominal:** los integrantes son nuevos y la coordinación es estándar. **PMAT Low:** la startup está desarrollando sus procedimientos de trabajo.

Con la contratación de un arquitecto experto se asume que se realizan decisiones y validaciones concretas que permiten calificar **RESL High**, por ejemplo arquitectura tolerante a desconexiones, protocolos de reintento, almacenamiento temporal, trazabilidad y pruebas con sensores reales. No se cambia ningún otro Scale Factor.

## 5. Cost Drivers (multiplicadores de esfuerzo)

Los cinco controladores señalados en el enunciado se introducen tal como aparecen abajo; el resto queda en Nominal. En el manual COCOMO II.2000, **Platform Experience se abrevia PLEX (antes PEXP)**; el formulario web muestra **Platform Experience**.

| Cost Driver | Base | EM base | Mejora | EM mejora |
| --- | --- | ---: | --- | ---: |
| TIME — Time Constraint | High | 1.11 | High | 1.11 |
| STOR — Storage Constraint | Nominal | 1.00 | Nominal | 1.00 |
| PVOL — Platform Volatility | High | 1.15 | High | 1.15 |
| PEXP/PLEX — Platform Experience | **Low** | **1.09** | **High** | **0.91** |
| TOOL — Use of Software Tools | Nominal | 1.00 | Nominal | 1.00 |

**Otros 12 cost drivers en Nominal (1.00):** RELY, DATA, CPLX, RUSE, DOCU, ACAP, PCAP, PCON, APEX, LTEX, SITE y SCED. El enunciado no autoriza cambiar estas categorías en el escenario mejorado.

**Producto de multiplicadores (EAF) base:** 1.11 × 1.00 × 1.15 × 1.09 × 1.00 = **1.391385**.

**Producto de multiplicadores (EAF) mejorado:** 1.11 × 1.00 × 1.15 × 0.91 × 1.00 = **1.161615**.

## 6. Fórmulas COCOMO II.2000 (Post-Architecture)

**E = 0.91 + (0.01 × ΣSF)** es el exponente de esfuerzo.

**PM = 2.94 × KSLOC^E × Π(EM)** calcula el esfuerzo en personas-mes.

**F = 0.28 + 0.20 × (E − 0.91)** es el exponente del cronograma.

**TDEV = 3.67 × PM^F** expresa el tiempo estimado en meses para **SCED Nominal**.

**Equipo promedio (FTE) = PM / TDEV**. Para una plantilla orientativa de personas completas se redondea hacia arriba; el resultado no exige mantener el mismo personal durante todas las fases.

Las constantes A = 2.94, B = 0.91, C = 3.67 y D = 0.28 corresponden a COCOMO II.2000. Se muestran cuatro a seis decimales en los pasos para evitar acumular errores; solo el resultado final se redondea a dos decimales.

## 7. Desarrollo matemático: escenario base

**Paso 1.** Suma de escala = 4.96 + 4.05 + 5.65 + 3.29 + 6.24 = **24.19**.

**Paso 2.** E = 0.91 + 0.01 × 24.19 = **1.1519**.

**Paso 3.** EAF = 1.11 × 1.15 × 1.09 = **1.391385**.

**Paso 4.** PM = 2.94 × 35^1.1519 × 1.391385 = **245.70 PM**.

**Paso 5.** F = 0.28 + 0.20 × (1.1519 − 0.91) = **0.32838**.

**Paso 6.** TDEV = 3.67 × (245.700832)^0.32838 = **22.37 meses**.

**Paso 7.** Equipo promedio = 245.700832 / 22.368033 = **10.98 FTE**. Redondeando hacia arriba, **11 personas a tiempo completo** para fines de planificación.

## 8. Propuesta de mejora: análisis de sensibilidad

La directiva propone dos actuaciones específicas: (1) capacitar al equipo para que su experiencia de plataforma mejore de **PEXP/PLEX Low (1.09)** a **High (0.91)** y (2) incorporar un arquitecto experto para identificar y mitigar incertidumbres, lo que cambia **RESL Low (5.65)** a **High (2.83)**.

**Paso 1.** Nueva suma de escala = 4.96 + 4.05 + 2.83 + 3.29 + 6.24 = **21.37**.

**Paso 2.** E = 0.91 + 0.01 × 21.37 = **1.1237**.

**Paso 3.** EAF = 1.11 × 1.15 × 0.91 = **1.161615**.

**Paso 4.** PM = 2.94 × 35^1.1237 × 1.161615 = **185.56 PM**.

**Paso 5.** F = 0.28 + 0.20 × (1.1237 − 0.91) = **0.32274**.

**Paso 6.** TDEV = 3.67 × (185.557624)^0.32274 = **19.81 meses**.

**Paso 7.** Equipo promedio = 185.557624 / 19.805915 = **9.37 FTE**, es decir **10 personas** al redondear hacia arriba.

## 9. Tabla comparativa y preguntas respondidas

| Medida | Escenario base | Escenario mejorado | Variación |
| --- | ---: | ---: | ---: |
| ΣSF | 24.19 | 21.37 | −2.82 |
| Exponente E | 1.1519 | 1.1237 | −0.0282 |
| EAF | 1.391385 | 1.161615 | −0.229770 |
| Esfuerzo (PM) | **245.70** | **185.56** | **−60.14 PM** |
| TDEV (meses) | **22.37** | **19.81** | **−2.56 meses** |
| Equipo promedio (FTE) | 10.98 | 9.37 | −1.62 FTE |
| Personas redondeadas | 11 | 10 | −1 persona |

**Pregunta 1. ¿Cuántos meses/persona de esfuerzo se ahorran?**

**Respuesta:** 245.700832 − 185.557624 = **60.143208 PM**, que se presentan como **60.14 personas-mes**. El porcentaje de reducción es (60.143208 / 245.700832) × 100 = **24.48%**.

**Pregunta 2. ¿Cómo cambia el tiempo total de entrega (TDEV)?**

**Respuesta:** el TDEV disminuye de **22.37** a **19.81 meses**, una reducción de **2.56 meses**. La reducción porcentual es (2.562118 / 22.368033) × 100 = **11.45%**. El cronograma se acorta aunque no se cambia SCED, porque se reducen el esfuerzo previsto y el exponente temporal.

**Pregunta 3. ¿Cuántas personas a tiempo completo se necesitan?**

**Respuesta:** el promedio estimado es **10.98 FTE** en la situación base y **9.37 FTE** en la mejorada. Para una recomendación de contratación, representan respectivamente **11** y **10** personas. La composición real depende de las fases, especialidades y dedicación del arquitecto.

## 10. Análisis costo-beneficio: ¿la inversión se paga sola?

**No puede afirmarse para el proyecto real sin conocer los costos.** La tarea no proporciona la tarifa media por persona-mes, el costo de capacitar al equipo, los honorarios del arquitecto ni cuánto tiempo de transición se necesitará. El ahorro de **60.14 PM** permite calcular el punto de equilibrio.

**Ahorro laboral bruto = 60.143208 × C**, donde **C** es el costo promedio por persona-mes.  
**Beneficio neto = Ahorro laboral bruto − inversión incremental real.**  
**Condición para recuperar la inversión: inversión incremental < 60.143208 × C.**

Para mostrar la aplicación práctica, se utiliza un **ejemplo hipotético**: **C = $30,000 MXN por PM** e **inversión extra de $250,000 MXN** en formación y arquitectura. No son precios dados por el docente ni cotizaciones.

| Concepto ilustrativo | Monto (MXN) |
| --- | ---: |
| Costo laboral base: 245.700832 × $30,000 | $7,371,024.97 |
| Costo laboral mejorado: 185.557624 × $30,000 | $5,566,728.73 |
| Ahorro laboral bruto | **$1,804,296.25** |
| Inversión adicional supuesta | **$250,000.00** |
| Beneficio neto hipotético | **$1,554,296.25** |
| ROI simple: beneficio neto / inversión | **621.72%** |

**Pregunta 4. ¿La inversión en capacitación y arquitectura se paga sola?**

**Respuesta:** en este **ejemplo ilustrativo, sí**, porque los $250,000 de inversión estimada serían inferiores al ahorro bruto de $1,804,296.25. No se puede asegurar lo mismo para la startup sin un presupuesto verificable. Si su inversión y costos adicionales superan los ahorros, deja de ser rentable. Debe evitarse contar dos veces el tiempo del arquitecto si ya está incluido en el esfuerzo de desarrollo.

**Pregunta 5. ¿Cuáles son las ventajas de la mejora más allá de los números?**

**Respuesta:** la experiencia y la arquitectura reducen retrabajo, defectos de comunicación, problemas de integración, riesgo por cobertura limitada, pérdida temporal de lecturas, costos de soporte y deuda técnica. No eliminan la exigencia de tiempo real (**TIME High**) ni los cambios frecuentes de APIs/sensores (**PVOL High**). Las mejoras son válidas solo si se consiguen las competencias y la mitigación de riesgos evaluadas por el modelo.

## 11. Procedimiento exacto para reproducir en la calculadora web

1. Abrir **https://softwarecost.org/tools/COCOMO/**.
2. En **Sizing Method** elegir **Source Lines of Code**. Escribir **35000** en **New SLOC**; Reused y Modified permanecen en cero.
3. En **Software Scale Drivers** seleccionar PREC Low; FLEX Low; RESL Low; TEAM Nominal; PMAT Low.
4. En **Software Cost Drivers** seleccionar TIME High, STOR Nominal, PVOL High, Platform Experience Low y TOOL Nominal. Los demás quedan Nominal, incluido Required Development Schedule (SCED).
5. Dejar Maintenance Off; ejecutar **Calculate**; anotar y capturar el escenario base en la herramienta real.
6. Para la mejora cambiar solo **Architecture / Risk Resolution: High** y **Platform Experience: High**; ejecutar de nuevo.
7. Registrar capturas auténticas del segundo escenario. Si la versión web genera pequeñas diferencias de coeficientes o redondeo, usar y documentar sus valores exactos sin alterar los parámetros del enunciado.

## 12. Limitaciones y validación

COCOMO II es una estimación prospectiva, no una garantía contractual. No se informaron tasas salariales, productividad observada, repartición de las 35 KSLOC entre Python y React, costos del hardware o de servicios cloud ni evidencias de condiciones de campo. La cantidad de personal se deduce de un promedio y no es un plan detallado de incorporación. Para la aplicación real se deben evaluar pruebas en conectividad débil, sincronización diferida, tolerancia a fallos, privacidad y escalabilidad de telemetría.

## 13. Conclusión

En el escenario base, COCOMO II.2000 estima **245.70 PM, 22.37 meses y aproximadamente 11 personas a tiempo completo**. Capacitar al personal y contar con una arquitectura mejor resuelta disminuiría las cifras a **185.56 PM, 19.81 meses y aproximadamente 10 personas**. El proyecto podría ahorrar **60.14 PM** y adelantarse **2.56 meses**. La inversión es prometedora, pero su viabilidad financiera real debe confirmarse con costos de capacitación, arquitectura y personal proporcionados por la startup.

## 14. Fuentes de consulta

1. Boehm, B. et al. (2000). **COCOMO II Model Definition Manual**, versión 2.1. https://www.rose-hulman.edu/class/csse/csse372/201410/Homework/CII_modelman2000.pdf
2. Software Cost Estimation. **COCOMO II — Constructive Cost Model**. https://softwarecost.org/tools/COCOMO/
3. Software Effort Estimation Course. **COCOMO Quick Reference**. https://dvwl.github.io/software-effort-estimation-course/references/cocomo-reference.html

**Integridad de evidencias:** el reporte presenta cálculos reproducibles y no adjunta capturas simuladas de ejecuciones web.