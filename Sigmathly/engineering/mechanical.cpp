#include <iostream>

namespace Sigmath
{
    class Mechanical
    {
    public:
        static double CalculateTorque(double force, double radius)
        {
            return force * radius;
        }
        static double CalculatePower(double torque, double angularVelocity)
        {
            return torque * angularVelocity;
        }

        static double CalculateVelocity(double distance, double time)
        {
            return distance / time;
        }

        static double CalculateAcceleration(double initialVelocity, double finalVelocity, double time)
        {
            return (finalVelocity - initialVelocity) / time;
        }

        static double CalculateForce(double mass, double acceleration)
        {
            return mass * acceleration;
        }
    };
}