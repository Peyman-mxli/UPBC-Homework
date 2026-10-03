import requests

API_URL = "https://pokeapi.co/api/v2/pokemon/"


def consultar_pokemon(nombre_pokemon):
    """
    Consume la PokeAPI y devuelve la información procesada
    del Pokémon solicitado.
    """

    nombre_pokemon = nombre_pokemon.strip().lower()
    url = f"{API_URL}{nombre_pokemon}"

    print("\n[*] Enviando petición HTTP GET...")
    print(f"[*] URL: {url}")

    try:
        # Se realiza la petición con un tiempo máximo de espera.
        respuesta = requests.get(url, timeout=10)

        print(f"[*] Código de estado HTTP recibido: {respuesta.status_code}")

        # Genera una excepción si la API responde con 4xx o 5xx.
        respuesta.raise_for_status()

        # Convertir el payload JSON a un diccionario de Python.
        data = respuesta.json()

        # -------------------------------------------------
        # 1. Nombre oficial
        # -------------------------------------------------
        nombre = data["name"].capitalize()

        # -------------------------------------------------
        # 2. ID de la Pokédex
        # -------------------------------------------------
        pokemon_id = data["id"]

        # -------------------------------------------------
        # 3. URL del sprite frontal por defecto
        # -------------------------------------------------
        sprite = data["sprites"]["front_default"]

        # -------------------------------------------------
        # 4. Lista de tipos como string formateado
        # -------------------------------------------------
        tipos = ", ".join(
            elemento["type"]["name"].capitalize()
            for elemento in data["types"]
        )

        # -------------------------------------------------
        # 5. Peso en kg y altura en metros
        # PokeAPI entrega ambos valores en décimas.
        # -------------------------------------------------
        peso_kg = data["weight"] / 10
        altura_m = data["height"] / 10

        # -------------------------------------------------
        # 6. Valores base de HP y Ataque
        # -------------------------------------------------
        estadisticas = {
            elemento["stat"]["name"]: elemento["base_stat"]
            for elemento in data["stats"]
        }

        hp_base = estadisticas.get("hp")
        ataque_base = estadisticas.get("attack")

        return {
            "nombre": nombre,
            "id": pokemon_id,
            "sprite": sprite,
            "tipos": tipos,
            "peso_kg": peso_kg,
            "altura_m": altura_m,
            "hp_base": hp_base,
            "ataque_base": ataque_base,
        }

    except requests.exceptions.Timeout:
        print("\n[ERROR] La solicitud excedió el tiempo máximo de espera.")

    except requests.exceptions.ConnectionError:
        print("\n[ERROR] No fue posible conectarse con PokeAPI.")
        print("Verifica tu conexión a Internet.")

    except requests.exceptions.HTTPError as error:
        if respuesta.status_code == 404:
            print("\n[ERROR 404] Pokémon no encontrado.")
            print("Verifica que el nombre esté escrito correctamente.")
        else:
            print(f"\n[ERROR HTTP] {error}")

    except requests.exceptions.RequestException as error:
        print(f"\n[ERROR DE RED] {error}")

    return None


def mostrar_reporte(pokemon):
    """Muestra en consola los seis datos solicitados en la práctica."""

    print("\n" + "=" * 60)
    print("REPORTE POKEAPI")
    print("=" * 60)
    print(f"1. Nombre oficial: {pokemon['nombre']}")
    print(f"2. ID de la Pokédex: {pokemon['id']}")
    print(f"3. Sprite frontal: {pokemon['sprite']}")
    print(f"4. Tipo(s): {pokemon['tipos']}")
    print(
        f"5. Peso: {pokemon['peso_kg']} kg | "
        f"Altura: {pokemon['altura_m']} m"
    )
    print(
        f"6. HP base: {pokemon['hp_base']} | "
        f"Ataque base: {pokemon['ataque_base']}"
    )
    print("=" * 60)


def main():
    print("=" * 60)
    print("POKEAPI BACKEND - CONSUMO DE API RESTFUL")
    print("=" * 60)

    nombre_pokemon = input("Escribe el nombre de un Pokémon: ").strip()

    if not nombre_pokemon:
        print("[ERROR] Debes escribir el nombre de un Pokémon.")
        return

    pokemon = consultar_pokemon(nombre_pokemon)

    if pokemon is not None:
        mostrar_reporte(pokemon)


if __name__ == "__main__":
    main()
