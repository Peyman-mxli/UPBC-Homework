# Tarea — MediLink: Red de Citas Médicas Integradas

## Instrucciones

Analizar el caso de negocio e ingeniería de MediLink aplicando conceptos de **Aplicaciones Web Orientadas a Servicios**, **Fundamentos SOA** y **Modelos de la Nube**.

---

## Caso de estudio

MediLink es una startup con una aplicación web monolítica construida hace aproximadamente cinco años. Debido al aumento de tráfico, la aplicación se encuentra saturada y necesita integrarse con tres entidades externas:

- **Aseguradoras médicas:** validar la vigencia de las pólizas antes de agendar una cita.
- **Stripe / PayPal:** procesar pagos de consultas mediante tarjeta.
- **Twilio:** enviar recordatorios SMS en tiempo real.

El backend actual utiliza **Java 8** y una base de datos **MySQL** local. Las aseguradoras usan sistemas antiguos en **Windows + C#**, mientras que la pasarela de pagos trabaja con interfaces basadas en **Node.js / JSON**.

---

# SECCIÓN A — Conceptualización del Modelo de Servicios

## 1. Estrategia de Interoperabilidad

### ¿Qué pide?

Explicar cómo MediLink puede comunicarse con sistemas escritos en tecnologías distintas sin tener que reprogramar todo desde cero.

### Respuesta

Las Aplicaciones Web Orientadas a Servicios permiten que MediLink se comunique con sistemas desarrollados en tecnologías diferentes mediante servicios o API con contratos e interfaces estandarizadas.

El backend de MediLink en Java puede consumir un servicio de una aseguradora desarrollado en C# siempre que ambos respeten el mismo contrato de comunicación. La integración se realiza utilizando protocolos independientes del lenguaje, como **HTTP/HTTPS**, y formatos de intercambio de datos como **JSON o XML**.

De la misma manera, MediLink puede integrarse con Stripe o PayPal mediante sus API basadas en JSON. De esta forma, el lenguaje y el sistema operativo dejan de ser el punto principal de integración. Lo importante es saber qué endpoint utilizar, qué datos enviar y qué respuesta esperar.

Esto reduce el acoplamiento entre sistemas, facilita el mantenimiento y permite modernizar la plataforma gradualmente.

---

## 2. Definición del Contrato de Servicio

### ¿Qué pide?

Explicar por qué es importante definir un contrato de servicio antes de programar la integración con una pasarela de pagos y qué ocurriría si el proveedor cambia su estructura de datos sin previo aviso.

### Respuesta

Un **Contrato de Servicio** es crítico porque establece explícitamente las reglas de comunicación entre MediLink y la pasarela de pagos.

Una especificación **OpenAPI / Swagger** puede documentar:

- Endpoints disponibles.
- Métodos HTTP.
- Parámetros.
- Estructura de solicitudes.
- Estructura de respuestas.
- Tipos de datos.
- Autenticación.
- Códigos de respuesta.
- Posibles errores.

Al establecer el contrato antes de comenzar el desarrollo, ambos equipos trabajan sobre una referencia común.

Si la pasarela cambia sin aviso el nombre de un campo, elimina un atributo obligatorio o modifica el formato de respuesta, MediLink podría dejar de interpretar correctamente la información. Como consecuencia, pueden producirse transacciones fallidas, excepciones, cobros incompletos o imposibilidad de confirmar una cita.

Por ello, los cambios deben documentarse, versionarse y mantener compatibilidad cuando sea posible.

---

# SECCIÓN B — Despliegue del Rol SOA

## Asignación de roles

| Rol SOA | Componente del caso | Función exacta |
|---|---|---|
| **Service Provider — Proveedor** | Aseguradoras, Stripe/PayPal y Twilio | Publican y ofrecen servicios: validación de pólizas, pagos y envío de SMS. |
| **Service Requester — Consumidor** | MediLink | Consume los servicios externos cuando necesita validar una póliza, procesar un pago o enviar una alerta. |
| **Service Registry — Registro/Broker** | Catálogo de servicios / API Management | Mantiene información sobre servicios, contratos, versiones, endpoints y políticas para que puedan localizarse y utilizarse correctamente. |

