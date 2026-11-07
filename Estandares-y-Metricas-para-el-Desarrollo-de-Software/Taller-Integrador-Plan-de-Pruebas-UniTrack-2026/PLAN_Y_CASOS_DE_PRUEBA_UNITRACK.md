# TALLER INTEGRADOR: PLAN DE PRUEBAS Y CASOS DE PRUEBA

## Sistema seleccionado: UniTrack — Control de Acceso y Gestión Académica

**Universidad Politécnica de Baja California (UPBC)**  
**Asignatura:** Estándares y Métricas para el Desarrollo de Software  
**Grupo:** ITIID 5AFM 2026-3  
**Docente:** Héctor Alonso Noriega García  
**Actividad:** Taller Integrador: Plan de Pruebas y Casos de Prueba (100 puntos)  
**Entrega límite:** 14 de noviembre de 2026, 23:59 horas  
**Fecha de elaboración:** 7 de noviembre de 2026  
**Identificador:** `MTP-UNITRACK-2026-V1`  
**Versión:** 1.0 — Diseño académico, pendiente de ejecución manual  

**Equipo de tres integrantes (completar antes de entregar):**

1. Peyman Miyandashti — Líder de QA (asignación propuesta).
2. **[Nombre completo del integrante 2]** — Diseñador/a de pruebas (por confirmar).
3. **[Nombre completo del integrante 3]** — Ejecutor/a de pruebas (por confirmar).

> **Nota de integridad académica:** Se elaboró un plan y casos de prueba basados en el código real del repositorio UniTrack. Los resultados esperados son hipótesis verificables, **no resultados observados**. Las ejecuciones manuales y las métricas de salida permanecerán «Pendientes» hasta obtener evidencias verificables. Los ejemplos BajaMarket y el simulador de registro de alumnos de la plataforma didáctica del profesor no se deben interpretar como pruebas ejecutadas sobre UniTrack.

---

## Introducción y sistema bajo prueba (SUT)

UniTrack es una aplicación web de apoyo a instituciones educativas desarrollada con **Python 3.11, Flask, Flask-SQLAlchemy/SQLAlchemy, Jinja2, HTML, CSS y JavaScript**, que maneja perfiles de estudiante, docente, personal administrativo y personal operativo. Incluye registro con códigos de validación, inicio de sesión, control de acceso al campus mediante códigos QR firmados, historial de entradas/salidas, gestión de clases y asistencia, avisos internos, fotografías privadas y paneles de administración. La base de datos puede ser SQLite para desarrollo y PostgreSQL cuando se configura `DATABASE_URL` en despliegues persistentes.

El estudio toma como referencia la rama `main` de `https://github.com/Peyman-mxli/unitrack`, revisión **`443615e552c890235f17e74846ff2771b7cde7fd`**, publicada el **5 de noviembre de 2026 (UTC)**. El material didáctico adjunto por el docente organiza el trabajo en **plan estratégico**, **diseño formal de casos**, **técnicas EP/BVA** y **métricas**; se adopta su encuadre de **ISO/IEC/IEEE 29119-3** como guía documental, sin afirmar una certificación del software.

**Pregunta de calidad:** ¿Las funciones críticas de UniTrack operan según sus requisitos y permisos, preservan la trazabilidad de las entradas y salidas, y cumplen criterios medibles antes de considerarse aptas para producción?

---

# FASE 1. PLAN FORMAL DE PRUEBAS DE SOFTWARE

## 1. Identificador y título

- **Documento:** `MTP-UNITRACK-2026-V1`.
- **Título:** Plan de pruebas funcionales, de integración, carga y usabilidad de la plataforma UniTrack.
- **Sistema bajo prueba:** aplicación UniTrack, rama `main`, commit indicado.
- **Responsable académico:** equipo de tres integrantes, con líder propuesto Peyman Miyandashti.
- **Control de cambios:** versión 1.0, creación del plan y casos de prueba; cambios futuros requieren nueva revisión, fecha, autor y motivo.
- **Objetivo general:** detectar defectos que comprometan autenticación, permisos, control de acceso, asistencia y privacidad; documentar evidencia y aplicar una puerta de salida basada en métricas.

## 2. Alcance (In-Scope y Out-of-Scope)

### 2.1 Funciones incluidas — In-Scope

| Requisito | Funcionalidad observable | Riesgo de falla |
|:---|:---|:---|
| RF-01 | Inicio de sesión por usuario o correo y validación de credenciales | Alto |
| RF-02 | Política de nueva contraseña (15 a 1024 caracteres) | Alto |
| RF-03 | Registro con código por rol, caducidad y un solo uso | Alto |
| RF-04 | Recepción de consultas y reportes públicos con validación | Medio |
| RF-05 | Verificación de credenciales QR firmadas y temporales | Alto |
| RF-06 | Entrada/salida emparejada y prevención de doble lectura | Alto |
| RF-07 | Historial de eventos individuales y contadores | Medio |
| RF-08 | Administración docente de clases y reuniones | Medio |
| RF-09 | Cierre de sesión académica y ausencias | Alto |
| RF-10 | Avisos institucionales por audiencia y confirmación de lectura | Medio |
| RF-11 | Privacidad de fotografías de perfil | Alto |
| RF-12 | Autorización del administrador y activación de cuentas | Alto |

### 2.2 Exclusiones — Out-of-Scope

