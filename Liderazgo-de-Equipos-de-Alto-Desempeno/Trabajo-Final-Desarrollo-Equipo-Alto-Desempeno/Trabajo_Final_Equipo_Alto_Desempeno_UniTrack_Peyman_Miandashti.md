# TRABAJO FINAL. DESARROLLO DE UN EQUIPO DE ALTO DESEMPEÑO

**Proyecto seleccionado:** UniTrack: diseño de un equipo interdisciplinario para fortalecer una plataforma universitaria de asistencia y control de acceso mediante códigos QR.

**Institución:** Universidad Politécnica de Baja California (UPBC)  
**Programa educativo:** Ingeniería en Tecnologías de la Información e Innovación Digital  
**Asignatura:** Liderazgo de Equipos de Alto Desempeño  
**Docente:** ALEJANDRO VERDUZCO VEGA  
**Grupo y ciclo:** ITIID 5AFM 2026-3  
**Alumno:** Peyman Miandashti  
**Modalidad:** Trabajo individual; diseño propositivo de un equipo interdisciplinario  
**Fecha de elaboración:** 26 de octubre de 2026  
**Fecha límite de entrega:** 15 de noviembre de 2026

> **Nota de alcance y honestidad académica:** UniTrack es un proyecto tecnológico existente del estudiante y se utiliza como caso real de referencia. Los seis puestos, el calendario de colaboración, las metas, los acuerdos, los presupuestos de tiempo y los indicadores propuestos en este trabajo son un **modelo de organización futura**, no evidencia de que ya se haya formado o contratado al equipo ni de que se haya ejecutado un piloto institucional.

## Resumen ejecutivo

Este trabajo propone la conformación y operación de un equipo de alto desempeño para evolucionar UniTrack, una aplicación universitaria dirigida al registro de entradas, salidas y asistencia mediante códigos QR. La idea central es demostrar que el éxito de una solución digital no depende únicamente de su código o infraestructura, sino de personas capaces de compartir objetivos, comunicarse con claridad, distribuir responsabilidades, resolver discrepancias de manera profesional y aprender de sus resultados. Se presenta un modelo de seis perfiles complementarios: liderazgo del proyecto, análisis funcional y experiencia de usuario, desarrollo backend y datos, desarrollo frontend y accesibilidad, aseguramiento de calidad y seguridad, y adopción institucional y documentación.

La propuesta articula principios de liderazgo transformacional y de servicio, coordinación ágil, seguridad psicológica, responsabilidad compartida y mejora continua. Incluye un objetivo SMART, un sistema de trabajo durante doce semanas, reglas verificables de coordinación, un esquema de decisiones y escalamiento, siete indicadores de desempeño, seis escenarios de riesgo, una matriz de responsabilidades, un cronograma de entregables, instrumentos de retroalimentación y un protocolo de conflictos. La meta consiste en diseñar condiciones realistas bajo las cuales un equipo pueda producir una solución útil, confiable, accesible y responsable con la información de la comunidad universitaria.

**Palabras clave:** liderazgo, alto desempeño, UniTrack, colaboración interdisciplinaria, comunicación efectiva, seguridad psicológica, gestión ágil, mejora continua.

## Introducción y delimitación del caso

Las instituciones educativas realizan tareas que requieren información confiable sobre accesos, horarios, permanencia y asistencia. Cuando estos datos dependen de procedimientos manuales, registros dispersos o controles poco uniformes, pueden aparecer duplicidades, pérdida de tiempo, dificultades de consulta y errores humanos. Una plataforma de registro mediante QR ofrece una alternativa de apoyo, siempre que su implementación contemple no solo la tecnología, sino también la protección de datos personales, la accesibilidad, la disponibilidad del servicio y la aceptación de quienes lo utilizarán.

Como base del caso se selecciona **UniTrack**, cuyo repositorio público documenta autenticación por roles (administrador, estudiante, docente y personal), registro de entrada y salida por QR, historial de asistencia, administración de usuarios y una interfaz adaptable. Su pila tecnológica documentada incluye Python, Flask, SQLAlchemy y herramientas relacionadas con bases de datos. Estas son características del proyecto de referencia; en cambio, la conformación del equipo, el piloto de implantación y los resultados esperados descritos aquí son objetivos propuestos, sujetos a validación y autorización institucional.

El énfasis de este documento es organizacional: ¿cómo reunir perfiles distintos y crear las condiciones para que trabajen como una unidad de alto desempeño? Conforme al planteamiento de Hackman (2002), el liderazgo efectivo construye un contexto, una dirección clara, una estructura adecuada, apoyo y acompañamiento. A su vez, la evidencia de Edmondson (1999) relaciona la seguridad psicológica con conductas de aprendizaje, como expresar dudas y señalar errores sin temor a humillaciones. Por ello, el diseño del equipo integra resultados técnicos con prácticas observables de cooperación.

# 1. Descripción del proyecto

## 1.1 Nombre y propósito general

**Nombre:** UniTrack — fortalecimiento colaborativo de una plataforma universitaria de control de acceso y asistencia.

**Propósito:** planear, mejorar y validar con usuarios autorizados un sistema de registro de entrada y salida por códigos QR, con consulta de historial, administración de roles y reportes claros. Se busca mejorar la confiabilidad de la información, disminuir operaciones manuales y ofrecer una experiencia sencilla para estudiantes, docentes, personal administrativo y responsables institucionales.

No se propone crear desde cero una plataforma imaginaria, sino aprovechar UniTrack como referencia tecnológica para diseñar la organización humana que permitiría llevarlo a un proceso controlado de mejoramiento. El trabajo de liderazgo se materializa en la forma en que el equipo comprende la necesidad, reparte el trabajo, previene fallas, escucha usuarios y convierte la retroalimentación en decisiones.

## 1.2 Problema, necesidad y beneficiarios

El problema que se pretende atender es la posible fragmentación o ineficiencia de los registros de acceso y asistencia cuando se realizan mediante formatos manuales o mecanismos no integrados. Una organización requiere saber qué datos se capturan, quién puede consultarlos, cómo se corrigen errores y qué ocurre cuando una persona no dispone de teléfono, conexión o lectura correcta de QR. Por tanto, automatizar no significa excluir procedimientos alternativos ni sustituir sin autorización los sistemas oficiales.

