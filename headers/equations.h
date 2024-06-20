#ifndef CALCULUS_H
#define CALCULUS_H

#include <functional>
#include <vector>

namespace Sigmath
{
    class Calculus
    {
    public:
        static double Derivative(std::function<double(double)> f, double x);
        static double Integral(std::function<double(double)> f, double a, double b, int n);
        static double Limit(std::function<double(double)> f, std::function<double(double)> g, double x);
        static double FindRoot(std::function<double(double)> f, double a, double b, double epsilon = 1e-6);
        static std::function<double(std::vector<double>)> PartialDerivative(std::function<double(std::vector<double>)> f, int index, double h = 1e-6);
        static std::function<std::vector<double>(std::vector<double>)> Gradient(std::function<double(std::vector<double>)> f, double h = 1e-6);
        static std::function<std::vector<std::vector<double>>(std::vector<double>)> Hessian(std::function<double(std::vector<double>)> f, double h = 1e-6);
        static std::vector<double> FindCriticalPoints(std::function<double(double)> f, double a, double b, double epsilon = 1e-6);
        enum RiemannSumType { Left, Right, Midpoint, Trapezoidal };
        static double RiemannSum(std::function<double(double)> f, double a, double b, int n, RiemannSumType type = Left);
        static double DefiniteIntegral(std::function<double(double)> f, double a, double b, int n = 1000);
    };
}

#endif // CALCULUS_H
