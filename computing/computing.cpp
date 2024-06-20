#include <cmath>

namespace Sigmath
{
    class Computing
    {
    public:
        static int Floor(double x)
        {
            return static_cast<int>(x >= 0 ? x : x - 0.999999999999999);
        }

        static int Ceil(double x)
        {
            return static_cast<int>(x >= 0 ? x + 0.999999999999999 : x);
        }

        static int Round(double x)
        {
            return static_cast<int>(x >= 0 ? x + 0.5 : x - 0.5);
        }
    };
}