Los **beneficiarios primarios** serían estudiantes, docentes y trabajadores que requieren una interacción rápida y comprensible; los **usuarios de gestión** serían quienes tengan autorización para supervisar registros, resolver incidencias y producir reportes. Las áreas técnicas y administrativas se considerarían partes interesadas que ayudan a definir permisos y reglas. Ninguna función institucional se asumiría autorizada hasta contar con su validación expresa.

## 1.3 Objetivo general y objetivos específicos

**Objetivo general:** diseñar y coordinar un equipo interdisciplinario de seis integrantes que, durante un plan de doce semanas, prepare una versión mejorada y evaluable de UniTrack, con entregables funcionales, criterios de calidad acordados, mecanismos de comunicación, aprendizaje continuo y una propuesta de piloto responsable.

**Objetivos específicos:**

1. Identificar y priorizar necesidades de al menos tres perfiles de usuario mediante entrevistas o sesiones de revisión autorizadas.
2. Definir roles, expectativas, acuerdos de trabajo, dependencias y mecanismos de reemplazo para evitar tareas sin responsable.
3. Organizar un tablero único de trabajo con criterios de aceptación y trazabilidad entre necesidad, tarea, revisión y evidencia.
4. Preparar y revisar mejoras priorizadas de usabilidad, accesibilidad, calidad, seguridad y confiabilidad de reportes.
5. Evaluar en un entorno de prueba la ejecución de escenarios críticos: registro exitoso, QR inválido, acceso no autorizado, corrección controlada e indisponibilidad.
6. Establecer indicadores para monitorear cumplimiento, defectos, colaboración, satisfacción del usuario y aprendizaje.
7. Concluir con un informe de resultados y recomendaciones, sin presentar como reales pruebas o aprobaciones no efectuadas.

## 1.4 Meta SMART, alcance y exclusiones

La **meta SMART propuesta** consiste en que, al finalizar la semana 12, el equipo entregue una versión de demostración con al menos ocho historias de usuario prioritarias terminadas y verificadas; que el 100 % de las funcionalidades críticas tenga pruebas documentadas; que no existan defectos críticos abiertos para la demostración; y que al menos el 80 % de los usuarios de una muestra piloto autorizada declare poder completar las tareas esenciales sin ayuda, siempre que dicha muestra se concrete. Se trata de **umbrales de aceptación futuros**, no de métricas alcanzadas.

**Dentro del alcance:** descubrimiento de necesidades; priorización; planificación; revisión del flujo QR y de roles; experiencias inclusivas; pruebas; guías breves; documentación; demostración controlada; propuesta de adopción. **Fuera del alcance:** despliegue obligatorio en toda la universidad, integración automática con bases institucionales sin consentimiento, contratación real del personal propuesto, sustitución de controles oficiales, registro biométrico o tratamiento masivo de datos reales no autorizado.

## 1.5 Productos entregables y criterios de éxito

Los entregables esperados son: acta de constitución y acuerdos del equipo; mapa de necesidades; lista priorizada de historias; diseños de interfaz y criterios de accesibilidad; versión demostrable; matriz de pruebas; guía de seguridad y permisos; manuales breves; informe de piloto (solo si se ejecuta) y retrospectiva final. El proyecto será valioso si sus productos resultan útiles **y** si el equipo mantiene relaciones de colaboración sostenibles: una entrega puntual lograda a costa de sobrecarga crónica, silencio o conflicto no puede considerarse alto desempeño auténtico.

# 2. Integrantes del equipo

## 2.1 Tamaño y criterio de selección

Se propone un equipo **hipotético de seis integrantes**, suficientemente pequeño para sostener comunicación frecuente y bastante diverso para cubrir requisitos, construcción, verificación y adopción. Se identifican **puestos o perfiles, no personas contratadas**. El alumno formula la propuesta individual y podría desempeñar la función de coordinación técnica, pero las restantes responsabilidades describen capacidades deseables para futuras incorporaciones.

La selección se basaría en una matriz de competencias (conocimientos, conductas y disponibilidad), una conversación inicial de expectativas, una pequeña actividad colaborativa y aceptación del código de conducta. Se privilegiaría la complementariedad sobre la semejanza: una persona experta en programación no reemplaza automáticamente la mirada de usuario, la documentación o la revisión independiente de calidad.

## 2.2 Perfiles, funciones, competencias y contribución verificable

| Perfil / número | Responsabilidades principales | Competencias que aporta | Evidencia de aportación |
| --- | --- | --- | --- |
| 1. Líder de proyecto y coordinación técnica | Mantener visión, alcance, prioridades, dependencias, acuerdos, riesgos, comunicación con interesados y seguimiento global; desbloquear trabajo. | Liderazgo colaborativo, planeación, escucha activa, facilitación, pensamiento sistémico, ética profesional. | Acta, tablero priorizado, minutas, decisiones, reporte semanal, registro de riesgos. |
| 2. Analista funcional y diseño UX | Investigar necesidades, redactar historias y aceptación, mapear recorridos, elaborar prototipos y comprobar comprensión de interfaz. | Entrevistas, empatía, análisis de procesos, redacción, diseño centrado en usuarios. | Historias revisadas, prototipos, guía de tareas y retroalimentación de usuarios. |
| 3. Desarrollador backend y datos | Mantener servicios, validaciones, permisos, integridad de registros, consultas y mecanismos de recuperación. | Python/Flask, SQLAlchemy, bases de datos, autenticación, control de errores, documentación técnica. | Cambios versionados, pruebas de servicios, esquema y decisiones técnicas. |
| 4. Desarrollador frontend y accesibilidad | Implementar interfaz responsiva, navegación comprensible, mensajes claros, validación visual y accesibilidad. | HTML, CSS, JavaScript, diseño responsivo, semántica y pruebas con teclado. | Pantallas revisadas, lista de verificación de accesibilidad y evidencias de uso. |
| 5. Responsable de calidad y seguridad | Diseñar casos de prueba, examinar permisos y amenazas, reproducir defectos, registrar evidencias y verificar correcciones. | Pruebas funcionales, pensamiento crítico, seguridad básica, trazabilidad y análisis de riesgo. | Plan de pruebas, matriz de defectos, reportes de regresión y aceptación técnica. |
| 6. Responsable de adopción y documentación | Crear manuales, preparar sesiones de orientación, organizar retroalimentación, comunicar cambios y apoyar gestión del cambio. | Comunicación institucional, capacitación, redacción clara, atención a usuarios y medición de satisfacción. | Guías, preguntas frecuentes, materiales de capacitación e informe de adopción. |

