# Actividad práctica — API RESTful para la Gestión de un Inventario Tecnológico

**Materia:** Aplicaciones Web Orientadas a Servicios  
**Docente:** Héctor Alonso Noriega García  
**Alumno:** Peyman Miandashti  
**Grupo:** ITIID 5AFM 2026-3  
**Fecha:** 2 de octubre de 2026 (formato de portada solicitado)  
**Entrega indicada en Classroom:** 17 de octubre de 2026

## Objetivo

Desarrollar en Python y FastAPI una API RESTful con operaciones CRUD completas y validación de datos para la entidad `DispositivoTecnologico`.

## Modelo de datos

| Campo | Tipo | Validación |
|---|---|---|
| `id` | entero | positivo y único |
| `nombre` | texto | obligatorio, no vacío |
| `categoria` | texto | `Servidor`, `Router` o `Laptop` |
| `precio` | float | estrictamente mayor que 0 |
| `disponible` | booleano | obligatorio |

Los datos se almacenan **en memoria**. Se reinician al apagar el servidor, conforme al alcance de la práctica.

## Instalación en VS Code

1. Abrir esta carpeta en Visual Studio Code.
2. Crear entorno virtual: `python -m venv .venv`
3. Activar en PowerShell: `.venv\Scripts\Activate.ps1`
4. Instalar: `pip install -r requirements.txt`
5. Ejecutar: `uvicorn main:app --reload`
6. Abrir `http://127.0.0.1:8000/docs`.

**No incluir** `.venv` ni `__pycache__` en la entrega.

## Endpoints

| Método | Ruta | Acción | Respuesta esperada |
|---|---|---|---|
| GET | `/api/v1/dispositivos` | Listar | 200 |
| GET | `/api/v1/dispositivos/{id}` | Consultar | 200 / 404 |
| POST | `/api/v1/dispositivos` | Registrar | 201 / 409 / 422 |
| PUT | `/api/v1/dispositivos/{id}` | Actualizar completo | 200 / 404 / 422 |
| DELETE | `/api/v1/dispositivos/{id}` | Eliminar | 200 / 404 |

**Ejemplo JSON para POST:**

```json
{
  "id": 101,
  "nombre": "Router empresarial",
  "categoria": "Router",
  "precio": 1499.50,
  "disponible": true
}
```

**Ejemplo JSON para PUT /api/v1/dispositivos/101:**

```json
{
  "nombre": "Router empresarial actualizado",
  "categoria": "Router",
  "precio": 1799.00,
  "disponible": false
}
```

## Pruebas automatizadas

Instalar `pip install httpx pytest` y ejecutar `pytest -q`.

Para evidencia de Classroom, ejecutar los cinco endpoints en Swagger UI (/docs) y guardar **capturas reales** de respuesta y códigos de estado en un informe PDF. El documento Word complementario es una guía técnica; no representa capturas reales de ejecución.

## Entregables

- ZIP de esta carpeta (incluye `main.py` y `requirements.txt`, sin `.venv`).
- Reporte PDF con capturas propias y verificables de cada endpoint.

Se creó esta práctica como carpeta independiente; los demás archivos del proyecto no se modificaron.
