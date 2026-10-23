# Guía para capturar los datos en COCOMO II

**Actividad:** Ejercicio Práctico de Estimación 1 — Sistema de Gestión Hospitalaria.  
**Sitio:** https://softwarecost.org/tools/COCOMO/

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



## Resultados teóricos esperados

| Parámetro | SCED Nominal | SCED Very Low |
| --- | ---: | ---: |
| Esfuerzo | 51.87 PM | 74.18 PM |
| Calendario | 12.53 meses | 9.40 meses |
| Equipo FTE | 4.14 | 7.90 |
| Personal redondeado | 5 | 8 |

El sitio puede tener diferencias menores por calibración o redondeo. No inventar capturas de ejecución.