## 2.3 Responsabilidad transversal y límites de cada rol

Cada puesto tiene una especialidad primaria y al menos una capacidad secundaria. Por ejemplo, el analista puede apoyar la prueba de una historia, la persona de QA puede revisar el lenguaje de errores, y el desarrollador frontend puede elaborar capturas para documentación. Esta flexibilidad reduce cuellos de botella, pero **no elimina la rendición de cuentas**: la responsabilidad de aprobar una prueba corresponde a calidad; la autorización de datos institucionales corresponde a la instancia facultada; y las decisiones de prioridad deben registrarse y justificarse.

Se aplicará el principio de **revisión cruzada**: nadie aprobará en solitario una modificación crítica que haya implementado, especialmente en control de acceso, permisos o tratamiento de información. El líder no concentrará todas las decisiones técnicas; procurará que el conocimiento quede accesible mediante documentación, demostraciones y acompañamiento entre pares.

## 2.4 Expectativas de desempeño y pacto inicial

Cada integrante deberá comunicar su disponibilidad semanal, estimar tareas de manera razonable, avisar tempranamente de bloqueos, participar en revisiones y entregar evidencias verificables. Se propone un acuerdo de disponibilidad de referencia de 8 a 10 horas por semana **por perfil**, ajustable a la realidad del equipo y nunca presentado como contratación efectiva. La carga se distribuirá conforme a capacidad, complejidad y bienestar; horas disponibles no equivalen a productividad por sí solas.

El pacto inicial incluirá: respeto a opiniones divergentes; prohibición de descalificaciones personales; cumplimiento de compromisos acordados; derecho a solicitar ayuda; reconocimiento visible del trabajo ajeno; no publicación de datos personales; derecho a descanso y accesibilidad de herramientas; y obligación de documentar acuerdos importantes fuera de chats privados.

# 3. Características del equipo de alto desempeño

## 3.1 Objetivos compartidos y visión comprensible

Un equipo de alto desempeño requiere una meta que cada persona pueda explicar con sus propias palabras. En UniTrack, la visión compartida será **hacer más confiable, inclusivo y fácil de usar el registro universitario, sin comprometer la privacidad de las personas**. Esta formulación conecta el trabajo técnico con un propósito humano: backend protege la integridad, UX reduce confusión, calidad previene fallas, documentación facilita adopción y liderazgo mantiene la coherencia.

Al inicio de cada ciclo se verificará que las tareas se vinculen con una necesidad prioritaria y un criterio de aceptación. Una modificación atractiva pero de escaso impacto no desplazará un defecto crítico. La evidencia de objetivos compartidos será un tablero visible, metas de sprint, revisión de prioridades y una explicación unificada de lo que significa “terminado”.

## 3.2 Comunicación efectiva y escucha comprobable

La comunicación combinará canales sincrónicos y asincrónicos. Los mensajes operativos deben responder qué sucede, qué se requiere, quién tiene la siguiente acción y cuándo habrá actualización. Para decisiones relevantes se preparará una minuta corta con contexto, opciones, criterio, decisión, responsable y fecha. Así se reduce el riesgo de repetir discusiones o ejecutar órdenes contradictorias.

Las reuniones emplearán turnos de participación y síntesis de acuerdos. La escucha activa será una práctica observable: reformular la idea de otra persona antes de discutirla, hacer preguntas concretas y separar hechos de suposiciones. Ningún integrante deberá depender de estar conectado permanentemente a un chat para conocer la versión vigente del plan.

## 3.3 Confianza, respeto y seguridad psicológica

La confianza no se consigue exigiéndola; se construye mediante coherencia entre promesas y acciones, información compartida, reconocimiento de errores y trato respetuoso. Edmondson (1999) utiliza la noción de seguridad psicológica para describir la percepción compartida de que es posible asumir riesgos interpersonales, como preguntar, disentir o reconocer equivocaciones. En la propuesta, reportar una falla temprano será una conducta responsable, no un motivo automático de culpabilización.

El equipo distinguirá **error honesto** de negligencia repetida o incumplimiento deliberado. Los defectos se analizarán mediante causas, procesos, condiciones y medidas preventivas. El líder promoverá preguntas abiertas (“¿qué nos faltó prever?”) en vez de acusaciones (“¿quién tuvo la culpa?”). La confianza se comprobará con una encuesta breve y anónima quincenal sobre claridad, apoyo, respeto y posibilidad de pedir ayuda.

## 3.4 Colaboración, interdependencia y apoyo mutuo

La colaboración va más allá de dividir el proyecto en seis tareas aisladas. La implementación de una mejora QR exige que UX aclare el flujo, backend valide datos, frontend presente mensajes entendibles, QA compruebe escenarios y documentación explique su uso. Se promoverán sesiones de trabajo en parejas, revisiones funcionales y demostraciones donde se explicite la contribución de cada disciplina.

Ante un bloqueo, la primera reacción será buscar apoyo del equipo antes de permitir que venza el plazo. En tareas complejas se dividirá el trabajo en incrementos pequeños, evitando que una persona concentre información que el resto desconoce. La meta no es que todos sepan hacerlo todo, sino que el equipo pueda continuar aprendiendo y colaborando sin crear dependencias personales excesivas.

## 3.5 Responsabilidad individual y colectiva

La responsabilidad individual se observa en compromisos claros, aceptación de criterios, calidad de evidencias y comunicación anticipada. La responsabilidad colectiva se observa cuando el equipo analiza el resultado completo, no únicamente “mi parte”. Una historia no estará terminada porque el programador la haya enviado al repositorio: deberá estar integrada, revisada, probada y documentada según su criticidad.

El equipo aplicará una matriz RACI, un registro de impedimentos y una “definición de terminado” compartida. La rendición de cuentas será transparente sin convertirse en vigilancia invasiva: se medirán resultados y aprendizaje, no tiempo de conexión, cantidad de mensajes o número bruto de líneas de código.

## 3.6 Aprendizaje, innovación y mejora continua

Se realizarán retrospectivas cada dos semanas con tres preguntas: qué funcionó, qué obstaculizó el avance y qué experimento concreto probaremos en el siguiente ciclo. Cada mejora deberá tener dueño y fecha de revisión. Se reservará un espacio quincenal para compartir aprendizajes técnicos o de colaboración: un problema de QR, una prueba de accesibilidad, una regla de permisos o una práctica de comunicación efectiva.