- Auditoría ofensiva de infraestructura productiva, pruebas de penetración no autorizadas y certificación de seguridad.
- Prueba de torniquetes físicos, lectores especializados, redes institucionales y cámaras reales fuera del laboratorio.
- Recuperación ante desastre, migración de datos reales y durabilidad de la instancia alojada: requieren infraestructura verificable y acuerdos institucionales.
- Aplicaciones móviles nativas, integración con sistemas oficiales de control escolar o nómina y pasarelas de pago (no forman parte del alcance seleccionado).
- Pruebas con cuentas, fotos o historial auténticos de alumnos; solo se usarán identidades ficticias y bases aisladas.
- Traducción exhaustiva de todas las etiquetas visuales; se realiza una comprobación de usabilidad en español, pero no certificación lingüística.

### 2.3 Límites de evaluación

La evidencia del código fuente indica qué comportamientos fueron diseñados; **no asegura** que funcionen en cada entorno de producción. Las pruebas de interfaz y carga se programan en un **ambiente de ensayo** separado. El control de acceso QR puede representar un elemento de seguridad física: no se aprobará operación de puertas reales solo con estos casos.

## 3. Estrategia y tipos de prueba

| Enfoque | Técnica/procedimiento | Aplicación en UniTrack | Evidencia y herramientas propuestas |
|:---|:---|:---|:---|
| Funcionales de caja negra | Partición de equivalencia (EP) | Credenciales válidas/incorrectas, roles, códigos, audiencia de avisos | Resultado real/esperado y capturas redactadas; Chrome/Firefox |
| Funcionales de caja negra | Análisis de valores límite (BVA) | Longitud de contraseñas y mensajes, vigencia de QR, cierre académico | Matriz de valores -1, límite y +1; captura de validación y registro |
| Estados | Transiciones observables | QR nuevo → entrada → salida → credencial cerrada | Línea de eventos y tabla de accesos anonimizados |
| Integración | Recorrido de extremo a extremo | Formulario → Flask → SQLAlchemy → tabla → historial/UI | Capturas y registros ficticios; test client / unittest |
| Regresión | Ejecución automatizada y manual de rutas esenciales | Login, MFA, QR, permisos, avisos, asistencia, privacidad | `python -m unittest discover -s tests -v` y GitHub Actions |
| Carga controlada | 10, 20 y 30 usuarios virtuales en staging (propuesta) | Login y lectura de dashboards **sin mutaciones masivas** | Locust o equivalente libre; p95 ≤ 2 s y error HTTP < 1% como objetivos iniciales |
| Usabilidad | Evaluación guiada por tres usuarios de prueba | Encontrar scanner, entender errores, consultar historial y avisos | Checklist: completar 4 tareas; ≥ 90% de tareas sin ayuda |

**Secuencia de ejecución:** preparar datos → prueba funcional EP/BVA → integración → regresión → carga ligera y usabilidad → reejecución de defectos → cálculo de métricas y decisión. Se aplicará partición por rol y clases de entradas antes que cobertura superficial de pantallas.

**Pruebas en ambiente de producción:** prohibidas en esta actividad, salvo autorización expresa y plan institucional específico.

## 4. Criterios de aceptación, suspensión y salida

**Condiciones obligatorias de salida (todas deben cumplirse simultáneamente):**

1. **0 defectos abiertos** de severidad **Bloqueante o Alta**.
2. **Cobertura funcional de requisitos ≥ 90%**: requisito trazado a por lo menos un caso diseñado y revisado.
3. **Pass Rate ≥ 95%** de las **ejecuciones realizadas** en el último ciclo de regresión, excluyendo solo los casos «No ejecutados» del denominador pero sin confundirlos con aprobados.
4. **100% de casos críticos/Bloqueantes ejecutados y aprobados**; no se acepta liberar sin probar el escáner o las barreras de autorización.
5. Evidencias vinculadas a fecha, versión, ambiente, ejecutor, entradas y salida observada; incidencias reproducibles registradas.
6. Sin deterioro grave de privacidad: ninguna fotografía de otro usuario ni datos de cuentas de prueba deben quedar públicos.

**Suspensión:** detener un módulo por defecto Bloqueante, corrupción de datos, exposición de información o indisponibilidad del entorno de ensayo. **Reanudación:** registrar corrección, preparar nuevamente ambiente, repetir prueba fallida y las regresiones vinculadas. **Excepciones:** una desviación de carga o usabilidad impide la aprobación global si su riesgo es Alta; las metas adicionales solo pueden modificarse mediante revisión documentada del plan.

**Importante:** que GitHub Actions haya finalizado con éxito no equivale por sí solo a aprobar los tres umbrales anteriores ni valida producción.

## 5. Entorno y recursos (Test Bed)

| Elemento | Configuración prevista / criterio |
|:---|:---|
| Sistema operativo | Windows 11 (estación principal) y runner Linux de CI; la combinación exacta se anotará al ejecutar |
| Backend | Python 3.11, Flask 3.1.3, Werkzeug y dependencias de `requirements.txt` fijadas por la revisión |
| Base de datos de ensayo | SQLite temporal con datos ficticios; PostgreSQL temporal solo si se dispone de staging aislado y acceso autorizado |
| UI | Navegadores Chrome y Firefox de escritorio, viewport responsivo; cámara compatible o imagen QR de prueba |
| Herramientas sin costo | `unittest`, GitHub Actions, Python, navegador/DevTools, curl/Postman gratuito, Locust opcional |
| Evidencias | Registro de ejecución en CSV, capturas con datos sensibles ocultos, hash del commit y marca de tiempo |
| Datos de entrada | Usuarios QA con roles distintos, códigos por rol, QR recientes/vencidos, clases y mensajes totalmente ficticios |
| Seguridad | `UNITRACK_ENV=development`, token CSRF válido, clave de ensayo separada, cuenta admin de prueba, fotos sintéticas |
| Aislamiento | Nunca reutilizar `unitrack.db` real, credenciales de Gmail, llaves de Render ni fotos institucionales |

