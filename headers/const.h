#ifndef SIGMATH_TRIG_H
#define SIGMATH_TRIG_H

#include <cmath>
#include <stdexcept>

namespace Sigmath
{
    class Trig
    {
    public:
        static double Sin(double x);
        static double Cos(double x);
        static double Tan(double x);
        static double Asin(double x);
        static double Acos(double x);
        static double Atan(double x);

    private:
        static double Factorial(int n);
    };
}

#endif // SIGMATH_TRIG_H