La mejora continua combinará observación, experimentos pequeños, medición y ajuste. Si los registros de errores muestran confusión repetida ante un mensaje, el equipo no insistirá en la misma explicación: rediseñará el mensaje, lo probará con usuarios y registrará el resultado. Se apreciará la innovación útil, no únicamente las ideas novedosas.

## 3.7 Condiciones para sostener el alto desempeño

Hackman (2002) señala condiciones estructurales que el liderazgo debe facilitar. En esta propuesta se traducen en: equipo definido y relativamente estable; dirección significativa y verificable; estructura de funciones y normas clara; acceso a herramientas, tiempo y datos de prueba apropiados; y acompañamiento oportuno. Estas condiciones también protegen de dos errores: confundir alto desempeño con presión constante y asumir que un líder carismático puede compensar una estructura desordenada.

El equipo se considerará exitoso si combina **resultados, aprendizaje y bienestar laboral**. Se verificará si los miembros pueden explicar el objetivo, si los desacuerdos se resuelven con respeto, si la carga es razonable y si las entregas conservan calidad. Un resultado técnico espectacular acompañado de silenciamiento de opiniones o desgaste sistemático no cumpliría el enfoque educativo de esta materia.

# 4. Dinámica de trabajo en equipo

## 4.1 Modelo de coordinación y fases

Se propone una organización ágil de **seis ciclos de dos semanas**, inspirada en prácticas de Scrum pero adaptada a un equipo académico/propositivo: planificación, breve coordinación cotidiana cuando sea viable, revisión de incremento y retrospectiva. No se afirmará una certificación Scrum ni se utilizarán ceremonias solo por formalidad. La Guía Scrum (Schwaber y Sutherland, 2020) aporta el principio de inspeccionar y adaptar el trabajo de forma recurrente.

**Fase A — Alineación y diagnóstico (semanas 1-2):** establecer acuerdos y visión; identificar partes interesadas; levantar riesgos; definir historias principales. **Fase B — Diseño y priorización (semanas 3-4):** validar flujos, prototipos, permisos y criterios de aceptación. **Fase C — Construcción incremental (semanas 5-8):** integrar mejoras en dos ciclos con revisión entre pares. **Fase D — Validación y preparación de adopción (semanas 9-10):** ejecutar pruebas, corregir defectos y redactar guías. **Fase E — Demostración y cierre (semanas 11-12):** presentar evidencias verificables, valorar objetivos y proponer próximos pasos.

## 4.2 Organización de reuniones y acuerdos de asistencia

| Reunión | Frecuencia y duración propuesta | Participantes | Salida verificable |
| --- | --- | --- | --- |
| Planeación de ciclo | Cada dos semanas, 60 minutos | Equipo completo | Objetivo, prioridades, responsables y capacidad acordada. |
| Sincronización operativa | Tres veces por semana, 15 minutos; actualización asincrónica alternativa | Equipo completo | Avances, siguiente acción y bloqueo concreto. |
| Revisión técnica/funcional | Semanal, 45 minutos | Perfiles pertinentes, abierta al equipo | Cambios revisados, defectos y decisiones técnicas. |
| Demostración de avance | Cada dos semanas, 45 minutos | Equipo e interesados invitados/autorizados | Evidencia, comentarios y ajustes al backlog. |
| Retrospectiva | Cada dos semanas, 45 minutos | Equipo completo | Una a tres acciones de mejora, responsables y seguimiento. |
| Seguimiento de riesgos | Semanal, 20 minutos | Líder y responsables vinculados | Registro de riesgos actualizado y planes de mitigación. |

Toda reunión tendrá propósito, agenda breve y horario inclusivo. Si una sesión no requiere discusión, podrá reemplazarse por un informe escrito. Los acuerdos se publicarán en el repositorio de documentación o tablero, no quedarán escondidos en conversaciones privadas. Las personas ausentes podrán revisar el resumen y señalar un desacuerdo fundamentado.

## 4.3 Distribución de tareas y definición de terminado

Cada tarea tendrá identificador, objetivo, usuario beneficiado, responsable principal, personas de apoyo, prioridad, estimación, dependencias, criterios de aceptación, evidencia y estado. El responsable elegirá el modo de ejecución dentro de límites acordados y reportará riesgos tan pronto los detecte. Se limitará el trabajo simultáneo para priorizar terminar y validar antes de comenzar demasiadas actividades.

La **definición de terminado** para funcionalidades incluye: comportamiento conforme a criterios, revisión de otro perfil, pruebas adecuadas al riesgo, accesibilidad básica verificada, ausencia de datos sensibles en evidencias, documentación actualizada y demostración en entorno permitido. Un entregable no pasará a “terminado” si únicamente compila, si una captura no corresponde a ejecución real o si queda sin revisar un permiso crítico.

## 4.4 Herramientas de comunicación y colaboración

Se plantea **GitHub** para control de versiones, tareas, historial de decisiones y revisiones de cambios; **GitHub Projects o tablero Kanban equivalente** para visualización del flujo; **Google Meet u otra videollamada accesible** para reuniones; **Google Drive/Docs o equivalente** para documentos compartidos; **Figma o herramientas de diseño similares** para prototipos; y una mensajería de uso acordado para alertas breves. Son herramientas sugeridas, no cuentas o espacios creados como parte de este documento.

Norma de canal: los anuncios urgentes pueden notificarse por mensajería, pero cada cambio de alcance, acuerdo importante, decisión o defecto se registrará en su fuente oficial. Las carpetas usarán nombres claros, versiones y permisos mínimos; la documentación nunca incluirá credenciales ni datos personales reales en repositorios públicos.

## 4.5 Proceso de toma de decisiones

Se utilizará una escala según impacto. **Decisiones operativas reversibles**: resuelve el responsable, informa al equipo y registra si afecta a otras áreas. **Decisiones técnicas de alcance moderado**: deliberan al menos dos especialistas afectados; si persiste desacuerdo, se prepara una comparación de alternativas con costo, seguridad, mantenibilidad y experiencia del usuario. **Decisiones críticas** (privacidad, permisos, cambio mayor de alcance o acceso a datos institucionales): requieren consulta con las personas competentes y no avanzan sin autorización correspondiente.