**Precondiciones de ambiente:** servicio Flask y BD iniciados, cuentas y autorizaciones confirmadas, reloj coherente con `America/Tijuana`, respaldos de ensayo, inventario de navegadores y disponibilidad del canal para evidencias.

**Referencia de automatización existente:** en la revisión `443615e`, los flujos GitHub Actions «UniTrack tests» y «UniTrack security audit» figuran como **success**; no se asigna resultado manual «PASSED» a ninguno de los 17 casos de esta entrega por esa razón.

## 6. Cronograma, responsables y RACI

Los roles son **propuestos**, pendientes de confirmar cuando el equipo de tres integrantes esté completo. **R** realiza; **A** aprueba/responde; **C** consulta; **I** informado.

| Actividad / entregable | Fecha límite | Líder QA (Peyman) | Diseñador (Integrante 2) | Tester (Integrante 3) |
|:---|:---|:---:|:---:|:---:|
| Selección SUT, requisitos, alcance | 7 nov 2026 | A/R | C | I |
| Matriz de trazabilidad y riesgos | 8 nov 2026 | A | R | C |
| Diseño EP/BVA y revisión de casos | 9 nov 2026 | A | R | C |
| Montaje de test bed y datos ficticios | 10 nov 2026 | A | C | R |
| Ejecución funcional e integración | 11-12 nov 2026 | A | C | R |
| Regresión, defectos y cálculo de métricas | 13 nov 2026 | A | C | R |
| Revisión final y envío al docente | 14 nov 2026 | A/R | C | I |

### 6.1 Riesgos y mitigación

| Riesgo | Impacto | Probabilidad | Mitigación |
|:---|:---:|:---:|:---|
| Acceso QR no refleja entradas/salidas de forma independiente | Alto | Media | Casos TC-009/011, bitácoras y pruebas de lectura en vivo |
| Sesiones/códigos obsoletos con exposición de acceso | Alto | Media | TC-004/007/008/010; no usar QR de producción |
| Reloj local y servidor desalineados | Alto | Media | Fijar zona America/Tijuana y usar reloj de prueba determinista |
| Pérdida de datos en alojamiento temporal | Alto | Media | DB aislada persistente y respaldo; no usar alumnos reales |
| Pérdida de datos privados de fotos y cuentas | Alto | Baja/Media | TC-016, archivos sintéticos y acceso por propietario |
| Ausencia de miembros del equipo o del entorno de ejecución | Medio | Media | Roles RACI provisionales, evidencia pendiente, no inventar resultados |

## 7. Productos de trabajo y trazabilidad

Se generarán: plan controlado por versión, catálogo de requisitos `RF-01..12`, matriz de casos `TC-UT-001..017`, bitácora de ejecución por combinación de datos, reporte de defectos con prioridad y evidencia, reporte de cobertura/regresión y aprobación final firmada. No registrar un estado «PASSED» sin prueba real documentada.

---

# FASE 2. DISEÑO DE MATRIZ DE CASOS DE PRUEBA

## 8. Técnicas formales de caja negra

**EP — Partición de Equivalencia:** dividir los datos en clases que deberían provocar la misma decisión (por ejemplo: código de registro válido, usado, vencido o de rol incorrecto). Se eligen representantes para cada clase válida e inválida.

**BVA — Análisis de Valores Límite:** evaluar inmediatamente por debajo, sobre y por encima de las fronteras del dominio; por ejemplo, 14/15/16 caracteres o 9/10/11 de longitud. Las variaciones de un mismo caso se ejecutan y registran **como iteraciones diferentes**; ninguna iteración se declara aprobada por anticipado.

**Estado de diseño:** los siguientes **17 casos** están completamente especificados; todos constan como **«Diseñado — No ejecutado manualmente»** a la fecha de esta entrega documental.

## 9. Matriz de resumen de casos

