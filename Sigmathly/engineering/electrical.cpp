#include <iostream>
#include <vector>
#include "../computing/basic.h"

namespace Sigmath
{

    static double PI = 3.14159265358979323846;
    class Electrical
    {

    public:
        static double CalculateResistance(double voltage, double current)
        {
            return voltage / current;
        }

        static double CalculateBasicPower(double voltage, double current)
        {
            return voltage * current;
        }

        static double CalculateCapacitance(double charge, double voltage)
        {
            return charge / voltage;
        }

        static double CalculateInductance(double voltage, double current, double frequency)
        {
            return voltage / (current * 2 * PI * frequency);
        }

        static double CalculateImpedance(double resistance, double reactance)
        {
            return Basic::SquareRoot(Basic::Power(resistance, 2) + Basic::Power(reactance, 2));
        }

        static double CalculateReactance(double inductance, double frequency)
        {
            return 2 * PI * frequency * inductance;
        }

        static double CalculateResonantFrequency(double inductance, double capacitance)
        {
            return 1 / (2 * PI * Basic::SquareRoot(inductance * capacitance));
        }

        static double CalculateBasicPowererFactor(double realBasicPower, double apparentBasicPower)
        {
            return realBasicPower / apparentBasicPower;
        }

        static double CalculateRMS(const std::vector<double>& values)
        {
            double sum = 0;
            for (int i = 0; i < values.size(); i++)
            {
                sum += Basic::Power(values[i], 2);
            }
            return Basic::SquareRoot(sum / values.size());
        }

        static double CalculateTotalResistanceInSeries(const std::vector<double>& resistances)
        {
            double total = 0;
            for (int i = 0; i < resistances.size(); i++)
            {
                total += resistances[i];
            }
            return total;
        }

        static double CalculateTotalResistanceInParallel(const std::vector<double>& resistances)
        {
            double total = 0;
            for (int i = 0; i < resistances.size(); i++)
            {
                total += 1 / resistances[i];
            }
            return 1 / total;
        }

        static double CalculateTotalCapacitanceInSeries(const std::vector<double>& capacitances)
        {
            double total = 0;
            for (int i = 0; i < capacitances.size(); i++)
            {
                total += 1 / capacitances[i];
            }
            return 1 / total;
        }

        static double CalculateTotalCapacitanceInParallel(const std::vector<double>& capacitances)
        {
            double total = 0;
            for (int i = 0; i < capacitances.size(); i++)
            {
                total += capacitances[i];
            }
            return total;
        }

        static double CalculateTotalInductanceInSeries(const std::vector<double>& inductances)
        {
            double total = 0;
            for (int i = 0; i < inductances.size(); i++)
            {
                total += inductances[i];
            }
            return total;
        }

        static double CalculateTotalInductanceInParallel(const std::vector<double>& inductances)
        {
            double total = 0;
            for (int i = 0; i < inductances.size(); i++)
            {
                total += 1 / inductances[i];
            }
            return 1 / total;
        }
    };
}