El consenso se buscará, pero no se confundirá con unanimidad obligatoria. Si tras escuchar argumentos no hay acuerdo, el líder facilitará una decisión limitada por evidencia, propondrá un experimento reversible o elevará el asunto a la instancia autorizada. Cada decisión relevante dejará constancia de alternativa elegida, supuestos, riesgos, responsable y fecha para reevaluarla.

## 4.6 Seguimiento del avance y transparencia

El tablero tendrá las columnas “Pendiente”, “Preparado”, “En proceso”, “En revisión”, “En pruebas” y “Terminado”. El informe semanal sintetizará: avance contra compromisos, principales entregables, impedimentos, riesgos, decisiones pendientes, métricas y apoyo requerido. Las tareas bloqueadas por más de 48 horas de trabajo disponible se señalarán para apoyo oportuno, nunca para castigo automático.

El seguimiento tendrá una mirada cualitativa y otra cuantitativa. No bastará afirmar “vamos al 80 %” sin explicar qué significa: el porcentaje de historias aceptadas se calculará sobre historias comprometidas del ciclo y se acompañará de evidencia de calidad. Tampoco se recompensará cerrar tareas incompletas para mejorar una cifra.

## 4.7 Protocolo de manejo de conflictos

**Paso 1: detección temprana.** Cualquier miembro puede señalar un desacuerdo con respeto y describir hechos concretos. **Paso 2: diálogo directo.** Las personas involucradas exponen intereses, no ataques, con escucha y tiempo equitativo. **Paso 3: facilitación.** Si no hay acuerdo, el líder media y consulta criterios escritos (objetivo, riesgos, capacidad, aceptación). **Paso 4: decisión y seguimiento.** Se documenta una solución específica, responsables y revisión posterior. **Paso 5: escalamiento.** Si hay hostigamiento, exposición de datos o faltas graves, se detiene la práctica y se acude a la instancia competente.

Las discrepancias sobre ideas son deseables cuando mejoran una decisión; las agresiones personales no son negociables. El protocolo contempla conversaciones privadas para problemas interpersonales y discusión abierta para decisiones de proyecto, evitando exhibir injustamente a alguien frente al grupo.

## 4.8 Retroalimentación y reconocimiento

El equipo aplicará retroalimentación **específica, basada en hechos, oportuna y orientada a una acción**. Ejemplo: “En la revisión del flujo QR del jueves faltó documentar el caso de código vencido; esto impide probar la regla. Propongo añadir ese escenario y revisarlo juntos mañana”, en lugar de “tu trabajo siempre está mal”. La persona receptora podrá explicar contexto y acordar apoyo.

Durante las demostraciones se reconocerán contribuciones individuales sin sacrificar la identidad colectiva. La evaluación del equipo considerará resultados, apoyo ofrecido, claridad de comunicación, aprendizaje y cumplimiento responsable. Cada mes se promoverá una conversación de desarrollo sobre habilidades adquiridas y metas de mejora.

## 4.9 Cronograma detallado de doce semanas

| Semanas | Objetivo principal | Entregables observables | Lidera / verifica |
| --- | --- | --- | --- |
| 1-2 | Constitución, diagnóstico y acuerdos | Acta del equipo, mapa de actores, riesgos iniciales, historias candidatas. | Líder y analista / equipo completo. |
| 3-4 | Diseño y validación de necesidades | Prototipos, criterios de aceptación, permisos previstos y backlog priorizado. | UX y backend / QA y usuarios autorizados. |
| 5-6 | Primer incremento funcional | Cambios integrados, revisión cruzada y pruebas de flujo principal. | Backend y frontend / QA. |
| 7-8 | Segundo incremento y robustez | Flujos alternos, errores comprensibles, mejoras de accesibilidad y registros. | Frontend y backend / UX y QA. |
| 9-10 | Calidad, seguridad y documentación | Matriz de pruebas, correcciones, guías, instrucciones de contingencia. | QA y adopción / líder y especialistas. |
| 11-12 | Demostración, evaluación y cierre | Demo controlada, indicadores, lecciones aprendidas y plan de mejora. | Líder y adopción / equipo completo. |

## 4.10 Matriz RACI de responsabilidades clave

**Leyenda:** R = realiza la tarea; A = responsable de aprobar el resultado; C = consultado; I = informado. Para conservar claridad, cada fila tiene un único A. Los códigos son L (líder), UX (analista/experiencia), BE (backend/datos), FE (frontend), QA (calidad/seguridad), AD (adopción/documentación).

| Actividad | L | UX | BE | FE | QA | AD |
| --- | --- | --- | --- | --- | --- | --- |
| Definir alcance y prioridades | A | R | C | C | C | C |
| Levantamiento de necesidades | A | R | C | C | C | R |
| Diseño de flujos y aceptación | I | A/R | C | R | C | C |
| Implementación de servicios | I | C | A/R | C | C | I |
| Implementación de interfaz | I | C | C | A/R | C | C |
| Plan y ejecución de pruebas | I | C | C | C | A/R | C |
| Revisión de riesgos de seguridad | A | C | R | C | R | I |
| Guías y preparación del piloto | A | C | I | I | C | R |
| Informe final y lecciones | A/R | C | C | C | C | R |

Esta matriz no sustituye la autorización institucional: un permiso para tratar datos, abrir un entorno productivo o cambiar procesos oficiales pertenece a las autoridades que correspondan, no al líder estudiantil.

## 4.11 Indicadores clave de desempeño (KPI) y medición

| Indicador | Cálculo o método de observación | Meta propuesta / interpretación |
| --- | --- | --- |
| Cumplimiento de compromisos | Historias aceptadas en ciclo / historias comprometidas x 100. | Al menos 85 %, sin cerrar tareas sin evidencias. |
| Cobertura de pruebas críticas | Escenarios críticos ejecutados y documentados / escenarios críticos definidos x 100. | 100 % antes de la demostración final. |
| Defectos críticos abiertos | Recuento de errores que impiden uso seguro o funcional crítico. | 0 al presentar una versión candidata. |
| Resolución de bloqueos | Tiempo desde registro del bloqueo hasta plan de acción y apoyo asignado. | Plan de atención en un máximo orientativo de 48 h hábiles. |
| Claridad y confianza del equipo | Encuesta interna anónima de 1 a 5 sobre objetivos, ayuda y trato. | Promedio al menos 4/5; analizar respuestas bajas. |
| Facilidad de uso | Usuarios piloto autorizados que completan tareas esenciales sin ayuda / participantes x 100. | Al menos 80 %, solo si existe un piloto válido. |
| Acciones de mejora completadas | Acciones de retrospectiva cerradas / acciones acordadas x 100. | Al menos 80 % por ciclo, revisando pertinencia. |