| ID Caso | Módulo / título | Técnica | Requisito | Prioridad | Estado actual |
|:---|:---|:---:|:---:|:---:|:---|
| TC-UT-001 | Inicio de sesión: clases válidas e inválidas | EP | RF-01 | Alta | No ejecutado |
| TC-UT-002 | Contraseña nueva: límite inferior de 15 caracteres | BVA | RF-02 | Alta | No ejecutado |
| TC-UT-003 | Contraseña nueva: límite superior de 1024 caracteres | BVA | RF-02 | Media | No ejecutado |
| TC-UT-004 | Código de validación de registro: particiones de autorización | EP | RF-03 | Alta | No ejecutado |
| TC-UT-005 | Formulario de contacto: límites del texto del mensaje | BVA | RF-04 | Media | No ejecutado |
| TC-UT-006 | Contacto: particiones de correo y categoría | EP | RF-04 | Media | No ejecutado |
| TC-UT-007 | Escáner QR: credencial válida, manipulada o no firmada | EP | RF-05 | Bloqueante | No ejecutado |
| TC-UT-008 | QR nuevo: frontera de vigencia inicial de cinco minutos | BVA | RF-05 | Alta | No ejecutado |
| TC-UT-009 | Par de escaneos QR: entrada, salida y doble lectura | EP + estados | RF-06 | Bloqueante | No ejecutado |
| TC-UT-010 | Salida vinculada: límite de 24 horas | BVA | RF-06 | Alta | No ejecutado |
| TC-UT-011 | Historial: cada entrada y salida se ve como evento separado | EP + estados | RF-07 | Alta | No ejecutado |
| TC-UT-012 | Clases: acceso de docente y rechazo de estudiante | EP | RF-08 | Alta | No ejecutado |
| TC-UT-013 | Reunión académica: particiones de fecha local y rango | EP + BVA | RF-08 | Alta | No ejecutado |
| TC-UT-014 | Cierre de asistencia: frontera del fin de clase | BVA | RF-09 | Alta | No ejecutado |
| TC-UT-015 | Avisos institucionales: audiencia y lectura | EP | RF-10 | Media | No ejecutado |
| TC-UT-016 | Foto de perfil: acceso privado por propietario | EP | RF-11 | Alta | No ejecutado |
| TC-UT-017 | Panel administrativo y baja lógica: autorización | EP | RF-12 | Alta | No ejecutado |

## 10. Casos de prueba completos (formato profesional)

### TC-UT-001 — Inicio de sesión: clases válidas e inválidas

- **Módulo / requisito:** RF-01.
- **Técnica:** EP.
- **Prioridad:** Alta.
- **Precondiciones:** Cuentas de prueba activas, una contraseña conocida y sesión cerrada; navegador en /auth/login-page.
- **Pasos de ejecución:** 1) Abrir inicio de sesión. 2) Introducir usuario y contraseña de la fila de datos. 3) Enviar. 4) Comprobar la respuesta y la sesión.
- **Datos de entrada (test data):** A: usuario existente + contraseña correcta. B: existente + incorrecta. C: usuario inexistente + cualquiera. D: mismo usuario con mayúsculas/minúsculas distintas + correcta.
- **Resultado esperado:** A y D autentican y redirigen al área del rol. B y C rechazan el acceso sin iniciar sesión ni revelar si la cuenta existe. No se almacenan contraseñas en evidencia.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-002 — Contraseña nueva: límite inferior de 15 caracteres

- **Módulo / requisito:** RF-02.
- **Técnica:** BVA.
- **Prioridad:** Alta.
- **Precondiciones:** Formulario de registro o cambio de contraseña habilitado; resto de campos válidos y código de validación vigente cuando aplique.
- **Pasos de ejecución:** 1) Preparar un usuario diferente por iteración. 2) Capturar una contraseña de longitud indicada. 3) Enviar. 4) Verificar persistencia o rechazo.
- **Datos de entrada (test data):** A: 14 caracteres. B: 15 caracteres. C: 16 caracteres. Generador: 'P7!x' + 'm' repetida (longitud - 4) veces; utilizar usuarios que no coincidan con la cadena.
- **Resultado esperado:** A rechazada con regla mínima de 15 caracteres; B y C aceptadas si el resto de los datos es válido y la clave no es predecible.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-003 — Contraseña nueva: límite superior de 1024 caracteres

- **Módulo / requisito:** RF-02.
- **Técnica:** BVA.
- **Prioridad:** Media.
- **Precondiciones:** Cuentas de ensayo independientes, formulario de cambio de contraseña y sesiones autorizadas.
- **Pasos de ejecución:** 1) Generar valores controlados. 2) Intentar establecer la nueva contraseña. 3) Comparar respuesta y estado de credenciales.
- **Datos de entrada (test data):** A: 1023 caracteres. B: 1024 caracteres. C: 1025 caracteres. Generador: 'P7!x' + 'm' repetida (longitud - 4) veces.
- **Resultado esperado:** A y B cumplen rango permitido; C es rechazada por superar 1024. Si HTML restringe la captura, verificar también el control servidor mediante cliente HTTP de pruebas.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-004 — Código de validación de registro: particiones de autorización

- **Módulo / requisito:** RF-03.
- **Técnica:** EP.
- **Prioridad:** Alta.
- **Precondiciones:** Administrador generó códigos de ensayo para rol estudiante; existen códigos vigentes, vencidos, usados y revocados.
- **Pasos de ejecución:** 1) Abrir registro. 2) Completar datos ficticios válidos. 3) Suministrar código de cada partición. 4) Comprobar creación de cuenta y estado del código.
- **Datos de entrada (test data):** A: válido no usado para estudiante. B: válido para docente al registrarse como estudiante. C: ya usado. D: vencido. E: revocado. F: código inexistente.
- **Resultado esperado:** Solo A permite registrar una cuenta y consume el código exactamente una vez. B-F se rechazan sin crear cuenta ni consumir indebidamente un código válido.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-005 — Formulario de contacto: límites del texto del mensaje

