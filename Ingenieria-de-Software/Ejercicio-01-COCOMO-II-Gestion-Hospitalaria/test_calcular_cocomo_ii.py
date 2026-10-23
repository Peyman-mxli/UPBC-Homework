"""Pruebas unitarias para el caso COCOMO II UPBC."""
from math import isclose
import unittest

from calcular_cocomo_ii import COST_DRIVERS, SCALE_FACTORS, estimar


class TestCOCOMOII(unittest.TestCase):
    def test_factores_escala(self):
        self.assertEqual(len(SCALE_FACTORS), 5)
        self.assertTrue(isclose(sum(x[1] for x in SCALE_FACTORS.values()), 15.45))

    def test_17_cost_drivers(self):
        self.assertEqual(len(COST_DRIVERS) + 1, 17)  # SCED

    def test_normal(self):
        r = estimar()
        self.assertAlmostEqual(r.esfuerzo_pm, 51.87092362699477, places=8)
        self.assertAlmostEqual(r.tiempo_tdev_meses, 12.526678462858827, places=8)
        self.assertEqual(r.contratacion_redondeada_fte, 5)

    def test_acelerado(self):
        base, rapido = estimar(), estimar("Very Low")
        self.assertAlmostEqual(rapido.esfuerzo_pm / base.esfuerzo_pm, 1.43)
        self.assertAlmostEqual(rapido.tiempo_tdev_meses / base.tiempo_tdev_meses, 0.75)
        self.assertEqual(rapido.contratacion_redondeada_fte, 8)

    def test_costo_hipotetico(self):
        self.assertAlmostEqual(estimar(tarifa=30000).costo_monetario, 1556127.708809843)

    def test_validar_tarifa(self):
        with self.assertRaises(ValueError):
            estimar(tarifa=-1)


if __name__ == "__main__":
    unittest.main()
