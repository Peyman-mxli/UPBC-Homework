# Universidad Politécnica de Baja California · UPBC

# Ejercicio Práctico de Estimación 1 — COCOMO II

**Caso:** Migración e Integración de un Sistema de Gestión Hospitalaria  
**Alumno:** Peyman Miandashti  
**Docente:** Héctor Alonso Noriega García  
**Grupo:** ITID 5AFM · 2026-3  
**Fecha de elaboración:** 22 de octubre de 2026  
**Fecha límite:** 24 de octubre de 2026, 11:59 p. m.

## Overview

Estimación académica del esfuerzo, cronograma, dotación y costo de un módulo web hospitalario de **15 KSLOC** en **TypeScript/Node.js**. Se utiliza el modelo **COCOMO II.2000 Post-Architecture**, con cinco factores de escala, diecisiete controladores de costo y comparación entre los escenarios de calendario Nominal y Very Low. No se implementa el sistema médico: se realiza la estimación solicitada.

## Resultados

| Indicador | SCED Nominal | SCED Very Low |
| --- | ---: | ---: |
| Tamaño estimado | 15 KSLOC | 15 KSLOC |
| Esfuerzo | **51.87 PM** | **74.18 PM** |
| Duración | **12.53 meses** | **9.40 meses** |
| Equipo promedio | **4.14 FTE** | **7.90 FTE** |
| Contratación orientativa | **5** | **8** |

La reducción del calendario es de **25 %**, pero el esfuerzo estimado crece **43 %** (**22.30 PM** adicionales), aumentando proporcionalmente el costo laboral si la tarifa por persona-mes no cambia.

## Archivos de la entrega

- [REPORTE_COMPLETO.md](./REPORTE_COMPLETO.md) — enunciado, justificaciones, datos, desarrollo matemático, costos, SCED, conclusiones y referencias.
- [INSTRUCCIONES_CALCULADORA.md](./INSTRUCCIONES_CALCULADORA.md) — campos exactos de la calculadora y recomendaciones para capturas auténticas.
- [calcular_cocomo_ii.py](./calcular_cocomo_ii.py) — implementación reproducible de las fórmulas.
- [test_calcular_cocomo_ii.py](./test_calcular_cocomo_ii.py) — pruebas unitarias para ambas estimaciones.
- [resultados.csv](./resultados.csv) — exportación de cifras para tablas y gráficas.

## Cómo reproducir

Se requiere Python 3.10+; no hay dependencias de terceros.

```powershell
py calcular_cocomo_ii.py
py calcular_cocomo_ii.py --json
py calcular_cocomo_ii.py --tarifa 30000
py -m unittest -v test_calcular_cocomo_ii.py
```

**Importante:** la tarifa de 30,000 es una demostración hipotética, no un dato dado por el docente ni una cotización. Para TDEV el modelo emplea PM sin multiplicador SCED y luego aplica la fracción de calendario correspondiente (Very Low = 0.75).

Las capturas de la calculadora deben provenir de una ejecución real con valores ingresados; la imagen compartida por el alumno inicialmente sólo mostraba el formulario vacío.

## Referencias

- [Herramienta COCOMO II](https://softwarecost.org/tools/COCOMO/)
- [USC COCOMO II Model Definition Manual](https://personal.utdallas.edu/~John.Cole/CoCoMo2.pdf)
- [COCOMO Quick Reference](https://dvwl.github.io/software-effort-estimation-course/references/cocomo-reference.html)

## Autor

Peyman Miandashti · Universidad Politécnica de Baja California, Ingeniería en Tecnologías de la Información e Innovación Digital.