- **Módulo / requisito:** RF-04.
- **Técnica:** BVA.
- **Prioridad:** Media.
- **Precondiciones:** Landing pública disponible y CSRF válido; nombre, correo y categoría correctos; almacenamiento de ensayo vacío o identificado.
- **Pasos de ejecución:** 1) Abrir /#contacto. 2) Introducir datos válidos y un mensaje de longitud controlada. 3) Enviar por cada valor. 4) Revisar bandeja administrativa.
- **Datos de entrada (test data):** A: 'M' × 9. B: 'M' × 10. C: 'M' × 11. D: 'M' × 2999. E: 'M' × 3000. F: 'M' × 3001.
- **Resultado esperado:** B-E se guardan; A y F se rechazan con validación. Cada mensaje aceptado crea un registro, sin exponer los datos al público.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-006 — Contacto: particiones de correo y categoría

- **Módulo / requisito:** RF-04.
- **Técnica:** EP.
- **Prioridad:** Media.
- **Precondiciones:** Formulario público con token CSRF y cuerpo de 10-3000 caracteres.
- **Pasos de ejecución:** 1) Capturar combinaciones indicadas. 2) Enviar. 3) Verificar respuesta y tabla contact_messages.
- **Datos de entrada (test data):** A: qa@example.test + categoria 'consulta'. B: 'correo-sin-arroba' + consulta. C: qa@example.test + categoria 'desconocida'. D: qa@example.test + categoria 'error'.
- **Resultado esperado:** A y D aceptadas; B rechazada por correo inválido; C por categoría no permitida. Categorías permitidas: consulta, soporte, error y sugerencia.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-007 — Escáner QR: credencial válida, manipulada o no firmada

- **Módulo / requisito:** RF-05.
- **Técnica:** EP.
- **Prioridad:** Bloqueante.
- **Precondiciones:** Operador autorizado autenticado; cuenta de prueba activa; generador QR y cámara o campo manual disponibles.
- **Pasos de ejecución:** 1) Emitir QR temporal para un usuario. 2) Escanear con operador. 3) En escenarios separados intentar token alterado y matrícula permanente. 4) Revisar bitácora.
- **Datos de entrada (test data):** A: token firmado vigente recién generado. B: token firmado con 1 carácter modificado. C: ID permanente UT-UPBC-0001. D: código temporal no registrado.
- **Resultado esperado:** Solo A puede producir un evento válido según el estado actual; B-D se rechazan. Los IDs permanentes no autorizan el acceso con configuración segura.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-008 — QR nuevo: frontera de vigencia inicial de cinco minutos

- **Módulo / requisito:** RF-05.
- **Técnica:** BVA.
- **Prioridad:** Alta.
- **Precondiciones:** Tres credenciales nuevas no utilizadas y reloj de pruebas controlable; operador autorizado.
- **Pasos de ejecución:** 1) Emitir una credencial nueva. 2) Ajustar momento de primer uso al valor de prueba. 3) Escanear una sola vez. 4) Verificar cambio en acceso y token.
- **Datos de entrada (test data):** A: primer uso 299 segundos desde emisión. B: 300 segundos. C: 301 segundos. Usar reloj simulado con precisión de segundos y margen controlado.
- **Resultado esperado:** A aceptada; B aceptada en el límite inclusivo si el control temporal no introduce retraso; C rechazada por vencimiento. Documentar precisión del reloj en la evidencia.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-009 — Par de escaneos QR: entrada, salida y doble lectura

- **Módulo / requisito:** RF-06.
- **Técnica:** EP + estados.
- **Prioridad:** Bloqueante.
- **Precondiciones:** Operador autenticado; usuario fuera del campus; QR nuevo; sin visita abierta.
- **Pasos de ejecución:** 1) Primer escaneo. 2) Repetir inmediatamente (menos de 2 s). 3) Re-presentar intencionalmente pasado el intervalo preventivo. 4) Reintentar por tercera vez.
- **Datos de entrada (test data):** A: 1er escaneo. B: repetición a 1 segundo. C: repetición a 3 segundos. D: 3er escaneo del mismo QR.
- **Resultado esperado:** A registra entrada. B no revierte entrada y devuelve conflicto preventivo. C registra salida de la misma visita. D no registra nueva visita: credencial ya cerrada.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-010 — Salida vinculada: límite de 24 horas

- **Módulo / requisito:** RF-06.
- **Técnica:** BVA.
- **Prioridad:** Alta.
- **Precondiciones:** Tres visitas de prueba abiertas y cada una vinculada a su propio QR ya utilizado para entrada.
- **Pasos de ejecución:** 1) Preparar visita abierta con emisión controlada. 2) Intentar salida con el mismo QR a tiempo indicado. 3) Inspeccionar estado y bitácora.
- **Datos de entrada (test data):** A: 86 399 s desde emisión. B: 86 400 s. C: 86 401 s. Mantener el intervalo preventivo de 2 s superado.
- **Resultado esperado:** A permite salida; B se acepta en el límite inclusivo bajo reloj determinista; C se rechaza por superar 24 horas. Nunca cerrar una visita distinta.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-011 — Historial: cada entrada y salida se ve como evento separado

- **Módulo / requisito:** RF-07.
- **Técnica:** EP + estados.
- **Prioridad:** Alta.
- **Precondiciones:** Usuario de prueba sin visitas; operador autorizado; acceso al historial personal y global.
- **Pasos de ejecución:** 1) Realizar dos ciclos de entrada/salida con QR diferentes. 2) Abrir historial. 3) Comparar eventos y contadores. 4) Recargar y consultar historial en vivo.
- **Datos de entrada (test data):** Secuencia: entrada 1, salida 1, entrada 2, salida 2 (4 acciones); dos credenciales distintas y el mismo usuario.
- **Resultado esperado:** Dos registros de visitas completas en access_logs; cuatro eventos visibles en el historial, con 2 entradas, 2 salidas y total 4. Fechas y horas ordenadas; sin fusionar acciones.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-012 — Clases: acceso de docente y rechazo de estudiante

