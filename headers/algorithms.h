#ifndef SIGMATH_STATGORITHM_H
#define SIGMATH_STATGORITHM_H

#include <algorithm>
#include <stdexcept>
#include <vector>

namespace Sigmath
{
    class Statgorithm
    {
    public:
        static double Skewness(const std::vector<double>& values);
        static double Kurtosis(const std::vector<double>& values);
        static double Covariance(const std::vector<double>& xValues, const std::vector<double>& yValues);
        static double Percentile(const std::vector<double>& values, int percentile);
        static std::vector<double> RemoveOutliers(const std::vector<double>& values);
    };
}

#endif // SIGMATH_STATGORITHM_H
