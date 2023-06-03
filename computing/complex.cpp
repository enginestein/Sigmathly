
#include "basic.h"

namespace Sigmath
{
    class Compl
    {
    public:
        struct Complex
        {
            double Real;
            double Imaginary;

            Complex(double real, double imaginary)
                : Real(real), Imaginary(imaginary)
            {
            }

            Complex operator +(const Complex& other) const
            {
                return Complex(Real + other.Real, Imaginary + other.Imaginary);
            }

            Complex operator -(const Complex& other) const
            {
                return Complex(Real - other.Real, Imaginary - other.Imaginary);
            }

            Complex operator *(const Complex& other) const
            {
                return Complex(Real * other.Real - Imaginary * other.Imaginary, Real * other.Imaginary + Imaginary * other.Real);
            }

            Complex operator /(const Complex& other) const
            {
                double denominator = other.Real * other.Real + other.Imaginary * other.Imaginary;
                double numeratorReal = Real * other.Real + Imaginary * other.Imaginary;
                double numeratorImaginary = Imaginary * other.Real - Real * other.Imaginary;

                return Complex(numeratorReal / denominator, numeratorImaginary / denominator);
            }

            explicit Complex(int v)
            {
                throw std::runtime_error("Conversion from int to Complex is not implemented");
            }
        };

        static double Abs(const Complex& a)
        {
            return Basic::SquareRoot(a.Real * a.Real + a.Imaginary * a.Imaginary);
        }

        static double Magnitude(const Complex& number)
        {
            return Basic::SquareRoot(number.Real * number.Real + number.Imaginary * number.Imaginary);
        }
    };
}
