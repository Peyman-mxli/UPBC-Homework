# Universidad Politécnica de Baja California — UPBC

# Ejercicio Práctico de Estimación 2: Sistema de Monitoreo IoT para Agricultura de Precisión

**Alumno:** Peyman Miandashti  
**Docente:** Héctor Alonso Noriega García  
**Grupo:** ITID 5AFM · 2026-3  
**Entrega:** 24 de octubre de 2026, 11:59 p. m.

## Overview

Estimación COCOMO II.2000 Post-Architecture para el sistema IoT de agricultura de precisión de **35 KSLOC**, backend **Python** y panel **React**. La propuesta mejora **RESL** (riesgos de arquitectura) y **PEXP/PLEX** (experiencia con plataforma).

## Resultados

| Indicador | Escenario base | Mejorado | Ahorro |
| --- | ---: | ---: | ---: |
| Esfuerzo total | **245.70 PM** | **185.56 PM** | **60.14 PM (24.48%)** |
| Desarrollo | **22.37 meses** | **19.81 meses** | **2.56 meses (11.45%)** |
| Equipo medio | 10.98 FTE | 9.37 FTE | 1.62 FTE |
| Dotación redondeada | 11 personas | 10 personas | 1 persona |

## Documentación

- [Word completo editable](./Ejercicio_02_COCOMO_II_IoT_Agricultura_Precision_Peyman_Miandashti.docx)
- [Reporte detallado en Markdown](./REPORTE_COMPLETO.md)
- [Instrucciones para calculadora](./INSTRUCCIONES_CALCULADORA.md)
- [Calculadora Python](./calcular_cocomo_ii_iot.py)
- [Pruebas automatizadas](./test_calcular_cocomo_ii_iot.py)
- [Tabla CSV](./resultados.csv)

## Ejecución en Windows

```powershell
py calcular_cocomo_ii_iot.py
py calcular_cocomo_ii_iot.py --json
py calcular_cocomo_ii_iot.py --tarifa 30000 --inversion 250000
py -m unittest -v test_calcular_cocomo_ii_iot.py
```

Sin dependencias externas. Las tarifas de costo de los ejemplos son **suposiciones**, no datos de la startup. La carpeta **no contiene capturas simuladas**; las capturas reales del sitio deben hacerse tras ingresar los parámetros.

## Referencias

COCOMO II.2000, *Model Definition Manual* (Boehm et al., 2000): https://www.rose-hulman.edu/class/csse/csse372/201410/Homework/CII_modelman2000.pdf  
Calculadora: https://softwarecost.org/tools/COCOMO/