#include <iostream>
#include <vector>

namespace Sigmath
{
    class ArithmeticProgression
    {
    public:
        static std::vector<double> Arithmetic(double firstTerm, double commonDifference, int numTerms)
        {
            std::vector<double> terms(numTerms);
            for (int i = 0; i < numTerms; i++)
            {
                terms[i] = firstTerm + i * commonDifference;
            }
            return terms;
        }

        static double ArithmeticSum(double firstTerm, double commonDifference, int numTerms)
        {
            return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2;
        }

        static double NthTerm(int n, double a1, double d)
        {
            return a1 + (n - 1) * d;
        }

        static int TermNumber(double an, double a1, double d)
        {
            double n = (an - a1) / d + 1;
            return static_cast<int>(n);
        }

        static int TermNumber(double an, int n, double a1)
        {
            double d = (an - a1) / (n - 1);
            return static_cast<int>(d);
        }

        static double CommonDifference(double an, double a1, int n)
        {
            return (an - a1) / (n - 1);
        }

        static double FirstTerm(double an, int n, double d)
        {
            return an - (n - 1) * d;
        }

        static double LastTerm(double a1, int n, double d)
        {
            return a1 + (n - 1) * d;
        }
    };
}