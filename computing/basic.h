#ifndef BASIC_H
#define BASIC_H

#include <stdexcept>
#include <iostream>
#include <functional>
#include <string>
#include <sstream>
#include <stack>
#include <map>

namespace Sigmath {
    class Basic {
    public:
        static double Add(const std::initializer_list<double>& numbers);
        static double Subtract(const std::initializer_list<double>& numbers);
        static double Multiply(const std::initializer_list<double>& numbers);
        static double Divide(const std::initializer_list<double>& numbers);
        static double Power(double baseNum, double exponent);
        static double Abs(double value);
        static float Abs(float value);
        static int Abs(int value);
        static long Abs(long value);
        static double SquareRoot(double number);
        static double Exp(double x);
        static double CubeRoot(double x);
        static double Evaluate(const std::string& expression);
    };
}

#endif // BASIC_H
