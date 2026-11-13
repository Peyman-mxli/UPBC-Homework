# TALLER INTEGRADOR: PLAN DE PRUEBAS Y CASOS DE PRUEBA

**Sistema seleccionado: UniTrack**

Universidad Politécnica de Baja California (UPBC)  
Asignatura: Estándares y Métricas para el Desarrollo de Software  
Grupo: ITIID 5AFM 2026-3  
Docente: Héctor Alonso Noriega García  
Identificador: `MTP-UNITRACK-2026-V2`  
Fecha de elaboración: 13 de noviembre de 2026  
Entrega: 14 de noviembre de 2026, 23:59 h

**Equipo (3 integrantes):** Peyman Miyandashti — Líder QA; [Integrante 2] — Diseñador/a de pruebas; [Integrante 3] — Tester ejecutor.

## FASE 1. Elaboración del Plan de Pruebas de Software

### 1. Identificador y título

**MTP-UNITRACK-2026-V2 — Plan de Pruebas de UniTrack (autenticación, contraseñas y QR).**

### 2. Alcance (In-Scope / Out-of-Scope)

**Incluido (In-Scope):**

- **RF-01 · Autenticación:** Inicio de sesión con credenciales válidas e inválidas y control de acceso al perfil.
- **RF-02 · Contraseñas:** Validación del límite mínimo de 15 caracteres al crear o cambiar una contraseña.
- **RF-03 · Acceso mediante QR:** Aceptación de credenciales QR firmadas y vigentes y rechazo de credenciales alteradas.

**Excluido (Out-of-Scope):**

- Registro con códigos de invitación, asistencia a clases y calificaciones.
- Avisos institucionales, fotografías de perfil y administración avanzada de usuarios.
- Historial completo de múltiples visitas, torniquetes físicos y pruebas en producción.

### 3. Estrategia y tipos de prueba

- **Funcionales de caja negra:** Partición de Equivalencia (EP) y Análisis de Valores Límite (BVA) en autenticación, contraseña y QR.
- **Integración:** Comprobar el flujo interfaz web → Flask → base de datos de ensayo y la respuesta visible al usuario.
- **Carga:** Ejecutar una carga ligera controlada sobre login y consulta autenticada, sin datos reales ni sobrecargar producción.
- **Usabilidad:** Observar si un usuario de prueba puede iniciar sesión, interpretar las validaciones y utilizar el escáner QR.

### 4. Criterios de aceptación y salida

- **≥ 95 %** de ejecuciones exitosas en la última regresión.
- **0** defectos abiertos de prioridad **Alta o Bloqueante**.
- **≥ 90 %** de requisitos funcionales incluidos vinculados a casos de prueba.
- Si no hay ejecuciones o evidencias suficientes, **no** se declara el software listo para producción.

### 5. Entorno y recursos (Test Bed)

- **Servidor de pruebas:** Flask local en Windows 11 (127.0.0.1:5000) o entorno de staging aislado.
- **Tecnología y base de datos:** Python 3.11, Flask, SQLAlchemy y SQLite temporal con registros ficticios.
- **Navegadores:** Google Chrome y Mozilla Firefox, versiones instaladas al realizar las pruebas.
- **Herramientas:** unittest de Python, Postman gratuito o curl, DevTools del navegador y Locust para carga ligera.
- **Datos y seguridad:** Usuarios ficticios; claves y tokens de prueba; sin fotografías, cuentas ni base institucional real.

### 6. Cronograma y responsables

| Entregable | Fecha | Responsable | Función |
|---|---|---|---|
| Plan, alcance y estrategia | 13 nov 2026 | Peyman Miyandashti · Líder QA | Responsable |
| Diseño y revisión de 3 casos EP/BVA | 13 nov 2026 | Integrante 2 · Diseñador/a | Responsable |
| Preparación y ejecución de pruebas | 14 nov 2026 | Integrante 3 · Tester ejecutor | Responsable |
| Métricas y entrega final | 14 nov 2026 | Peyman Miyandashti · Líder QA | Aprueba / coordina |

*Los nombres de los integrantes 2 y 3 están pendientes de confirmar; las fechas son un cronograma propuesto.*

## FASE 2. Diseño de la Matriz de Casos de Prueba

Tres casos funcionales de caja negra: dos con EP y uno con BVA.

| ID Caso | Módulo / Título | Precondiciones | Pasos de Ejecución | Datos de Entrada | Resultado Esperado | Prioridad |
|---|---|---|---|---|---|---|
| TC-UT-001 | Autenticación — inicio de sesión (EP) | Cuenta ficticia activa; contraseña conocida; sesión cerrada. | 1. Abrir “Iniciar sesión”. 2. Introducir cada combinación. 3. Pulsar “Entrar”. 4. Verificar acceso o rechazo. | A: cuenta válida + contraseña correcta. B: cuenta válida + contraseña incorrecta. C: cuenta inexistente + contraseña cualquiera. | A: acceso al panel del rol. B y C: acceso denegado, sin iniciar sesión ni revelar si existe la cuenta. | Alta |
| TC-UT-002 | Contraseñas — mínimo de longitud (BVA) | Formulario de alta o cambio de contraseña en entorno de ensayo; otros requisitos y campos válidos. | 1. Capturar nueva contraseña de 14 caracteres. 2. Repetir con 15. 3. Repetir con 16. 4. Revisar validación y guardado. | 14: Abcd2026!QrTes; 15: Abcd2026!QrTest; 16: Abcd2026!QrTestX (solo datos ficticios). | 14: se rechaza por longitud insuficiente. 15 y 16: superan el límite mínimo y se aceptan si cumplen las demás reglas. | Alta |
| TC-UT-003 | Control de acceso — QR firmado (EP) | Operador de prueba autorizado; usuario ficticio habilitado y fuera; QR temporal emitido en entorno aislado. | 1. Leer un QR firmado y vigente. 2. Restablecer datos. 3. Alterar un carácter del token. 4. Intentar leerlo y comparar registros. | A: token válido, firmado y vigente. B: el mismo token con un carácter modificado. C: cadena sin firma válida. | A: registra una entrada autorizada. B y C: rechaza la lectura y no genera una entrada válida. | Bloqueante |

*Estado de ejecución: NO EJECUTADO. Los resultados esperados describen criterios de diseño, no resultados observados.*

## FASE 3. Criterios de aceptación y métrica de éxito

| Indicador | Valor exigido | Cálculo / regla |
|---|---:|---|
| Defectos críticos abiertos | **0** | Ningún defecto abierto de prioridad Alta o Bloqueante. |
| Cobertura de requisitos | **≥ 90 %** | (Requisitos funcionales mapeados a casos ÷ requisitos incluidos) × 100. |
| Tasa de aprobación (Pass Rate) | **≥ 95 %** | (Ejecuciones exitosas ÷ total de ejecuciones de la última regresión) × 100. |

**Trazabilidad funcional del alcance:**

| Requisito funcional | Caso de prueba | Estado de diseño |
|---|---|---|
| RF-01 | TC-UT-001 | Mapeado (no ejecutado) |
| RF-02 | TC-UT-002 | Mapeado (no ejecutado) |
| RF-03 | TC-UT-003 | Mapeado (no ejecutado) |

**Cobertura de diseño:** 3 requisitos de 3 mapeados = **100 %**, superior a la meta del 90 %. **Pass Rate real y defectos abiertos:** no determinados hasta ejecutar la regresión y documentar hallazgos. **Dictamen de producción:** pendiente, no aprobado por falta de evidencias de ejecución.