---

## Pregunta de criterio técnico — Statelessness

### ¿Qué pide?

Analizar por qué guardar las respuestas de las aseguradoras dentro de la sesión del servidor puede afectar la escalabilidad de MediLink.

### Respuesta

Guardar las respuestas de las aseguradoras dentro de la sesión del servidor introduce estado asociado a una instancia concreta.

En una arquitectura horizontal con varias instancias detrás de un balanceador de carga, una solicitud posterior del mismo usuario podría llegar a otro servidor que no contiene esa sesión.

Para evitarlo sería necesario utilizar **sticky sessions** o replicar el estado entre servidores. Esto aumenta:

- El acoplamiento entre instancias.
- El consumo de memoria.
- La complejidad operativa.
- La dependencia de una instancia específica.

Además, si una instancia falla, el estado almacenado localmente puede perderse.

El principio de **Statelessness** propone que cada solicitud incluya la información necesaria para ser procesada sin depender de memoria conversacional guardada en el servidor. Esto facilita añadir o retirar instancias dinámicamente y permite que cualquier servidor atienda cualquier solicitud.

Si se desea reducir consultas repetitivas, puede utilizarse una **caché compartida con expiración controlada**, evitando convertir la sesión local en una dependencia obligatoria.

---

# SECCIÓN C — Migración y Estrategia de Nube

## Propuesta 1 — IaaS

- Amazon EC2.
- Máquinas virtuales.
- Instalación y administración manual del sistema operativo.
- Configuración de MySQL.
- Despliegue del monolito.
- Mayor responsabilidad operativa del equipo.

## Propuesta 2 — PaaS

- Modularización de citas, pagos y alertas.
- Microservicios independientes.
- Contenedores Docker.
- Plataforma administrada como **Google Cloud Run** o **AWS Elastic Beanstalk**.

---

## Elección

### Propuesta seleccionada: **Propuesta 2 — PaaS**

La propuesta más adecuada para garantizar escalabilidad horizontal automática y alta disponibilidad es la alternativa PaaS con microservicios, contenedores Docker y una plataforma administrada.

Separar citas, pagos y alertas permite que cada servicio escale de forma independiente según su carga real. Por ejemplo, si aumenta la demanda de citas, pueden añadirse nuevas instancias del servicio de citas sin tener que aumentar los recursos del servicio de notificaciones.

Desde el paradigma de nube, PaaS reduce la responsabilidad operativa porque el proveedor administra gran parte de la infraestructura, el aprovisionamiento, el balanceo de carga y la disponibilidad.

Los contenedores también aportan portabilidad y consistencia entre ambientes, mientras que los microservicios favorecen el aislamiento de fallos.

La alternativa IaaS con EC2 proporciona mayor control, pero exige administrar manualmente sistemas operativos, parches, clústeres, escalamiento, balanceadores e infraestructura. Además, mantener el monolito limita la posibilidad de escalar únicamente el componente que lo necesita.

---

## Ventajas principales de la propuesta elegida

| Concepto | Aplicación en MediLink |
|---|---|
| **Escalabilidad horizontal** | Se crean nuevas instancias cuando aumenta la demanda. |
| **Elasticidad** | Los recursos pueden crecer o reducirse según el tráfico real. |
| **Alta disponibilidad** | Varias instancias reducen el impacto de fallas individuales. |
| **Desacoplamiento** | Cada microservicio puede evolucionar, desplegarse y escalar por separado. |
| **Menor carga operativa** | El proveedor cloud administra una parte importante de la infraestructura. |
| **Portabilidad** | Docker mantiene un entorno uniforme entre desarrollo, pruebas y producción. |

---

# Conclusión

La modernización de MediLink debe basarse en servicios interoperables, contratos bien definidos y principios SOA que favorezcan el desacoplamiento y la ausencia de estado.

Complementar estos principios con una arquitectura de microservicios desplegada sobre una plataforma PaaS permite responder mejor a los incrementos de tráfico, integrar proveedores externos y mejorar la disponibilidad general del sistema.
