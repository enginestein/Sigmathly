#include <algorithm>
#include <vector>

namespace Sigmath
{
    class Polynomial
    {
    public:
        std::vector<double> _coefficients;

    public:
        Polynomial(const std::initializer_list<double>& coefficients) : _coefficients(coefficients) {}

        Polynomial(const std::vector<double>& coefficients) : _coefficients(coefficients) {}

        int Degree() const { return _coefficients.size() - 1; }

        double Evaluate(double x) const
        {
            double result = 0;
            for (int i = Degree(); i >= 0; i--)
            {
                result = result * x + _coefficients[i];
            }
            return result;
        }

        static Polynomial Divide(const Polynomial& dividend, const Polynomial& divisor)
        {
            if (dividend.Degree() < divisor.Degree())
            {
                return Polynomial({ 0 });
            }

            std::vector<double> quotientCoefficients(dividend.Degree() - divisor.Degree() + 1);
            std::vector<double> remainderCoefficients = dividend._coefficients;

            for (int i = dividend.Degree() - divisor.Degree(); i >= 0; i--)
            {
                double quotientCoefficient = remainderCoefficients[i + divisor.Degree()] / divisor._coefficients[divisor.Degree()];
                quotientCoefficients[i] = quotientCoefficient;

                for (int j = 0; j <= divisor.Degree(); j++)
                {
                    remainderCoefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
                }
            }

            std::reverse(quotientCoefficients.begin(), quotientCoefficients.end());
            return Polynomial(quotientCoefficients);
        }

        Polynomial Divide(const Polynomial& divisor) const
        {
            if (divisor.Degree() > Degree())
            {
                return Polynomial({ 0 });
            }

            Polynomial remainder = *this;
            std::vector<double> quotientCoefficients(Degree() - divisor.Degree() + 1);

            for (int i = Degree() - divisor.Degree(); i >= 0; i--)
            {
                double quotientCoefficient = remainder._coefficients[i + divisor.Degree()] / divisor._coefficients[divisor.Degree()];
                quotientCoefficients[i] = quotientCoefficient;

                for (int j = 0; j <= divisor.Degree(); j++)
                {
                    remainder._coefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
                }
            }

            std::reverse(quotientCoefficients.begin(), quotientCoefficients.end());
            return Polynomial(quotientCoefficients);
        }
    };

    Polynomial Derivative(const Polynomial& polynomial)
    {
        if (polynomial.Degree() == 0)
        {
            return Polynomial({ 0 });
        }

        std::vector<double> derivativeCoefficients(polynomial.Degree());
        for (int i = 0; i < polynomial.Degree(); i++)
        {
            derivativeCoefficients[i] = (polynomial.Degree() - i) * polynomial._coefficients[i];
        }
        return Polynomial(derivativeCoefficients);
    }
}
