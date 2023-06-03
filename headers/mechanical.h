#ifndef MECHANICAL_H
#define MECHANICAL_H

#include <iostream>

namespace Sigmath {
    class Mechanical {
    public:
        static double CalculateTorque(double force, double radius);

        static double CalculatePower(double torque, double angularVelocity);

        static double CalculateVelocity(double distance, double time);

        static double CalculateAcceleration(double initialVelocity, double finalVelocity, double time);

        static double CalculateForce(double mass, double acceleration);
    };
}


#endif // MECHANICAL_H
