# ☁️ Sesión 06 — MediLink: Servicios, SOA y Estrategia de Nube

> **Aplicaciones Web Orientadas a Servicios — Universidad Politécnica de Baja California (UPBC)**  
> Caso de estudio sobre **interoperabilidad**, **contratos de servicio**, **SOA**, **Statelessness**, **microservicios** y **modelos de nube**.

---

## 📘 Tarea

**Caso de estudio:** `MediLink - Red de Citas Médicas Integradas`

MediLink cuenta con una aplicación web monolítica desarrollada en **Java 8** y una base de datos **MySQL** local. Debido al crecimiento del tráfico, la aplicación necesita modernizarse e integrarse con servicios externos desarrollados con tecnologías diferentes.

Los sistemas externos son:

- **Aseguradoras médicas:** validación de vigencia de pólizas antes de agendar una cita.
- **Stripe / PayPal:** procesamiento de pagos con tarjeta.
- **Twilio:** envío de recordatorios y notificaciones SMS en tiempo real.

Además, las aseguradoras trabajan con sistemas antiguos en **Windows + C#**, mientras que la pasarela de pagos utiliza interfaces basadas en **Node.js / JSON**.

---

## ❓ ¿Qué pedía la actividad?

La tarea estaba dividida en tres partes principales.

### SECCIÓN A — Conceptualización del Modelo de Servicios

Se debía explicar:

1. Cómo una arquitectura orientada a servicios permite que **Java, C# y JSON** se comuniquen sin reescribir todos los sistemas.
2. Por qué es necesario definir un **Contrato de Servicio**, por ejemplo mediante **OpenAPI / Swagger**, antes de integrar la pasarela de pagos.
3. Qué consecuencias tendría que la pasarela modificara su estructura de datos sin previo aviso.

### SECCIÓN B — Despliegue del Rol SOA

Se debía identificar dentro del caso los tres roles básicos de SOA:

- **Service Provider**
- **Service Requester**
- **Service Registry**

También se debía analizar una propuesta para guardar las respuestas de las aseguradoras dentro de la sesión del servidor de MediLink y explicar por qué esto podría violar el principio de **Statelessness** y afectar la escalabilidad.

### SECCIÓN C — Migración y Estrategia de Nube

Se comparaban dos propuestas:

- **Propuesta 1 — IaaS:** Amazon EC2, administración manual del sistema operativo, MySQL y el monolito.
- **Propuesta 2 — PaaS:** microservicios, Docker y una plataforma administrada como **Google Cloud Run** o **AWS Elastic Beanstalk**.

La actividad pedía elegir la opción más adecuada para obtener **escalabilidad horizontal automática** y **alta disponibilidad**.

---

# ✅ Nuestra respuesta

## A. Estrategia de Interoperabilidad

Las Aplicaciones Web Orientadas a Servicios permiten que MediLink se comunique con sistemas construidos con tecnologías diferentes mediante **API**, protocolos estándar como **HTTP/HTTPS** y formatos de intercambio como **JSON o XML**.

Esto significa que MediLink puede mantener su backend en Java y consumir un servicio de una aseguradora escrito en C#, siempre que ambos respeten el mismo contrato de comunicación. De la misma manera, puede conectarse con Stripe o PayPal mediante sus API basadas en JSON.

La integración deja de depender del lenguaje de programación o del sistema operativo y pasa a depender de una **interfaz bien definida**: endpoint, datos enviados, datos recibidos y reglas del servicio. Esto reduce el acoplamiento y permite modernizar el sistema gradualmente.

---

## A. Contrato de Servicio

Un **Contrato de Servicio** establece formalmente cómo deben comunicarse los sistemas.

Una especificación como **OpenAPI / Swagger** puede definir:

- Endpoints disponibles.
- Métodos HTTP.
- Parámetros.
- Estructura de solicitudes y respuestas.
- Tipos de datos.
- Autenticación.
- Códigos de estado y errores.

Si Stripe, PayPal u otro proveedor cambia sin previo aviso el nombre de un campo, elimina un atributo obligatorio o modifica el formato de respuesta, MediLink podría dejar de interpretar correctamente la información. Esto puede ocasionar **errores de integración, pagos fallidos, excepciones o citas que no puedan confirmarse**.

