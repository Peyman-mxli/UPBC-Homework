import requests

LIST_URL = "https://pokeapi.co/api/v2/pokemon"
LIMITE = 100


def obtener_nombres_pokemon(limite=LIMITE):
    """
    Consulta PokeAPI y devuelve una lista de nombres válidos
    que pueden utilizarse en pokemon_api.py.
    """

    parametros = {
        "limit": limite,
        "offset": 0,
    }

    print("[*] Consultando lista de Pokémon...")

    try:
        respuesta = requests.get(
            LIST_URL,
            params=parametros,
            timeout=10,
        )

        print(f"[*] Código HTTP: {respuesta.status_code}")
        respuesta.raise_for_status()

        data = respuesta.json()

        return [
            pokemon["name"]
            for pokemon in data["results"]
        ]

    except requests.exceptions.Timeout:
        print("[ERROR] La solicitud excedió el tiempo máximo de espera.")

    except requests.exceptions.ConnectionError:
        print("[ERROR] No fue posible conectarse con PokeAPI.")

    except requests.exceptions.HTTPError as error:
        print(f"[ERROR HTTP] {error}")

    except requests.exceptions.RequestException as error:
        print(f"[ERROR DE RED] {error}")

    return []


def mostrar_nombres(nombres):
    if not nombres:
        print("No se pudieron obtener nombres de Pokémon.")
        return

    print("\nNOMBRES VÁLIDOS DE POKÉMON")
    print("=" * 40)

    for indice, nombre in enumerate(nombres, start=1):
        print(f"{indice:>3}. {nombre}")

    print("=" * 40)
    print(
        "Puedes copiar cualquiera de estos nombres "
        "y utilizarlo en pokemon_api.py."
    )


def main():
    nombres = obtener_nombres_pokemon()
    mostrar_nombres(nombres)


if __name__ == "__main__":
    main()
