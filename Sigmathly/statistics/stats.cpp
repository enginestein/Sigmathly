#include <algorithm>
#include <stdexcept>
#include <vector>
#include <unordered_map>
#include "../computing/basic.h"

namespace Sigmath
{
    class Statistics
    {
    public:
        static double Mean(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate mean of empty sequence");
            }

            double count = 0;
            double sum = 0.0;

            for (const double& value : values)
            {
                count++;
                sum += value;
            }

            return sum / count;
        }

        static double Median(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate median of empty sequence");
            }

            std::vector<double> sortedValues(values);
            std::sort(sortedValues.begin(), sortedValues.end());
            size_t middleIndex = sortedValues.size() / 2;

            if (sortedValues.size() % 2 == 0)
            {
                return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0;
            }
            else
            {
                return sortedValues[middleIndex];
            }
        }

        static double Mode(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate mode of empty sequence");
            }

            std::unordered_map<double, int> valueCounts;

            for (const double& value : values)
            {
                if (valueCounts.find(value) == valueCounts.end())
                {
                    valueCounts[value] = 0;
                }

                valueCounts[value]++;
            }

            int maxCount = 0;
            std::vector<double> modes;

            for (const auto& pair : valueCounts)
            {
                if (pair.second > maxCount)
                {
                    maxCount = pair.second;
                    modes.clear();
                    modes.push_back(pair.first);
                }
                else if (pair.second == maxCount)
                {
                    modes.push_back(pair.first);
                }
            }

            if (modes.size() == 1)
            {
                return modes[0];
            }
            else
            {
                throw std::runtime_error("Sequence has multiple modes");
            }
        }

        static double Variance(const std::vector<double>& values)
        {
            if (values.empty())
            {
                throw std::invalid_argument("Cannot calculate variance of empty sequence");
            }

            double mean = Mean(values);
            double count = 0;
            double sumOfSquaredDifferences = 0.0;

            for (const double& value : values)
            {
                count++;
                double difference = value - mean;
                sumOfSquaredDifferences += difference * difference;
            }

            return sumOfSquaredDifferences / count;
        }

        static double StandardDeviation(const std::vector<double>& values)
        {
            return Basic::SquareRoot(Variance(values));
        }

        static double Correlation(const std::vector<double>& valuesX, const std::vector<double>& valuesY)
        {
            if (valuesX.empty() || valuesY.empty())
            {
                throw std::invalid_argument("Cannot calculate correlation coefficient of empty sequences");
            }

            if (valuesX.size() != valuesY.size())
            {
                throw std::invalid_argument("Input sequences must have the same size");
            }

            double count = 0;
            double sumX = 0.0;
            double sumY = 0.0;
            double sumXY = 0.0;
            double sumXSquared = 0.0;
            double sumYSquared = 0.0;

            for (size_t i = 0; i < valuesX.size(); ++i)
            {
                double valueX = valuesX[i];
                double valueY = valuesY[i];
                count++;
                sumX += valueX;
                sumY += valueY;
                sumXY += valueX * valueY;
                sumXSquared += valueX * valueX;
                sumYSquared += valueY * valueY;
            }

            double numerator = count * sumXY - sumX * sumY;
            double denominator = Basic::SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY));

            return numerator / denominator;
        }
    };
}
