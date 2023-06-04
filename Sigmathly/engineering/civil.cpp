#include <iostream>
#include "../computing/basic.h"

namespace Sigmath
{
    class Civil
    {
    public:
        static double CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
        {
            return ((load * Basic::Power(length, 3)) / (3 * elasticity * momentOfInertia));
        }

        static double CalculateStress(double force, double area)
        {
            return (force / area);
        }

        static double CalculateStrain(double initialLength, double finalLength, double initialDiameter)
        {
            return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)));
        }

        static double CalculateYoungsModulus(double stress, double strain)
        {
            return (stress / strain);
        }
    };
}