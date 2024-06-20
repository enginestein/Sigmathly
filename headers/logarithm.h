#ifndef SIGMATH_LOG_H
#define SIGMATH_LOG_H

#include <stdexcept>

namespace Sigmath {
    const double EPSILON = 1e-14;

    double Log(double x);
    double Log10(double x);
    double Logn(double n, double x);
}

#endif
