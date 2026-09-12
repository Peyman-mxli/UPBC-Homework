# Trabajo en equipo – Proyecto integrador

## Tema

**Falta de un sistema de registro de entrada y salida de estudiantes en la universidad**

---

## Instrucciones de la actividad

El equipo deberá desarrollar un análisis técnico de una problemática relacionada con la Ingeniería en Tecnologías de la Información e Innovación Digital. Para ello se requiere:

- Identificar un problema técnico relacionado con la ingeniería de la información.
- Analizar el problema mediante una herramienta estructurada, como el **diagrama de Ishikawa** o la técnica de los **5 porqués**.
- Proponer al menos **tres posibles causas** y evaluar su probabilidad e impacto.
- Diseñar una **solución técnica viable** y justificar su implementación.
- Organizar los resultados en una presentación clara, técnica y profesional.
- Entregar nuevamente el documento completo para su revisión y discusión en clase.

---

## 1. Identificación del problema técnico

Actualmente, la universidad no cuenta con un sistema digital centralizado que permita registrar de manera objetiva y automática la **hora de entrada y salida de los estudiantes**.

En muchos casos, el control de asistencia depende de registros manuales realizados dentro del aula. Este método puede generar discrepancias entre profesores y estudiantes cuando se presentan situaciones como retardos, salidas anticipadas, asistencia parcial o diferencias en los criterios utilizados para registrar una falta.

La ausencia de un registro institucional verificable dificulta conocer con precisión el tiempo de permanencia de un estudiante dentro del campus y puede provocar errores administrativos, falta de trazabilidad y conflictos relacionados con la asistencia.

### Problema técnico definido

> La universidad carece de un sistema digital centralizado que registre y permita consultar de forma confiable la entrada, salida y permanencia de los estudiantes en el campus.

---

## 2. Análisis del problema mediante la técnica de los 5 porqués

**Problema inicial:** Existen conflictos entre profesores y estudiantes relacionados con retardos, faltas y tiempos de asistencia.

| Nivel | Pregunta | Respuesta |
| --- | --- | --- |
| 1 | ¿Por qué ocurren conflictos por retardos y faltas? | Porque no siempre existe evidencia objetiva de la hora real de llegada o salida del estudiante. |
| 2 | ¿Por qué no existe evidencia objetiva? | Porque la asistencia se registra principalmente de forma manual o únicamente dentro del salón de clases. |
| 3 | ¿Por qué se utiliza un control manual? | Porque no existe una plataforma institucional centralizada para registrar accesos estudiantiles. |
| 4 | ¿Por qué no existe una plataforma centralizada? | Porque el proceso de control de accesos no ha sido digitalizado ni integrado con los sistemas académicos existentes. |
| 5 | ¿Por qué no se ha digitalizado el proceso? | Porque no se ha desarrollado e implementado una solución tecnológica específica que combine identificación, registro, almacenamiento y consulta de accesos. |

### Causa raíz identificada

La causa principal es la **ausencia de una solución tecnológica institucional que automatice y centralice el registro de acceso de los estudiantes**.

---

## 3. Posibles causas: probabilidad e impacto

| Causa | Probabilidad | Impacto | Justificación |
| --- | :---: | :---: | --- |
| Falta de un sistema digital de registro de accesos | Alta | Alto | Sin una plataforma centralizada no existe una fuente única y verificable de información. |
| Control de asistencia manual y susceptible a errores | Alta | Alto | Los registros manuales pueden contener omisiones, duplicidades o diferencias de interpretación. |
| Diferentes criterios entre profesores para retardos y faltas | Media | Alto | La falta de reglas automatizadas provoca que una misma situación pueda evaluarse de manera diferente. |
| Falta de integración entre accesos físicos y sistemas académicos | Media | Alto | La información de acceso no se vincula directamente con horarios, grupos o reportes institucionales. |

### Matriz de prioridad

Las causas de **alta probabilidad y alto impacto** deben atenderse primero. Por ello, la prioridad principal es implementar un mecanismo digital de registro que reduzca la dependencia de procesos manuales.

---

## 4. Propuesta de solución técnica

Se propone desarrollar un **Sistema Digital de Registro de Accesos Estudiantiles**, disponible como plataforma web y con posibilidad de integrarse a una aplicación móvil institucional.

### Funciones principales

El sistema deberá permitir:

- Registrar automáticamente la **hora de entrada** de cada estudiante.
- Registrar automáticamente la **hora de salida**.
- Calcular el **tiempo total de permanencia** dentro de la universidad.
- Asociar cada registro con:
  - Identificador del estudiante.
  - Nombre completo.
  - Matrícula.
  - Fecha.
  - Hora de entrada.
  - Hora de salida.
  - Tiempo de permanencia.
  - Estatus del registro.