**Precisiones metodológicas:** las metas son parámetros de diseño y podrían revisarse tras establecer una línea base. Las encuestas deben ser voluntarias y procurar confidencialidad; si el número de participantes es pequeño, se reportarán resultados agregados sin inferencias estadísticas excesivas. Las métricas nunca justificarán exponer información personal ni exigir tiempo no acordado.

# 5. Rol del líder

## 5.1 Estilo de liderazgo elegido

Se propone un **liderazgo principalmente transformacional y de servicio, con adaptación situacional**. Transformacional porque el líder articula un propósito significativo, estimula el pensamiento crítico, fomenta el crecimiento y reconoce contribuciones; de servicio porque su función consiste en despejar impedimentos, asegurar recursos, escuchar y desarrollar autonomía; situacional porque ajusta el grado de guía según la experiencia, confianza y complejidad de cada actividad.

No se adoptará un mando autoritario como estilo permanente. Sin embargo, ante incidentes de seguridad o riesgo grave, el líder deberá activar procedimientos y tomar decisiones oportunas dentro de sus facultades. La autoridad formal no elimina la necesidad de escuchar evidencia ni confiere autorización sobre datos o procesos institucionales.

## 5.2 Funciones concretas del líder

Al inicio, el líder facilita la construcción de la visión, hace explícitas las reglas y aclara responsabilidades. Durante la ejecución, conecta tareas con objetivos, detecta dependencias, protege la capacidad disponible, obtiene información de los interesados, ayuda a resolver bloqueos y evita que una sola voz domine. En cada cierre de ciclo, dirige una revisión honesta del avance, reconoce resultados, hace visibles aprendizajes y solicita ajustes al plan.

El líder también actúa como custodio de la ética de trabajo: no confunde urgencia con falta de respeto, no solicita acceso indebido a información, no atribuye a una persona resultados colectivos ni disimula defectos para mostrar un avance ficticio. Si desconoce un asunto técnico, consulta al perfil responsable en lugar de imponer una decisión sin fundamento.

## 5.3 Estrategia de motivación

La motivación se fortalecerá por **propósito, autonomía, desarrollo, reconocimiento y justicia en la carga**. Primero se explicará cómo cada mejora ayuda a una persona usuaria. Después, cada especialista podrá proponer soluciones dentro de restricciones claras. Se reservarán espacios para aprender y se reconocerá no solo la entrega visible, sino también tareas menos llamativas, como pruebas, documentación y asistencia a compañeros.

Si aparece agotamiento, el líder renegociará alcance o compromisos en vez de asumir que aumentar presión resolverá el problema. Evitará comparar públicamente a individuos por número de commits, mensajes o horas conectadas, porque esos indicadores aislados no miden calidad, cooperación ni complejidad.

## 5.4 Participación equitativa e inclusión

Se facilitarán reuniones con turnos equilibrados, agenda disponible de antemano y canales asincrónicos para quienes necesiten más tiempo o tengan restricciones horarias. Las decisiones no se tomarán exclusivamente por quien habla más rápido. Se atenderán barreras de accesibilidad de reuniones, documentos y prototipos: contraste legible, instrucciones claras, navegación con teclado cuando aplique y alternativas al escaneo QR para los casos previstos.

El líder preguntará por condiciones de trabajo sin exigir revelar datos privados. Si una persona identifica un riesgo o una barrera, su aportación se tratará como información valiosa para el proyecto, no como oposición al avance.

## 5.5 Cómo resolverá problemas complejos

Ante un problema, el líder delimitará el síntoma, solicitará evidencia y reunirá a las especialidades afectadas. Después distinguirá entre una corrección inmediata y la causa raíz; comparará alternativas por valor, esfuerzo, seguridad y riesgo; asignará responsables y verificará resultados. Por ejemplo, ante registros QR duplicados, no bastaría ocultar la duplicidad en pantalla: backend revisaría reglas de integridad, frontend el mensaje, QA los escenarios y UX la comprensión del flujo.

El liderazgo se evaluará por su capacidad de **crear condiciones para que otros resuelvan**, no por aparecer como autor de cada solución. Una señal positiva será que, con el tiempo, el equipo necesite menos intervenciones de urgencia y tome más decisiones bien fundamentadas.

## 5.6 Evaluación del liderazgo

Al cerrar cada segundo ciclo, el líder recibirá retroalimentación confidencial mediante cuatro preguntas: ¿aclara prioridades?, ¿escucha puntos de vista distintos?, ¿atiende bloqueos oportunamente?, ¿distribuye cargas con justicia? Además, registrará un compromiso personal de mejora. Si el equipo considera que la coordinación se convierte en cuello de botella, se delegarán decisiones reversibles y se actualizará la matriz RACI.

# 6. Posibles retos y soluciones

## 6.1 Reto 1: retrasos y desequilibrio de carga

**Escenario:** backend acumula integraciones mientras otras tareas dependen de él. **Causas posibles:** estimaciones imprecisas, exceso de tareas simultáneas, dependencias mal detectadas o disponibilidad distinta. **Impacto:** entregables demorados, frustración y trabajo apresurado. **Prevención:** dividir historias, establecer límites de trabajo en curso, estimar junto con perfiles implicados, rotar tareas de apoyo y compartir conocimiento. **Respuesta:** visibilizar bloqueo, negociar prioridades, reducir alcance de baja importancia, reasignar apoyo con supervisión y comunicar la nueva previsión. **Indicador:** duración del bloqueo y porcentaje de tareas aceptadas sin retrabajo.

## 6.2 Reto 2: desacuerdos técnicos que se vuelven personales

**Escenario:** dos integrantes discrepan sobre una solución de autenticación o una librería. **Causas:** preferencias previas, argumentos incompletos o falta de criterios compartidos. **Impacto:** discusiones prolongadas, desconfianza y decisiones inconsistentes. **Prevención:** mantener principios de arquitectura y una plantilla de decisión. **Respuesta:** escuchar ambas alternativas, definir criterios medibles (seguridad, compatibilidad, mantenimiento, tiempo), realizar una prueba pequeña si es reversible y documentar la decisión. **Indicador:** tiempo para cerrar decisiones y cantidad de conflictos que requieren escalamiento.

