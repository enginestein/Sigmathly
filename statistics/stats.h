#ifndef SIGMATH_STATISTICS_H
#define SIGMATH_STATISTICS_H

#include <algorithm>
#include <stdexcept>
#include <vector>
#include <unordered_map>

namespace Sigmath
{
    class Statistics
    {
    public:
        static double Mean(const std::vector<double>& values);
        static double Median(const std::vector<double>& values);
        static double Mode(const std::vector<double>& values);
        static double Variance(const std::vector<double>& values);
        static double StandardDeviation(const std::vector<double>& values);
        static double Correlation(const std::vector<double>& valuesX, const std::vector<double>& valuesY);
    };
}

#endif // SIGMATH_STATISTICS_H
