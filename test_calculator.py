import calculator


class TestCalculator:
    def test_addition(self):
        assert 4 == calculator.add(2, 2)

    def test_subtration(self):
        assert 5 == calculator.subtract(7, 2)

    def test_multiplication(self):
        assert 10 == calculator.multiply(2, 5)