- **Módulo / requisito:** RF-08.
- **Técnica:** EP.
- **Prioridad:** Alta.
- **Precondiciones:** Docente y estudiante activos; asignación de roles correcta; sesión independiente por perfil.
- **Pasos de ejecución:** 1) Con docente crear clase con código nuevo y título. 2) Revisar lista. 3) Intentar consultar o crear clases como estudiante.
- **Datos de entrada (test data):** A: docente, codigo QA-5AFM-01, materia Calidad de Software, salón 2. B: estudiante con los mismos campos.
- **Resultado esperado:** A crea y lista la clase bajo el docente. B recibe acceso denegado y no crea clases.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-013 — Reunión académica: particiones de fecha local y rango

- **Módulo / requisito:** RF-08.
- **Técnica:** EP + BVA.
- **Prioridad:** Alta.
- **Precondiciones:** Clase de prueba creada; docente responsable autenticado.
- **Pasos de ejecución:** 1) Abrir programación de sesión. 2) Introducir inicio/fin por partición. 3) Guardar. 4) Revisar tabla de reuniones.
- **Datos de entrada (test data):** A: 2026-11-11T10:00 a 2026-11-11T11:00. B: mismo inicio y fin. C: inicio 11:00 y fin 10:00. D: 2026-11-11T10:00:00-08:00 a 11:00:00-08:00.
- **Resultado esperado:** A aceptada. B y C rechazadas porque fin no es posterior al inicio. D rechazada por incluir desplazamiento horario: se requieren horas locales de campus sin offset.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-014 — Cierre de asistencia: frontera del fin de clase

- **Módulo / requisito:** RF-09.
- **Técnica:** BVA.
- **Prioridad:** Alta.
- **Precondiciones:** Sesión QA de 10:00-11:00, dos estudiantes inscritos antes de iniciarla; uno marcado presente y otro sin marca; reloj controlado.
- **Pasos de ejecución:** 1) Intentar finalizar a 10:59:59. 2) Confirmar que continúa abierta. 3) En escenario independiente finalizar a 11:00:00. 4) Revisar informe del alumno no marcado.
- **Datos de entrada (test data):** A: hora actual 10:59:59. B: hora actual 11:00:00. Estado inicial: 1 Present, 1 sin marca.
- **Resultado esperado:** A bloquea cierre y no genera falta. B permite finalizar y materializa Absent para alumno sin marca; preserva Present del alumno marcado.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-015 — Avisos institucionales: audiencia y lectura

- **Módulo / requisito:** RF-10.
- **Técnica:** EP.
- **Prioridad:** Media.
- **Precondiciones:** Administrador y cuentas de prueba estudiante, docente y personal activas.
- **Pasos de ejecución:** 1) Publicar aviso exclusivo para docente. 2) Consultar cada buzón. 3) Marcar leído como docente. 4) Consultar contadores y probar acceso indebido.
- **Datos de entrada (test data):** A: audiencia docente. B: audiencia all. C: intento estudiante de leer ID del aviso solo docente.
- **Resultado esperado:** A solo visible a docentes; B visible a estudiante, docente y personal; lectura afecta al receptor autorizado, no a otros; C no obtiene el aviso.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-016 — Foto de perfil: acceso privado por propietario

- **Módulo / requisito:** RF-11.
- **Técnica:** EP.
- **Prioridad:** Alta.
- **Precondiciones:** Dos usuarios ficticios A y B con fotos válidas distintas; perfiles configurados.
- **Pasos de ejecución:** 1) Iniciar sesión como A y abrir /account/profile-photo. 2) Cerrar sesión y repetir. 3) Iniciar como B y abrir su foto. 4) Intentar acceder a ruta pública legacy de archivos.
- **Datos de entrada (test data):** A: sesión A y foto A. B: sin sesión. C: sesión B. D: /static/uploads/profile_photos/archivo.jpg.
- **Resultado esperado:** A y C recuperan solo su foto; B no obtiene foto privada; D es bloqueado, sin enumerar fotografías privadas por nombre.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

### TC-UT-017 — Panel administrativo y baja lógica: autorización

- **Módulo / requisito:** RF-12.
- **Técnica:** EP.
- **Prioridad:** Alta.
- **Precondiciones:** Administrador con MFA verificado; usuario estudiante activo; otro usuario sin privilegios.
- **Pasos de ejecución:** 1) Acceder a /admin/users como administrador. 2) Intentarlo como estudiante. 3) Desactivar usuario de prueba desde admin. 4) Verificar autenticación del desactivado. 5) Reactivar.
- **Datos de entrada (test data):** A: sesión admin válida. B: sesión estudiante. C: cuenta estudiante inactiva. D: cuenta reactivada.
- **Resultado esperado:** A permite administración; B deniega acceso; C no logra iniciar sesión y deja de contar como activa; D recupera acceso con credenciales correctas.
- **Resultado real / estado:** *Pendiente de ejecutar y documentar*.
- **Evidencia requerida:** captura o respuesta HTTP anonimizada, marca de tiempo, commit evaluado e identificador de datos ficticios.

## 11. Matriz de rastreabilidad requisito → caso

