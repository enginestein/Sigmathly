#ifndef COMPL_H
#define COMPL_H

#include <cmath>

namespace Sigmath {
    class Compl {
    public:
        struct Complex {
            double Real;
            double Imaginary;

            Complex(double real, double imaginary)
                : Real(real), Imaginary(imaginary)
            {
            }

            Complex operator +(const Complex& other) const;
            Complex operator -(const Complex& other) const;
            Complex operator *(const Complex& other) const;
            Complex operator /(const Complex& other) const;
            explicit Complex(int v);
        };

        static double Abs(const Complex& a);
        static double Magnitude(const Complex& number);
    };
}

#endif // COMPL_H
