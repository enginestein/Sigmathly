#include "../computing/basic.h"
#include "../trigonometry/const.h"

namespace Sigmath {
    static double Pi = 3.14159265358979323846;
	
    class Geometry {
        double CircleArea(double radius)
        {
            return Pi * radius * radius;
        }

        double CirclePerimeter(double radius)
        {
            return 2 * Pi * radius;
        }

        double RectangleArea(double width, double height)
        {
            return width * height;
        }

        double RectanglePerimeter(double width, double height)
        {
            return 2 * (width + height);
        }

        double TriangleArea(double base, double height)
        {
            return 0.5 * base * height;
        }

        double TrianglePerimeter(double side1, double side2, double side3)
        {
            return side1 + side2 + side3;
        }

        double DistanceBetweenPoints2D(double x1, double y1, double x2, double y2)
        {
            return Basic::SquareRoot(Basic::Power(x2 - x1, 2) + Basic::Power(y2 - y1, 2));
        }

        double DistanceBetweenPoints3D(double x1, double y1, double z1, double x2, double y2, double z2)
        {
            return Basic::SquareRoot(Basic::Power(x2 - x1, 2) + Basic::Power(y2 - y1, 2) + Basic::Power(z2 - z1, 2));
        }

        double AngleBetweenLines(double slope1, double slope2)
        {
            return Trig::Atan(Basic::Abs((slope2 - slope1) / (1 + slope1 * slope2)));
        }

        double AngleBetweenVectors2D(double x1, double y1, double x2, double y2)
        {
            return Trig::Acos((x1 * x2 + y1 * y2) / (Basic::SquareRoot(x1 * x1 + y1 * y1) * Basic::SquareRoot(x2 * x2 + y2 * y2)));
        }

        double AngleBetweenVectors3D(double x1, double y1, double z1, double x2, double y2, double z2)
        {
            return Trig::Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic::SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic::SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)));
        }
	};
}