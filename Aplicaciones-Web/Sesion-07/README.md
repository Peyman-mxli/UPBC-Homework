# Sesión 07 — Práctica Backend: Consumo de APIs RESTful

## Universidad Politécnica de Baja California (UPBC)

**Carrera:** Ingeniería en Tecnologías de la Información e Innovación Digital  
**Materia:** Aplicaciones Web Orientadas a Servicios  
**Profesor:** Héctor Alonso Noriega García  
**Alumno:** Peyman Miyandashti  
**Fecha:** 03 de octubre de 2026

---

## Descripción de la práctica

Esta práctica consiste en diseñar e implementar un script de backend con **Python 3** que consuma un servicio web **RESTful externo**, procese el payload **JSON** recibido y presente un reporte formateado en la consola.

Para esta actividad se seleccionó **PokeAPI**:

```text
https://pokeapi.co/api/v2/pokemon/{nombre}
```

PokeAPI es una API pública y gratuita. Para las consultas utilizadas en esta práctica **no se requiere API Key**.

---

## Objetivos

- Consumir una API RESTful desde Python.
- Realizar una petición HTTP GET con la librería `requests`.
- Procesar una respuesta JSON.
- Extraer y transformar información específica.
- Manejar códigos de estado HTTP.
- Capturar excepciones de red y tiempos de espera.
- Ejecutar el backend desde la terminal de Visual Studio Code.
- Trabajar dentro de un entorno virtual de Python.
- Documentar dependencias mediante `requirements.txt`.

---

## Datos requeridos por la actividad

El programa extrae exactamente los datos solicitados de cada Pokémon:

1. Nombre oficial.
2. ID de la Pokédex.
3. URL del sprite frontal por defecto.
4. Lista de tipos en formato legible.
5. Peso convertido a kilogramos y altura convertida a metros.
6. Valores base de HP y Ataque.

---

## Estructura del proyecto

```text
Sesion-07/
├── README.md
└── PokeAPI_Backend/
    ├── pokemon_api.py
    ├── list_pokemon.py
    ├── requirements.txt
    └── docs/
        └── HTTP_ERRORS.md
```

> El entorno virtual `.venv` se crea de forma local y no se sube al repositorio.

---

## Configuración en Visual Studio Code

### 1. Crear el entorno virtual

Desde la terminal, dentro de la carpeta `PokeAPI_Backend`:

```powershell
py -3.12 -m venv .venv
```

### 2. Activar el entorno virtual en Windows PowerShell

```powershell
.\.venv\Scripts\Activate.ps1
```

Cuando esté activo, la terminal mostrará algo similar a:

```text
(.venv) PS C:\PokeAPI_Backend>
```

### 3. Instalar las dependencias

```powershell
pip install -r requirements.txt
```

---

## Ejecución del programa principal

```powershell
python pokemon_api.py
```

El programa solicita por teclado el nombre de un Pokémon.

Ejemplo:

```text
Escribe el nombre de un Pokémon: pikachu
```

Una consulta correcta devuelve un código HTTP **200** y muestra los seis elementos solicitados.

Ejemplo de datos para Pikachu:

```text
Nombre oficial: Pikachu
ID de la Pokédex: 25
Tipo(s): Electric
Peso: 6.0 kg
Altura: 0.4 m
HP base: 35
Ataque base: 55
```

---

## Archivo auxiliar de nombres

El archivo `list_pokemon.py` consulta PokeAPI y muestra ejemplos de nombres válidos que pueden utilizarse con el programa principal.

Ejecución:

```powershell
python list_pokemon.py
```

---

## Manejo de errores

El programa utiliza:

- `requests.get(..., timeout=10)`
- `raise_for_status()`
- `requests.exceptions.Timeout`
- `requests.exceptions.ConnectionError`
- `requests.exceptions.HTTPError`
- `requests.exceptions.RequestException`

Los códigos HTTP y las excepciones utilizadas están explicados con mayor detalle en:

```text
PokeAPI_Backend/docs/HTTP_ERRORS.md
```

---

## Conclusión

La práctica demuestra el flujo completo de consumo de una API RESTful desde un backend en Python: envío de una petición HTTP, recepción del payload JSON, procesamiento de datos, conversión de unidades, presentación de resultados y manejo de errores.

El proyecto también aplica buenas prácticas básicas de desarrollo, como el uso de un entorno virtual, un archivo de dependencias y documentación técnica separada para los códigos HTTP y las excepciones de red.
