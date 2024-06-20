#ifndef SIGMATH_RANDOM_H
#define SIGMATH_RANDOM_H

#include <random>
#include <stdexcept>
#include <chrono>
#include <limits>
#include <cmath>

namespace Sigmath {
    class Rand {
    private:
        const long long a = 6364136223846793005;
        const long long c = 1442695040888963407;
        const long long m = 9223372036854775783;
        long long seed;

    public:
        Rand();
        Rand(long long seed);

        long long NextLong();
        double NextDouble();
        int Next(int minValue, int maxValue);
        int Next(int maxValue);
        int Next();
    };

    class Random {
    public:
        static double RandUniform(double min, double max);
        static double RandNormal(double mean, double stdDev);
        static int RandPoisson(double lambda);
    };
}

#endif
