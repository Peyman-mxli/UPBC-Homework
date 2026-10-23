"""Estimación reproducible COCOMO II.2000 - Caso hospitalario (UPBC).

Uso:
    py calcular_cocomo_ii.py
    py calcular_cocomo_ii.py --tarifa 30000
    py calcular_cocomo_ii.py --json

El cálculo supone código nuevo, 15 KSLOC y todos los cost drivers
no especificados por el ejercicio en Nominal (EM = 1.00).
"""
from __future__ import annotations

import argparse
import json
from dataclasses import asdict, dataclass
from math import ceil, prod

KSLOC = 15.0
SCALE_FACTORS = {
    "PREC": ("Nominal", 3.72),
    "FLEX": ("High", 2.03),
    "RESL": ("High", 2.83),
    "TEAM": ("High", 2.19),
    "PMAT": ("Nominal", 4.68),
}
COST_DRIVERS = {
    "RELY": ("High", 1.10),
    "DATA": ("High", 1.14),
    "CPLX": ("High", 1.17),
    "ACAP": ("High", 0.85),
    "PCAP": ("High", 0.88),
    "TOOL": ("High", 0.90),
    "RUSE": ("Nominal", 1.00),
    "DOCU": ("Nominal", 1.00),
    "TIME": ("Nominal", 1.00),
    "STOR": ("Nominal", 1.00),
    "PVOL": ("Nominal", 1.00),
    "PCON": ("Nominal", 1.00),
    "APEX": ("Nominal", 1.00),
    "PLEX": ("Nominal", 1.00),
    "LTEX": ("Nominal", 1.00),
    "SITE": ("Nominal", 1.00),
}
SCED_CONFIG = {
    "Nominal": (1.00, 1.00),  # (multiplicador de esfuerzo, fracción TDEV)
    "Very Low": (1.43, 0.75),
}


@dataclass(frozen=True)
class Estimacion:
    sced: str
    tamano_ksloc: float
    suma_sf: float
    exponente_e: float
    eaf_sin_sced: float
    exponente_f: float
    esfuerzo_pm: float
    tiempo_tdev_meses: float
    equipo_promedio_fte: float
    contratacion_redondeada_fte: int
    costo_monetario: float | None


def estimar(sced: str = "Nominal", tarifa: float | None = None) -> Estimacion:
    """COCOMO II Post-Architecture, ecuación original con TDEV sin SCED."""
    if sced not in SCED_CONFIG:
        raise ValueError(f"SCED no soportado: {sced!r}")
    if tarifa is not None and tarifa < 0:
        raise ValueError("La tarifa por persona-mes no puede ser negativa")

    suma_sf = sum(valor for _, valor in SCALE_FACTORS.values())
    exponente_e = 0.91 + 0.01 * suma_sf
    eaf_sin_sced = prod(valor for _, valor in COST_DRIVERS.values())
    pm_sin_sced = 2.94 * KSLOC ** exponente_e * eaf_sin_sced
    exponente_f = 0.28 + 0.2 * (exponente_e - 0.91)
    tdev_nominal = 3.67 * pm_sin_sced ** exponente_f

    multiplicador_sced, factor_tiempo = SCED_CONFIG[sced]
    pm_final = pm_sin_sced * multiplicador_sced
    tdev_final = tdev_nominal * factor_tiempo
    equipo = pm_final / tdev_final
    return Estimacion(
        sced=sced,
        tamano_ksloc=KSLOC,
        suma_sf=suma_sf,
        exponente_e=exponente_e,
        eaf_sin_sced=eaf_sin_sced,
        exponente_f=exponente_f,
        esfuerzo_pm=pm_final,
        tiempo_tdev_meses=tdev_final,
        equipo_promedio_fte=equipo,
        contratacion_redondeada_fte=ceil(equipo),
        costo_monetario=None if tarifa is None else pm_final * tarifa,
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tarifa", type=float, default=None,
                        help="Costo por persona-mes en una misma moneda (opcional).")
    parser.add_argument("--json", action="store_true", help="Salida JSON reproducible.")
    args = parser.parse_args()
    original = estimar("Nominal", args.tarifa)
    acelerado = estimar("Very Low", args.tarifa)
    if args.json:
        print(json.dumps({"nominal": asdict(original), "acelerado": asdict(acelerado)},
                         ensure_ascii=False, indent=2))
        return
    print("ESTIMACIÓN COCOMO II - 15 KSLOC - SISTEMA HOSPITALARIO")
    print(f"Suma SF: {original.suma_sf:.2f} | E: {original.exponente_e:.4f} | "
          f"EAF: {original.eaf_sin_sced:.9f} | F: {original.exponente_f:.4f}")
    for r in (original, acelerado):
        print(f"\nSCED {r.sced}: {r.esfuerzo_pm:.2f} PM; "
              f"TDEV {r.tiempo_tdev_meses:.2f} meses; "
              f"equipo {r.equipo_promedio_fte:.2f} FTE "
              f"(contratación {r.contratacion_redondeada_fte} FTE)")
        if r.costo_monetario is not None:
            print(f"Costo laboral ilustrativo: {r.costo_monetario:,.2f}")
    print("\nSCED Very Low: -25 % tiempo, +43 % esfuerzo.")
    print("Nota: PM/TDEV son estimaciones teóricas de COCOMO II.2000.")


if __name__ == "__main__":
    main()