## 6.3 Reto 3: fallas de comunicación o pérdida de información

**Escenario:** un cambio de requisito solo se menciona en un chat, mientras alguien desarrolla según la versión anterior. **Causas:** múltiples canales, acuerdos ambiguos o ausencia de fuente oficial. **Impacto:** retrabajo, errores y sensación de incumplimiento. **Prevención:** tablero como fuente de verdad, criterios de aceptación visibles y actas breves. **Respuesta:** identificar la última decisión válida, evaluar el impacto, corregir tareas y comunicar la modificación a todos. **Indicador:** incidencias de retrabajo por requisito confuso y porcentaje de historias con criterios actualizados.

## 6.4 Reto 4: errores de seguridad o manejo inapropiado de datos

**Escenario:** un permiso permite a un perfil consultar registros ajenos o aparecen datos reales en una captura pública. **Causas:** revisión insuficiente, uso incorrecto de entornos o controles de acceso ambiguos. **Impacto:** riesgo para usuarios, pérdida de confianza e incumplimientos. **Prevención:** mínimo privilegio, datos sintéticos, revisión de permisos, pruebas negativas y revisión cruzada. **Respuesta:** suspender acceso afectado, preservar evidencias de forma segura, informar mediante el canal autorizado, corregir, volver a probar y documentar aprendizaje. **Indicador:** cero defectos críticos abiertos y cobertura del 100 % de escenarios de autorización antes de una demostración. La propuesta no sustituye asesoría jurídica ni autorización institucional.

## 6.5 Reto 5: resistencia al cambio y dificultades de uso

**Escenario:** usuarios prefieren el procedimiento anterior o no pueden completar el registro QR. **Causas:** instrucciones poco claras, falta de capacitación, accesibilidad insuficiente o beneficios no evidentes. **Impacto:** baja adopción y errores. **Prevención:** involucramiento temprano, pruebas de tareas reales, instrucciones breves y alternativa autorizada cuando el QR falle. **Respuesta:** escuchar motivos, observar tareas sin culpabilizar al usuario, mejorar mensajes y guía, y evaluar nuevamente. **Indicador:** tasa de finalización de tareas, reportes de confusión y comentarios cualitativos.

## 6.6 Reto 6: desmotivación, participación desigual o temor a hablar

**Escenario:** algunas voces dominan, otras dejan de proponer y una persona evita reconocer que no comprende una tarea. **Causas:** inseguridad psicológica, reconocimiento desequilibrado, estilos de comunicación diferentes o expectativas poco claras. **Impacto:** errores ocultos, pérdida de creatividad y rotación potencial. **Prevención:** pacto de respeto, turnos equilibrados, acompañamiento y retroalimentación específica. **Respuesta:** conversación confidencial, ajuste de distribución, apoyo formativo y seguimiento en retrospectiva. **Indicador:** encuesta de claridad y confianza, participación efectiva y acciones de mejora implementadas.

## 6.7 Matriz comparativa de riesgos y respuesta priorizada

Escala propuesta: **Probabilidad (P)** e **Impacto (I)** del 1 al 5; **prioridad = P x I**. Son valores de análisis preliminar, no estadísticas observadas. Se revisarían con el equipo al iniciar.

| Riesgo | P | I | Prioridad | Responsable de mitigación | Activación / medida inmediata |
| --- | --- | --- | --- | --- | --- |
| Dependencia y sobrecarga técnica | 4 | 4 | 16 / Alta | Líder y backend | Bloqueo sostenido; redistribuir y recortar alcance no crítico. |
| Acceso a datos sin permiso | 3 | 5 | 15 / Alta | QA y backend | Hallazgo de permiso; detener uso afectado y escalar. |
| Requisitos contradictorios | 4 | 3 | 12 / Alta | Analista UX y líder | Cambios no documentados; confirmar versión oficial. |
| Baja adopción de usuarios | 3 | 4 | 12 / Alta | Adopción y UX | Fallo repetido de tarea; observar y simplificar. |
| Conflicto interpersonal | 3 | 3 | 9 / Media | Líder y partes implicadas | Deterioro del diálogo; mediación estructurada. |
| Ausencia o salida temporal de integrante | 3 | 4 | 12 / Alta | Líder y todo el equipo | Falta de capacidad; activar documentación y suplencia. |

**Plan de contingencia adicional:** ante la salida de un perfil, no se asignarán sus funciones automáticamente a quien esté más disponible. El equipo clasificará entregables críticos, revisará carga, realizará transferencia documentada y negociará fechas. La continuidad debe proteger calidad y bienestar.

# 7. Conclusión

El diseño presentado demuestra que un equipo de alto desempeño no surge simplemente al reunir personas talentosas. Necesita dirección compartida, responsabilidades comprensibles, confianza cultivada en hechos, comunicación documentada, colaboración transversal y oportunidades frecuentes para aprender. La propuesta de UniTrack permite observar la conexión directa entre estas capacidades: una mejora técnica solo aporta verdadero valor si el equipo comprende la necesidad, prueba el resultado, protege a los usuarios y facilita su adopción.

Considero que el liderazgo más útil para este caso no consiste en controlar todos los detalles, sino en orientar, coordinar y desarrollar a los integrantes. El líder debe aclarar prioridades, escuchar perspectivas diferentes, anticipar riesgos, reconocer aportaciones y ayudar a que las personas puedan actuar con autonomía y responsabilidad. La seguridad psicológica permite reportar fallas sin temor; la rendición de cuentas evita confundir confianza con falta de compromiso; y la mejora continua convierte los errores en aprendizaje documentado.

Como estudiante de Ingeniería en Tecnologías de la Información e Innovación Digital, esta actividad me permite relacionar la construcción de software con competencias humanas que serán esenciales en proyectos profesionales. Programar un sistema y liderar su evolución con personas de perfiles distintos son desafíos complementarios. Mi principal aprendizaje es que el alto desempeño no debe evaluarse solo por la velocidad de entrega, sino por el equilibrio entre calidad del resultado, responsabilidad ética, capacidad de aprendizaje, respeto e impacto positivo para las personas.