Por ello, los cambios de una API deben documentarse y versionarse.

---

## B. Roles del modelo SOA

| Rol SOA | Componente en MediLink | Función |
|---|---|---|
| **Service Provider** | Aseguradoras, Stripe/PayPal y Twilio | Publican servicios para validar pólizas, procesar pagos y enviar SMS. |
| **Service Requester** | MediLink | Consume los servicios externos cuando necesita validar, cobrar o notificar. |
| **Service Registry** | Catálogo de servicios / API Management | Mantiene información de servicios, contratos, versiones, endpoints y políticas. |

---

## B. Statelessness y escalabilidad

Guardar la información de las aseguradoras directamente en la sesión de una instancia del servidor introduce **estado local**.

En una arquitectura con varias instancias detrás de un balanceador de carga, la siguiente solicitud del usuario puede llegar a un servidor diferente que no contiene esa sesión.

Esto obligaría a utilizar mecanismos como:

- **Sticky sessions**.
- Replicación de sesiones.
- Mayor consumo de memoria.
- Sincronización adicional entre servidores.

También aumenta la dependencia de una instancia concreta: si esa instancia falla, la sesión puede perderse.

El principio de **Statelessness** indica que cada petición debe contener la información necesaria para ser procesada sin depender del estado almacenado localmente por el servidor. Así, cualquier instancia puede atender cualquier solicitud y el sistema puede escalar horizontalmente con mayor facilidad.

Si se necesita reducir consultas repetitivas, una alternativa más adecuada es utilizar una **caché compartida y controlada con tiempo de expiración**.

---

## C. Estrategia seleccionada

### ✅ Propuesta 2 — PaaS + Microservicios + Docker

Elegimos la **Propuesta 2** porque es la opción que mejor cumple con los objetivos de **escalabilidad horizontal automática** y **alta disponibilidad**.

Separar citas, pagos y notificaciones en microservicios permite que cada componente escale de forma independiente según su demanda. Por ejemplo, si aumenta el número de citas, se pueden crear más instancias únicamente del servicio de citas sin aumentar innecesariamente los recursos del servicio de notificaciones.

Una plataforma administrada como Google Cloud Run o AWS Elastic Beanstalk reduce la carga operativa porque el proveedor administra una parte importante de la infraestructura, el aprovisionamiento, el balanceo de carga y la disponibilidad.

### Ventajas principales

| Concepto | Beneficio |
|---|---|
| **Escalabilidad horizontal** | Creación automática de nuevas instancias cuando aumenta la demanda. |
| **Elasticidad** | Los recursos crecen o disminuyen según el tráfico real. |
| **Alta disponibilidad** | Varias instancias reducen el impacto de fallas individuales. |
| **Desacoplamiento** | Cada microservicio puede evolucionar y desplegarse de forma independiente. |
| **Menor carga operativa** | El proveedor cloud administra gran parte de la infraestructura. |
| **Portabilidad** | Docker mantiene un entorno consistente entre desarrollo, pruebas y producción. |

La alternativa IaaS con EC2 ofrece más control, pero también requiere administrar manualmente sistemas operativos, parches, clústeres, balanceadores y escalamiento. Además, continuar con un monolito limita la capacidad de escalar solamente la parte que realmente necesita más recursos.

---

## 🧠 Conclusión

La modernización de MediLink requiere tres elementos principales:

```text
Interoperabilidad
      +
Contratos de Servicio
      +
Arquitectura SOA / Cloud
```

El uso de servicios interoperables permite integrar tecnologías distintas sin reescribir todos los sistemas. Los contratos de servicio reducen errores y establecen reglas claras de integración. Finalmente, una arquitectura PaaS basada en microservicios y contenedores facilita el escalamiento automático, el aislamiento de fallos y la alta disponibilidad.

---

## 📄 Entrega

La versión completa de la tarea está incluida en esta carpeta en formato Markdown:

**[MediLink-Tarea.md](./MediLink-Tarea.md)**

---

## 👤 Información académica

- **Alumno:** Peyman Miyandashti
- **Asignatura:** Aplicaciones Web Orientadas a Servicios
- **Grupo:** 5AFM
- **Periodo:** 2026–2027
- **Universidad:** Universidad Politécnica de Baja California
