#include <algorithm>
#include <stdexcept>
#include <vector>
#include "../computing/basic.h"
#include "../computing/computing.h"
#include "stats.h"

namespace Sigmath
{
    class Statgorithm
    {
    public:
        static double Skewness(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate skewness of empty sequence");
            }

            double count = 0;
            double sum = 0.0;
            double sumOfSquaredDifferences = 0.0;
            double sumOfCubedDifferences = 0.0;
            double mean = Statistics::Mean(values);

            for (const double& value : values)
            {
                count++;
                sum += value;
                double difference = value - mean;
                sumOfSquaredDifferences += difference * difference;
                sumOfCubedDifferences += difference * difference * difference;
            }

            double variance = Statistics::Variance(values);
            double skewness = sumOfCubedDifferences / (count * Basic::CubeRoot(variance));

            return skewness;
        }

        static double Kurtosis(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate kurtosis of empty sequence");
            }

            double count = 0;
            double sumOfSquaredDifferences = 0.0;
            double sumOfFourthPowersOfDifferences = 0.0;
            double mean = Statistics::Mean(values);

            for (const double& value : values)
            {
                count++;
                double difference = value - mean;
                sumOfSquaredDifferences += difference * difference;
                sumOfFourthPowersOfDifferences += difference * difference * difference * difference;
            }

            double variance = sumOfSquaredDifferences / count;
            double fourthMoment = sumOfFourthPowersOfDifferences / count;
            double kurtosis = fourthMoment / (variance * variance) - 3;

            return kurtosis;
        }

        static double Covariance(const std::vector<double>& xValues, const std::vector<double>& yValues)
        {
            if (xValues.empty() || yValues.empty() || xValues.size() != yValues.size())
            {
                throw std::invalid_argument("Invalid input");
            }

            double xMean = Statistics::Mean(xValues);
            double yMean = Statistics::Mean(yValues);
            double count = 0;
            double sumOfProductsOfDifferences = 0.0;

            for (size_t i = 0; i < xValues.size(); i++)
            {
                count++;
                double xDifference = xValues[i] - xMean;
                double yDifference = yValues[i] - yMean;
                sumOfProductsOfDifferences += xDifference * yDifference;
            }

            double covariance = sumOfProductsOfDifferences / count;

            return covariance;
        }

        static double Percentile(const std::vector<double>& values, int percentile)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate percentile of empty sequence");
            }

            if (percentile < 0 || percentile > 100)
            {
                throw std::out_of_range("Percentile must be between 0 and 100");
            }

            std::vector<double> sortedValues(values);
            std::sort(sortedValues.begin(), sortedValues.end());
            size_t index = static_cast<size_t>(Computing::Ceil((percentile / 100.0) * sortedValues.size())) - 1;

            return sortedValues[index];
        }

        static std::vector<double> RemoveOutliers(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot remove outliers from empty sequence");
            }

            std::vector<double> sortedValues(values);
            std::sort(sortedValues.begin(), sortedValues.end());
            double q1 = Percentile(sortedValues, 25);
            double q3 = Percentile(sortedValues, 75);
            double iqr = q3 - q1;
            double lowerBound = q1 - (1.5 * iqr);
            double upperBound = q3 + (1.5 * iqr);

            std::vector<double> filteredValues;
            for (const double& value : sortedValues)
            {
                if (value >= lowerBound && value <= upperBound)
                {
                    filteredValues.push_back(value);
                }
            }

            return filteredValues;
        }
    };
}