| Requisito | Descripción | Casos que lo cubren | ¿Diseñado? | ¿Validado por ejecución? |
|:---|:---|:---|:---:|:---:|
| RF-01 | Inicio de sesión por usuario o correo y validación de credenciales | TC-UT-001 | Sí | Pendiente |
| RF-02 | Política de nueva contraseña (15 a 1024 caracteres) | TC-UT-002, TC-UT-003 | Sí | Pendiente |
| RF-03 | Registro con código por rol, caducidad y un solo uso | TC-UT-004 | Sí | Pendiente |
| RF-04 | Recepción de consultas y reportes públicos con validación | TC-UT-005, TC-UT-006 | Sí | Pendiente |
| RF-05 | Verificación de credenciales QR firmadas y temporales | TC-UT-007, TC-UT-008 | Sí | Pendiente |
| RF-06 | Entrada/salida emparejada y prevención de doble lectura | TC-UT-009, TC-UT-010 | Sí | Pendiente |
| RF-07 | Historial de eventos individuales y contadores | TC-UT-011 | Sí | Pendiente |
| RF-08 | Administración docente de clases y reuniones | TC-UT-012, TC-UT-013 | Sí | Pendiente |
| RF-09 | Cierre de sesión académica y ausencias | TC-UT-014 | Sí | Pendiente |
| RF-10 | Avisos institucionales por audiencia y confirmación de lectura | TC-UT-015 | Sí | Pendiente |
| RF-11 | Privacidad de fotografías de perfil | TC-UT-016 | Sí | Pendiente |
| RF-12 | Autorización del administrador y activación de cuentas | TC-UT-017 | Sí | Pendiente |

**Cobertura de diseño de requisitos:** 12 requisitos de 12 están enlazados con al menos un caso: **12/12 × 100 = 100% (diseño)**. Este resultado **no** equivale a cobertura **comprobada por ejecución**. No se ha calculado cobertura de código; es una métrica distinta.

---

# FASE 3. CRITERIOS DE ACEPTACIÓN Y MÉTRICAS DE ÉXITO

## 12. Reglas para considerar un despliegue

| Indicador obligatorio | Fórmula | Umbral de aceptación | Estado del taller |
|:---|:---|:---|:---|
| Defectos críticos abiertos | Conteo de defectos Bloqueantes y Altos sin cerrar | **0** | **No determinado**: requiere registro de defectos y ejecución |
| Cobertura de requisitos funcionales | (RF con al menos un caso mapeado ÷ RF incluidos) × 100 | **≥ 90%** | **100% de diseño (12/12)**; no confirmada por resultados |
| Tasa de aprobación (última regresión) | (Ejecuciones PASSED ÷ [PASSED + FAILED]) × 100 | **≥ 95%** | **No calculable** sin ejecutar regresión |
| Casos Bloqueantes | Casos críticos aprobados ÷ casos críticos totales | **100%** | **No calculable** sin ejecución |

**Tratamiento de estados:** `PASSED` = esperado coincide con lo observado; `FAILED` = discrepancia reproducible; `BLOCKED` = impide ejecutar (se registra aparte y **no habilita salida**); `NOT RUN` = no ejecutado (no cuenta como aprobado); `RETEST` = pendiente de reejecución tras corrección. Debe informarse además el número total programado, ejecutado, bloqueado y omitido.

### 12.1 Demostración matemática — escenarios hipotéticos, no medición real

- **Cobertura:** 11 de 12 requisitos asociados a casos = (11 ÷ 12) × 100 = **91.67%**, cumple el mínimo de 90%; 10/12 = **83.33%**, no cumple.
- **Pass rate:** 19 pruebas aprobadas de 20 ejecutadas = (19 ÷ 20) × 100 = **95.00%**, cumple, siempre que las demás condiciones también lo hagan.
- **Límite de aprobación con 17 ejecuciones:** 16/17 = **94.12%**, por tanto **no** cumple; 17/17 = **100%**, sí supera el umbral.
- **Defecto abierto:** incluso 100% en las otras dos métricas **no autoriza** desplegar si existe al menos un defecto Bloqueante o Alta abierto.

No sustituir los números hipotéticos por resultados reales sin guardar evidencia de la ejecución.

## 13. Clasificación de defectos y ciclo de vida

| Prioridad | Ejemplo en UniTrack | Acción |
|:---|:---|:---|
| Bloqueante | Escaneo no autorizado modifica el acceso; credencial falsificada abre una visita | Suspender módulo, corregir antes de continuar |
| Alta | Una entrada/salida desaparece del historial; alumno ve datos privados ajenos | Registrar, corregir y regresar antes de liberar |
| Media | Texto ambiguo, validación inconsistente sin pérdida de control o datos | Corregir o aceptar con riesgo formal si no afecta salida |
| Baja | Estilo, espaciado y microcopy no crítico | Planificar mejora sin falsear el resultado funcional |

**Campos mínimos de incidente:** ID, caso y requisito, versión y URL local, fecha/hora, rol, precondición, pasos, entrada, salida esperada/real, severidad, captura anonimizada, responsable, estado, revisión del arreglo y retest.

## 14. Procedimiento de decisión de calidad

