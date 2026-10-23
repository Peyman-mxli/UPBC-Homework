"""Pruebas reproducibles de ambos escenarios COCOMO II.2000."""
import unittest
from calcular_cocomo_ii_iot import estimate, analyze

class TestCOCOMOIIAgricultura(unittest.TestCase):
    def test_base(self):
        b=estimate()
        self.assertAlmostEqual(b.sf_total,24.19)
        self.assertAlmostEqual(b.EAF,1.391385)
        self.assertAlmostEqual(b.PM,245.70083238228932,places=6)
        self.assertAlmostEqual(b.TDEV_months,22.368032891493808,places=6)
        self.assertEqual(b.people_rounded,11)
    def test_improved(self):
        m=estimate(True)
        self.assertAlmostEqual(m.sf_total,21.37)
        self.assertAlmostEqual(m.EAF,1.161615)
        self.assertAlmostEqual(m.PM,185.55762417749784,places=6)
        self.assertAlmostEqual(m.TDEV_months,19.80591510731197,places=6)
        self.assertEqual(m.people_rounded,10)
    def test_savings(self):
        x=analyze()
        self.assertAlmostEqual(x['saved_PM'],60.14320820479148,places=6)
        self.assertAlmostEqual(x['saved_months'],2.5621177841818366,places=6)
        self.assertAlmostEqual(x['effort_reduction_percent'],24.47822729033894,places=6)
    def test_financial_example(self):
        x=analyze(30000,250000)
        self.assertAlmostEqual(x['labor_savings_mxn'],1804296.2461437443,places=2)
        self.assertAlmostEqual(x['net_benefit_mxn'],1554296.2461437443,places=2)
    def test_bad_inputs(self):
        with self.assertRaises(ValueError):estimate(rate=-1)
        with self.assertRaises(ValueError):analyze(investment=-1)

if __name__ == '__main__':unittest.main()
