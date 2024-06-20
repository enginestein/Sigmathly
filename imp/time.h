#ifndef SIGMATH_TIME_H
#define SIGMATH_TIME_H

#include <chrono>
#include <iostream>
#include <sstream>
#include <iomanip>

namespace Sigmath {
    class Time {
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
        Time(long long ticks);
        static Time Now();

        long long GetTicks() const;
        std::string ToString() const;

    private:
        static bool IsLeapYear(int year);
        static int GetDaysInMonth(int year, int month);
    };
}

#endif
