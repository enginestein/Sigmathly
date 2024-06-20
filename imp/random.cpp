#include <random>
#include <stdexcept>
#include "../computing/basic.h"
#include "../imp/logarithm.h"
#include "../trigonometry/const.h"
#include <chrono>

namespace Sigmath
{
    class Rand
    {
    private:
        const long long a = 6364136223846793005;
        const long long c = 1442695040888963407;
        const long long m = 9223372036854775783;
        long long seed;

    public:
        Rand()
        {
            seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
        }

        Rand(long long seed) : seed(seed) {}

        long long NextLong()
        {
            seed = (a * seed + c) % m;
            return seed;
        }

        double NextDouble()
        {
            return static_cast<double>(NextLong()) / m;
        }

        int Next(int minValue, int maxValue)
        {
            if (minValue >= maxValue)
                throw std::invalid_argument("minValue must be less than maxValue");

            long long range = static_cast<long long>(maxValue) - minValue;
            return static_cast<int>(NextDouble() * range) + minValue;
        }

        int Next(int maxValue)
        {
            return Next(0, maxValue);
        }

        int Next()
        {
            return Next(std::numeric_limits<int>::min(), std::numeric_limits<int>::max());
        }
    };

    class Random
    {
    public:
        static double RandUniform(double min, double max)
        {
            Rand rand;
            return rand.NextDouble() * (max - min) + min;
        }

        static double RandNormal(double mean, double stdDev)
        {
            const double Pi = 3.14159265358979323846;
            Rand rand;
            double u1 = rand.NextDouble();
            double u2 = rand.NextDouble();
            double z0 = Basic::SquareRoot(-2 * Log(u1)) * Trig::Cos(2 * Pi * u2);
            return z0 * stdDev + mean;
        }

        static int RandPoisson(double lambda)
        {
            Rand rand;
            double L = Basic::Exp(-lambda);
            double p = 1;
            int k = 0;
            do
            {
                k++;
                p *= rand.NextDouble();
            } while (p > L);
            return k - 1;
        }
    };
}
