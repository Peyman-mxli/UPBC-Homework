"""COCOMO II.2000 Post-Architecture, precisión agrícola IoT, 35 KSLOC.

Todos los drivers no especificados son Nominal (1.00), incluido SCED.
Ejemplos: py calcular_cocomo_ii_iot.py --json
          py calcular_cocomo_ii_iot.py --tarifa 30000 --inversion 250000
"""
import argparse
import json
from dataclasses import dataclass, asdict
from math import ceil

KSLOC = 35
SCALE = {
    'PREC': {'Low': 4.96},
    'FLEX': {'Low': 4.05},
    'RESL': {'Low': 5.65, 'High': 2.83},
    'TEAM': {'Nominal': 3.29},
    'PMAT': {'Low': 6.24},
}
EM = {'TIME': {'High': 1.11}, 'STOR': {'Nominal': 1.0},
      'PVOL': {'High': 1.15}, 'PLEX': {'Low': 1.09, 'High': 0.91},
      'TOOL': {'Nominal': 1.0}}

@dataclass(frozen=True)
class Estimate:
    scenario: str
    ksloc: float
    sf_total: float
    E: float
    EAF: float
    F: float
    PM: float
    TDEV_months: float
    FTE: float
    people_rounded: int
    labor_cost_mxn: float | None

def estimate(improved=False, rate=None):
    if rate is not None and rate < 0:
        raise ValueError('La tarifa no puede ser negativa')
    sf_total = 4.96 + 4.05 + (2.83 if improved else 5.65) + 3.29 + 6.24
    E = 0.91 + 0.01 * sf_total
    EAF = 1.11 * 1.15 * (0.91 if improved else 1.09)
    PM = 2.94 * KSLOC ** E * EAF
    F = 0.28 + 0.2 * (E - 0.91)
    TDEV = 3.67 * PM ** F  # SCED Nominal
    FTE = PM / TDEV
    return Estimate('Mejora' if improved else 'Base', KSLOC, sf_total, E,
                    EAF, F, PM, TDEV, FTE, ceil(FTE), None if rate is None else PM * rate)

def analyze(rate=None, investment=None):
    if investment is not None and investment < 0:
        raise ValueError('La inversión no puede ser negativa')
    base, better = estimate(rate=rate), estimate(True, rate)
    dp, dt = base.PM - better.PM, base.TDEV_months - better.TDEV_months
    result = {'base': asdict(base), 'improved': asdict(better),
              'saved_PM': dp, 'saved_months': dt,
              'effort_reduction_percent': 100 * dp / base.PM,
              'schedule_reduction_percent': 100 * dt / base.TDEV_months}
    if rate is not None:
        result['labor_savings_mxn'] = dp * rate
        if investment is not None:
            result['incremental_investment_mxn'] = investment
            result['net_benefit_mxn'] = dp * rate - investment
            result['roi_percent'] = 100 * (dp * rate - investment) / investment if investment else None
    return result

def main():
    parser = argparse.ArgumentParser(description='Ejercicio 2 COCOMO II - IoT agrícola')
    parser.add_argument('--json', action='store_true')
    parser.add_argument('--tarifa', type=float, default=None, help='MXN por PM (supuesto)')
    parser.add_argument('--inversion', type=float, default=None, help='MXN incrementales (supuesto)')
    opts = parser.parse_args()
    result = analyze(opts.tarifa, opts.inversion)
    if opts.json:
        print(json.dumps(result, indent=2, ensure_ascii=False))
    else:
        for key in ('base', 'improved'):
            r = result[key]
            print(f"{r['scenario']}: {r['PM']:.2f} PM; {r['TDEV_months']:.2f} meses; {r['FTE']:.2f} FTE (~{r['people_rounded']} personas)")
        print(f"Ahorro: {result['saved_PM']:.2f} PM; adelanto: {result['saved_months']:.2f} meses")
        if opts.tarifa is not None:
            print(f"Ahorro laboral hipotético: ${result['labor_savings_mxn']:,.2f} MXN")
        if opts.tarifa is not None and opts.inversion is not None:
            print(f"Beneficio neto hipotético: ${result['net_benefit_mxn']:,.2f} MXN")

if __name__ == '__main__':
    main()