1. Verificar que los 12 requisitos estén cubiertos por una matriz revisada.
2. Ejecutar y evidenciar todas las iteraciones de los 17 casos, priorizando Bloqueantes/Alta.
3. Registrar defectos en repositorio de seguimiento; corregir sin alterar la evidencia original.
4. Repetir pruebas afectadas y el ciclo de regresión completo; calcular Pass Rate sobre **ejecuciones** del último ciclo.
5. Validar 0 defectos Bloqueantes/Altos abiertos y 100% de críticos ejecutados/aprobados.
6. Firmar dictamen de QA: **Aprobado para consideración de despliegue**, **Rechazado** o **Pendiente de evidencia**. El dictamen no sustituye la validación de infraestructura y seguridad física.

**Dictamen al 7/nov/2026:** **PENDIENTE DE EVIDENCIA.** El documento y la matriz de diseño están preparados; la ejecución manual, los defectos abiertos, la regresión y la operación del servidor en producción no se verifican en esta entrega. Los checks automatizados del commit de referencia son señal positiva, no autorización de despliegue.

## 15. Criterios de aceptación en sintaxis Gherkin

**Escenario: Rechazar QR sin firma**  
**DADO** un operador autorizado frente al escáner y un identificador permanente sin firma,  
**CUANDO** intenta registrarlo como acceso al campus,  
**ENTONCES** el sistema rechaza la acción sin crear una entrada o salida.

**Escenario: Historial conserva acciones separadas**  
**DADO** un usuario que ha registrado dos entradas y dos salidas válidas,  
**CUANDO** consulta su historial individual,  
**ENTONCES** visualiza cuatro eventos diferenciados y contadores de dos entradas y dos salidas.

**Escenario: Finalización después de clase**  
**DADO** una reunión académica finalizada en horario y un estudiante inscrito sin marca,  
**CUANDO** un docente autorizado cierra la asistencia a la hora de término o después,  
**ENTONCES** se registra ausencia para el estudiante pendiente y se conservan las marcas existentes.

## 16. Conclusiones técnicas

La estrategia seleccionada combina el plan de pruebas formal y las especificaciones individuales de caso, según la distinción enseñada en la plataforma de UPBC. EP comprueba grupos de entrada con comportamiento equivalente; BVA concentra la atención en fronteras; las pruebas por estados verifican entradas/salidas emparejadas. Los riesgos mayores recaen en credenciales, permisos, trazabilidad temporal y privacidad. El paquete documental supera el umbral de **cobertura diseñada de 90%**, pero no debe afirmarse que UniTrack está listo para producción hasta alcanzar la tasa de aprobación real, cerrar defectos relevantes y validar los servicios desplegados.

## 17. Referencias y materiales utilizados

1. H. A. Noriega García, *Plataforma interactiva: Plan y Casos de Prueba — Estándares y Métricas de Software*, HTML proporcionado para la clase, secciones «Estructura y Estándares», «Formatos Profesionales», «Diseño de Casos» y «Workbench & Simulador» (material didáctico, sin ejecución sobre UniTrack).
2. UniTrack, repositorio GitHub: https://github.com/Peyman-mxli/unitrack/tree/443615e552c890235f17e74846ff2771b7cde7fd
3. Funciones y políticas reales: `app/utils/password_policy.py`, `app/routes/auth_routes.py`, `app/services/validation_code_service.py`, `app/services/scan_token_service.py`, `app/routes/student_views.py`, `app/services/access_log_service.py`, `app/routes/attendance_views.py`, `app/__init__.py`.
4. Evidencia CI de referencia: https://github.com/Peyman-mxli/unitrack/actions/runs/42126902892 (pruebas automáticas, success) y https://github.com/Peyman-mxli/unitrack/actions/runs/42126902802 (auditoría de dependencias y secretos, success).
5. ISO/IEC/IEEE 29119-3, estándar de documentación de pruebas mencionado por la plataforma de clase; utilizado como orientación para el diseño, sin pretender conformidad formal auditada.

---

## Anexo A — Formato de bitácora de ejecución

| Fecha/hora | Ejecutó | ID caso | Iteración/datos | Commit | Esperado | Real | Estado | Defecto/evidencia |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| Pendiente | Integrante 3 | TC-UT-002 | Longitud 14 | 443615e | Rechazo | Por documentar | NOT RUN | Por adjuntar |
| Pendiente | Integrante 3 | TC-UT-009 | Primera lectura válida | 443615e | Entrada registrada | Por documentar | NOT RUN | Por adjuntar |
| Pendiente | Integrante 3 | TC-UT-011 | 2 visitas / 4 eventos | 443615e | 4 eventos | Por documentar | NOT RUN | Por adjuntar |

**Formato de evidencia:** nombre `EV-TC-UT-XXX-iteracion-fecha.png`; sin nombres reales, correos institucionales, QR vigentes ni tokens. Documentar paso, expected/actual y la versión. La publicación del reporte en un repositorio público no autoriza subir cuentas ni registros privados.

## Anexo B — Lista de verificación de entrega

- [x] Fase 1: identificador, alcance, estrategia, aceptación/salida, entorno, responsables y cronograma.
- [x] Fase 2: al menos tres casos EP/BVA; se entregan **17** completos con matriz de trazabilidad.
- [x] Fase 3: 0 defectos Altos/Bloqueantes; ≥90% cobertura; ≥95% Pass Rate, con fórmulas y ejemplos.
- [ ] Completar nombres de otros dos integrantes.
- [ ] Ejecutar y evidenciar pruebas si el profesor exige resultados de laboratorio.
- [ ] Completar métricas observadas, defectos y dictamen con resultados reales.
