#include <cmath>
#include <stdexcept>

namespace Sigmath
{
    class Hyperbolic
    {
    public:
        static double Sinh(double x)
        {
            return (std::exp(x) - std::exp(-x)) / 2;
        }

        static double Cosh(double x)
        {
            return (std::exp(x) + std::exp(-x)) / 2;
        }

        static double Tanh(double x)
        {
            return Sinh(x) / Cosh(x);
        }

        static double Sech(double x)
        {
            return 1 / Cosh(x);
        }

        static double Csch(double x)
        {
            return 1 / Sinh(x);
        }

        static double Coth(double x)
        {
            return 1 / Tanh(x);
        }

        static double Asinh(double x)
        {
            return std::log(x + std::sqrt(std::pow(x, 2) + 1));
        }

        static double Acosh(double x)
        {
            if (x < 1)
            {
                throw std::invalid_argument("Input to inverse hyperbolic cosine function must be greater than or equal to 1");
            }
            return std::log(x + std::sqrt(std::pow(x, 2) - 1));
        }

        static double Atanh(double x)
        {
            if (x <= -1 || x >= 1)
            {
                throw std::invalid_argument("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)");
            }
            return 0.5 * std::log((1 + x) / (1 - x));
        }

        static double Asech(double x)
        {
            if (x <= 0 || x >= 1)
            {
                throw std::invalid_argument("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)");
            }
            return Acosh(1 / x);
        }

        static double Acsch(double x)
        {
            if (x <= 0)
            {
                throw std::invalid_argument("Input to inverse hyperbolic cosecant function must be greater than 0");
            }
            return Asinh(1 / x);
        }

        static double Acoth(double x)
        {
            if (x <= -1 || x >= 1)
            {
                throw std::invalid_argument("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)");
            }
            return 0.5 * std::log((x + 1) / (x - 1));
        }
    };
}
