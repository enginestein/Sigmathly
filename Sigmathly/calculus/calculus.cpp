#include <iostream>
#include <functional>
#include <vector>
#include "../computing/basic.h"

namespace Sigmath
{
    class Calculus
    {
    public:
        static double Derivative(std::function<double(double)> f, double x)
        {
            const double dx = 1e-9; // small increment to find the derivative
            double y1 = f(x);
            double y2 = f(x + dx);
            double derivative = (y2 - y1) / dx;
            return derivative;
        }

        static double Integral(std::function<double(double)> f, double a, double b, int n)
        {
            double h = (b - a) / n;
            double integral = 0;
            for (int i = 1; i < n; i++)
            {
                double x = a + i * h;
                integral += f(x);
            }
            integral += (f(a) + f(b)) / 2;
            integral *= h;
            return integral;
        }

        static double Limit(std::function<double(double)> f, std::function<double(double)> g, double x)
        {
            const int maxIterations = 1000;
            const double tolerance = 1e-9;
            double fx = f(x);
            double gx = g(x);
            double limit = fx / gx;
            for (int i = 0; i < maxIterations; i++)
            {
                double fx1 = Derivative(f, x);
                double gx1 = Derivative(g, x);
                double newLimit = fx1 / gx1;
                if (Basic::Abs(newLimit - limit) < tolerance)
                {
                    return newLimit;
                }
                limit = newLimit;
                x += 1e-9;
            }
            throw std::runtime_error("Limit does not exist or cannot be computed with L'Hopital's Rule.");
        }

        static double FindRoot(std::function<double(double)> f, double a, double b, double epsilon = 1e-6)
        {
            if (f(a) * f(b) > 0)
                throw std::invalid_argument("Function must have opposite signs at interval endpoints");

            double c = (a + b) / 2;

            while (Basic::Abs(f(c)) > epsilon)
            {
                if (f(a) * f(c) < 0)
                    b = c;
                else
                    a = c;

                c = (a + b) / 2;
            }

            return c;
        }

        static std::function<double(std::vector<double>)> PartialDerivative(std::function<double(std::vector<double>)> f, int index, double h = 1e-6)
        {
            return [f, index, h](std::vector<double> x)
            {
                std::vector<double> xPlus = x;
                xPlus[index] += h;

                std::vector<double> xMinus = x;
                xMinus[index] -= h;

                return (f(xPlus) - f(xMinus)) / (2 * h);
            };
        }

        static std::function<std::vector<double>(std::vector<double>)> Gradient(std::function<double(std::vector<double>)> f, double h = 1e-6)
        {
            return [f, h](std::vector<double> x)
            {
                int n = x.size();
                std::vector<double> gradient(n);

                for (int i = 0; i < n; i++)
                    gradient[i] = PartialDerivative(f, i, h)(x);

                return gradient;
            };
        }

        static std::function<std::vector<std::vector<double>>(std::vector<double>)> Hessian(std::function<double(std::vector<double>)> f, double h = 1e-6)
        {
            return [f, h](std::vector<double> x)
            {
                int n = x.size();
                std::vector<std::vector<double>> hessian(n, std::vector<double>(n));

                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        auto fxx = PartialDerivative(PartialDerivative(f, i, h), j, h)(x);
                        hessian[i][j] = fxx;
                    }
                }

                return hessian;
            };
        }

        static std::vector<double> FindCriticalPoints(std::function<double(double)> f, double a, double b, double epsilon = 1e-6)
        {
            std::vector<double> criticalPoints;

            // Evaluate function at endpoints of interval
            double fa = f(a);
            double fb = f(b);

            // Check if endpoints are critical points
            if (Basic::Abs(fa) < epsilon) criticalPoints.push_back(a);
            if (Basic::Abs(fb) < epsilon) criticalPoints.push_back(b);

            // Find critical points in the interval
            double x = a;
            double fx = f(a);

            while (x < b)
            {
                double xNext = x + epsilon;
                double fxNext = f(xNext);

                // Check if the current point is a critical point
                if (Basic::Abs(fx) < epsilon && x > a && x < b)
                    criticalPoints.push_back(x);

                // Check if the function changes sign between x and xNext
                if (fx * fxNext < 0)
                {
                    // Use bisection method to find a root
                    double xLeft = x;
                    double xRight = xNext;

                    while (xRight - xLeft > epsilon)
                    {
                        double xMid = (xLeft + xRight) / 2;
                        double fxMid = f(xMid);

                        if (Basic::Abs(fxMid) < epsilon)
                        {
                            criticalPoints.push_back(xMid);
                            break;
                        }

                        if (fx * fxMid < 0)
                            xRight = xMid;
                        else
                            xLeft = xMid;
                    }
                }

                x = xNext;
                fx = fxNext;
            }

            return criticalPoints;
        }

        enum RiemannSumType
        {
            Left,
            Right,
            Midpoint,
            Trapezoidal
        };

        static double RiemannSum(std::function<double(double)> f, double a, double b, int n, RiemannSumType type = RiemannSumType::Left)
        {
            double dx = (b - a) / n;
            double sum = 0;

            for (int i = 0; i < n; i++)
            {
                double x = a + i * dx;
                double fx = f(x);

                switch (type)
                {
                case RiemannSumType::Left:
                    sum += fx * dx;
                    break;
                case RiemannSumType::Right:
                    sum += f(x + dx) * dx;
                    break;
                case RiemannSumType::Midpoint:
                    sum += f(x + dx / 2) * dx;
                    break;
                case RiemannSumType::Trapezoidal:
                    sum += (fx + f(x + dx)) * dx / 2;
                    break;
                }
            }

            return sum;
        }

        static double DefiniteIntegral(std::function<double(double)> f, double a, double b, int n = 1000)
        {
            return RiemannSum(f, a, b, n, RiemannSumType::Midpoint);
        }
    };
}
