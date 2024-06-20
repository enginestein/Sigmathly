#include <chrono>
#include <iostream>
#include <sstream>
#include <iomanip>

namespace Sigmath
{
    class Time
    {
    private:
        int year;
        int month;
        int day;
        int hour;
        int minute;
        int second;
        long long ticks;

        static const long long TicksPerSecond = 10000000;
        static const long long TicksPerMinute = TicksPerSecond * 60;
        static const long long TicksPerHour = TicksPerMinute * 60;
        static const long long TicksPerDay = TicksPerHour * 24;

    public:
        Time(long long ticks) : ticks(ticks)
        {
            long long seconds = ticks / TicksPerSecond;
            long long minutes = seconds / 60;
            long long hours = minutes / 60;
            long long days = hours / 24;

            second = static_cast<int>(seconds % 60);
            minute = static_cast<int>(minutes % 60);
            hour = static_cast<int>(hours % 24);

            long long years = 1;
            long long daysInYear = IsLeapYear(year) ? 366 : 365;

            while (days >= daysInYear)
            {
                days -= daysInYear;
                years++;
                daysInYear = IsLeapYear(year + years - 1) ? 366 : 365;
            }

            year = static_cast<int>(years + 1);
            month = 1;

            while (days >= GetDaysInMonth(year, month))
            {
                days -= GetDaysInMonth(year, month);
                month++;
            }

            day = static_cast<int>(days + 1);
        }

        static Time Now()
        {
            auto now = std::chrono::system_clock::now();
            auto duration = now.time_since_epoch();
            auto ticks = std::chrono::duration_cast<std::chrono::nanoseconds>(duration).count() / 100;
            return Time(ticks);
        }

        long long GetTicks() const { return ticks; }

        std::string ToString() const
        {
            std::ostringstream oss;
            oss << std::setfill('0') << year << '-' << std::setw(2) << month << '-' << std::setw(2) << day << ' '
                << std::setw(2) << hour << ':' << std::setw(2) << minute << ':' << std::setw(2) << second;
            return oss.str();
        }

    private:
        static bool IsLeapYear(int year)
        {
            return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
        }

        static int GetDaysInMonth(int year, int month)
        {
            switch (month)
            {
            case 2:
                return IsLeapYear(year) ? 29 : 28;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            default:
                return 31;
            }
        }
    };
}
