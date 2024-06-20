#ifndef SIGMATH_GEOMETRY_H
#define SIGMATH_GEOMETRY_H

namespace Sigmath {
    class Geometry {
    public:
        static double CircleArea(double radius);
        static double CirclePerimeter(double radius);
        static double RectangleArea(double width, double height);
        static double RectanglePerimeter(double width, double height);
        static double TriangleArea(double base, double height);
        static double TrianglePerimeter(double side1, double side2, double side3);
        static double DistanceBetweenPoints2D(double x1, double y1, double x2, double y2);
        static double DistanceBetweenPoints3D(double x1, double y1, double z1, double x2, double y2, double z2);
        static double AngleBetweenLines(double slope1, double slope2);
        static double AngleBetweenVectors2D(double x1, double y1, double x2, double y2);
        static double AngleBetweenVectors3D(double x1, double y1, double z1, double x2, double y2, double z2);
    };
}

#endif
