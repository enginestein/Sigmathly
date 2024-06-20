#ifndef ELECTRICAL_H
#define ELECTRICAL_H

#include <iostream>
#include <vector>
#include "../computing/basic.h"
#include "../imp/constants.h"

namespace Sigmath {
    class Electrical {
    public:
        static double CalculateResistance(double voltage, double current);

        static double CalculatePower(double voltage, double current);

        static double CalculateCapacitance(double charge, double voltage);

        static double CalculateInductance(double voltage, double current, double frequency);

        static double CalculateImpedance(double resistance, double reactance);

        static double CalculateReactance(double inductance, double frequency);

        static double CalculateResonantFrequency(double inductance, double capacitance);

        static double CalculatePowerFactor(double realPower, double apparentPower);

        static double CalculateRMS(const std::vector<double>& values);

        static double CalculateTotalResistanceInSeries(const std::vector<double>& resistances);

        static double CalculateTotalResistanceInParallel(const std::vector<double>& resistances);

        static double CalculateTotalCapacitanceInSeries(const std::vector<double>& capacitances);

        static double CalculateTotalCapacitanceInParallel(const std::vector<double>& capacitances);

        static double CalculateTotalInductanceInSeries(const std::vector<double>& inductances);

        static double CalculateTotalInductanceInParallel(const std::vector<double>& inductances);
    };
}


#endif // ELECTRICAL_H
