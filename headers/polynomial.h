#ifndef SIGMATH_POLYNOMIAL_H
#define SIGMATH_POLYNOMIAL_H

#include <algorithm>
#include <vector>
#include <initializer_list>

namespace Sigmath {
    class Polynomial {
    private:
        std::vector<double> _coefficients;

    public:
        Polynomial(std::initializer_list<double> coefficients);

        int Degree() const;
        double Evaluate(double x) const;
        static Polynomial Divide(const Polynomial& dividend, const Polynomial& divisor);
        Polynomial Divide(const Polynomial& divisor) const;
    };

    Polynomial Derivative(const Polynomial& polynomial);
}

#endif
