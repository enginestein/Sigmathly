#ifndef ARITHMETIC_PROGRESSION_H
#define ARITHMETIC_PROGRESSION_H

#include <iostream>
#include <vector>

namespace Sigmath
{
    class ArithmeticProgression
    {
    public:
        static std::vector<double> Arithmetic(double firstTerm, double commonDifference, int numTerms);
        static double ArithmeticSum(double firstTerm, double commonDifference, int numTerms);
        static double NthTerm(int n, double a1, double d);
        static int TermNumber(double an, double a1, double d);
        static int TermNumber(double an, int n, double a1);
        static double CommonDifference(double an, double a1, int n);
        static double FirstTerm(double an, int n, double d);
        static double LastTerm(double a1, int n, double d);
    };
}

#endif