- Consultar historiales de acceso.
- Generar reportes por estudiante, grupo, carrera, fecha o periodo.
- Permitir acceso autorizado a profesores y personal administrativo.

### Métodos de identificación propuestos

El registro podría realizarse mediante una o varias de las siguientes tecnologías:

- Código QR en la credencial universitaria.
- Código QR dinámico desde una aplicación móvil institucional.
- Tecnología NFC integrada a la credencial estudiantil.
- Lectores instalados en puntos estratégicos de acceso.

### Arquitectura tecnológica propuesta

Una implementación inicial podría utilizar:

- **Frontend:** aplicación web responsiva.
- **Backend:** API para procesar registros de acceso.
- **Base de datos:** almacenamiento centralizado de estudiantes y movimientos.
- **Autenticación:** cuentas institucionales y control de roles.
- **Módulo de reportes:** panel para docentes y administración.

---

## 5. Viabilidad de la solución

La solución propuesta es técnicamente viable porque utiliza tecnologías maduras, ampliamente disponibles y de costo relativamente accesible.

### Viabilidad técnica

- Los códigos QR pueden implementarse utilizando cámaras o lectores económicos.
- Las aplicaciones web pueden funcionar en computadoras, tabletas y teléfonos móviles.
- Las bases de datos permiten almacenar grandes cantidades de registros de manera estructurada.
- El sistema puede integrarse progresivamente con los servicios institucionales existentes.

### Viabilidad operativa

- El proceso de registro sería rápido y sencillo para los estudiantes.
- Los profesores tendrían acceso a información más objetiva.
- El personal administrativo podría generar reportes sin depender de listas manuales.
- La implementación podría comenzar como proyecto piloto en un edificio, carrera o grupo antes de ampliarse a toda la universidad.

### Viabilidad económica

Una primera versión puede construirse utilizando software de código abierto y equipos existentes. Esto permite reducir el costo inicial y evaluar el funcionamiento del sistema antes de invertir en dispositivos adicionales como lectores NFC o torniquetes inteligentes.

---

## 6. Beneficios esperados

La implementación del sistema permitiría:

- Reducir errores humanos en el registro de asistencia.
- Disminuir conflictos relacionados con retardos y faltas.
- Contar con información objetiva, verificable y centralizada.
- Mejorar la transparencia entre estudiantes, docentes y administración.
- Facilitar la elaboración de reportes académicos y administrativos.
- Detectar patrones de puntualidad y permanencia.
- Apoyar la toma de decisiones mediante datos reales.
- Incrementar la trazabilidad de los procesos institucionales.
- Fortalecer la cultura de responsabilidad y puntualidad.

---

## 7. Consideraciones de seguridad y privacidad

Debido a que el sistema manejaría información personal y registros de acceso, deberá contemplar desde su diseño:

- Autenticación de usuarios.
- Roles y permisos de acceso.
- Protección de la base de datos.
- Registro de acciones administrativas.
- Respaldo periódico de información.
- Uso responsable de los datos personales.
- Definición de periodos de conservación de registros.

El objetivo del sistema debe ser apoyar procesos académicos y administrativos, evitando usos innecesarios o invasivos de la información.

---

## 8. Organización sugerida para la presentación

1. **Introducción y contexto del problema.**
2. **Definición del problema técnico.**
3. **Análisis mediante los 5 porqués.**
4. **Causas principales y evaluación de impacto.**
5. **Descripción de la solución técnica.**
6. **Arquitectura y tecnologías propuestas.**
7. **Viabilidad técnica, operativa y económica.**
8. **Beneficios esperados.**
9. **Seguridad y privacidad.**
10. **Conclusión.**

---

## 9. Conclusión

La falta de un sistema digital de registro de entrada y salida representa una oportunidad concreta de mejora tecnológica dentro de la universidad. El análisis realizado demuestra que gran parte de los conflictos relacionados con retardos, faltas y permanencia se originan en la ausencia de información centralizada y verificable.

La creación de un **Sistema Digital de Registro de Accesos Estudiantiles** permitiría transformar un proceso manual en uno automatizado, transparente y basado en datos. Además de resolver la problemática inmediata, la solución podría convertirse en una plataforma escalable capaz de integrarse posteriormente con otros servicios institucionales, como control de asistencia, horarios, seguridad, servicios escolares y analítica académica.

Por estas razones, la propuesta es **técnicamente factible, operativamente útil y escalable**, y representa una aplicación directa de las Tecnologías de la Información para resolver una necesidad real dentro del entorno universitario.