Finalmente, el valor de esta propuesta depende de aplicarla con honestidad. El plan de doce semanas, sus metas y la composición del equipo constituyen un diseño académico susceptible de implementarse, no resultados ya certificados. Precisamente esta distinción permite establecer criterios verificables y un camino realista para que, en una futura colaboración, UniTrack avance de una referencia tecnológica desarrollada individualmente a una iniciativa sostenible apoyada por un equipo verdaderamente coordinado.

# Anexos de aplicación

## Anexo A. Acta de constitución del equipo (modelo)

**Nombre del equipo:** UniTrack — Equipo de Mejora y Validación. **Duración propuesta:** doce semanas a partir de la aprobación del plan. **Patrocinador institucional:** por definir; no se supone designado. **Propietario de la propuesta académica:** Peyman Miandashti. **Integrantes previstos:** seis perfiles funcionales definidos en el apartado 2. **Resultado esperado:** demostración verificable de mejoras priorizadas y guía de continuidad. **Límites:** sin datos reales ni implantación institucional sin permiso.

**Acuerdos fundamentales:** (a) tomar decisiones por evidencia y valor para el usuario; (b) registrar compromisos; (c) señalar riesgos temprano; (d) colaborar sin descalificaciones; (e) proteger confidencialidad y seguridad; (f) actualizar documentación; (g) respetar disponibilidad y accesibilidad; (h) revisar el pacto al final del primer ciclo y cuando cambie la composición del equipo.

**Criterio de aceptación del acta:** cada futuro participante comprende propósito, rol, reglas de colaboración y mecanismos para pedir apoyo. Las firmas o aprobaciones se integrarían solo si el equipo se constituyera realmente.

## Anexo B. Ejemplo de historia de usuario y criterios de aceptación

**ID:** UT-QR-01. **Historia:** como usuario autorizado, quiero registrar mi entrada con un QR válido para contar con un comprobante claro de mi asistencia. **Valor:** registro comprensible, oportuno y trazable. **Dependencias:** autenticación, QR vigente y permiso adecuado. **Criterios:** (1) el sistema valida el QR; (2) registra la operación una sola vez conforme a la regla aprobada; (3) muestra fecha y hora con mensaje claro; (4) ante un QR inválido, informa sin divulgar datos privados; (5) permite seguir un procedimiento alternativo aprobado cuando no sea posible escanear. **Pruebas:** éxito, QR inválido, repetición, perfil no autorizado, fallo de conectividad y recuperación. **Condición de terminado:** revisión cruzada, pruebas documentadas y guía actualizada.

## Anexo C. Formato de reporte semanal

**Semana y período:** _____. **Objetivo del ciclo:** _____. **Entregables aceptados:** _____ con enlaces/evidencias. **En proceso:** _____ y responsables. **Bloqueos:** _____, fecha de detección y solicitud de apoyo. **Riesgos nuevos o modificados:** _____. **Decisiones relevantes:** _____ y registro correspondiente. **Indicadores:** compromisos aceptados ___/___; pruebas críticas ___/___; defectos críticos abiertos ___; acciones de mejora completadas ___/___. **Próximos pasos y apoyos necesarios:** _____. **Observación de colaboración y bienestar:** _____ (sin datos sensibles individuales).

## Anexo D. Guía de retrospectiva quincenal

**Apertura (5 min):** recordar que se revisan procesos y colaboración, no se buscan culpables. **Hechos (10 min):** comparar entregables aceptados, bloqueos, calidad y acuerdos. **Reflexión (15 min):** cada integrante expresa una práctica útil, una dificultad y una hipótesis de mejora. **Priorización (10 min):** seleccionar de una a tres acciones pequeñas con responsable y fecha. **Cierre (5 min):** agradecer contribuciones y confirmar cómo se verificará el cambio. **Regla:** no registrar comentarios personales sensibles en actas públicas.

## Anexo E. Ejemplo de registro de decisiones

**Decisión D-04 (ejemplo, no ocurrida):** definir si la pantalla de error QR mostrará un código técnico o una indicación comprensible. **Contexto:** los usuarios requieren saber qué hacer sin conocer detalles internos. **Opciones:** A, solo identificador técnico; B, mensaje en lenguaje claro con identificador interno para soporte. **Criterios:** seguridad, claridad, trazabilidad, esfuerzo. **Propuesta:** B, validada por UX, QA y backend. **Riesgo:** que el mensaje revele información sobre cuentas o permisos; **mitigación:** revisión de seguridad. **Estado:** pendiente de decisión real. **Revisión prevista:** en pruebas con usuarios autorizados.

## Anexo F. Lista de verificación previa a la demostración

1. Se identificó el objetivo de la versión y las tareas de usuario incluidas.
2. Cada historia crítica tiene criterios de aceptación, responsable y evidencia de revisión.
3. Los permisos de los cuatro roles se probaron con datos de demostración.
4. Se evaluaron QR válido, inválido, repetido y condiciones de error.
5. Los mensajes se entienden y no exponen datos privados.
6. Se revisó navegación básica, contraste y una alternativa de operación para incidencias previstas.
7. No hay credenciales ni datos personales en repositorios, capturas o materiales públicos.
8. Se documentaron errores conocidos y limitaciones de la demostración.
9. El equipo practicó la exposición, asignó portavoces y preparó respuestas basadas en evidencia.
10. Las recomendaciones diferencian claramente resultados medidos de metas futuras.

# Referencias bibliográficas

Edmondson, A. (1999). Psychological safety and learning behavior in work teams. *Administrative Science Quarterly, 44*(2), 350-383. https://doi.org/10.2307/2666999

Hackman, J. R. (2002). *Leading teams: Setting the stage for great performances*. Harvard Business School Press. https://store.hbr.org/product/leading-teams-setting-the-stage-for-great-performances/3332

Schwaber, K., & Sutherland, J. (2020). *La guía Scrum: La guía definitiva de Scrum, las reglas del juego*. https://scrumguides.org/scrum-guide

Miandashti, P. (2026). *UniTrack* [Repositorio de código fuente]. GitHub. https://github.com/Peyman-mxli/unitrack

**Observación bibliográfica:** las obras citadas sustentan principios generales de equipos y coordinación; los roles, instrumentos, indicadores, cronograma y umbrales específicos son una propuesta original de aplicación al caso UniTrack.
