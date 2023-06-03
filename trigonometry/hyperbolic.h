#ifndef SIGMATH_HYPERBOLIC_H
#define SIGMATH_HYPERBOLIC_H

#include <cmath>
#include <stdexcept>

namespace Sigmath
{
    class Hyperbolic
    {
    public:
        static double Sinh(double x);
        static double Cosh(double x);
        static double Tanh(double x);
        static double Sech(double x);
        static double Csch(double x);
        static double Coth(double x);
        static double Asinh(double x);
        static double Acosh(double x);
        static double Atanh(double x);
        static double Asech(double x);
        static double Acsch(double x);
        static double Acoth(double x);
    };
}

#endif // SIGMATH_HYPERBOLIC_H
