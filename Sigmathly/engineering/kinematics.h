#ifndef KINEMATICS_H
#define KINEMATICS_H

#include <iostream>
#include "../computing/basic.h"
#include "../trigonometry/const.h"
#include "../imp/constants.h"

namespace Sigmath {
    class Kinematics {
    public:
        static double CalculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time);

        static double CalculateFinalVelocity(double initialVelocity, double acceleration, double displacement);

        static double CalculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration);

        static double CalculateProjectileRange(double initialVelocity, double launchAngle);
    };
}


#endif // KINEMATICS_H
