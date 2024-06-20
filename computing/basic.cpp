#include <stdexcept>
#include <iostream>
#include <functional>
#include <string>
#include <sstream>
#include <stack>
#include <map>

namespace Sigmath
{
    class Basic
    {
    public:
        static double Add(const std::initializer_list<double>& numbers)
        {
            double sum = 0;
            for (double num : numbers)
                sum += num;
            return sum;
        }

        static double Subtract(const std::initializer_list<double>& numbers)
        {
            double result = *(numbers.begin());
            for (auto it = numbers.begin() + 1; it != numbers.end(); ++it)
                result -= *it;
            return result;
        }

        static double Multiply(const std::initializer_list<double>& numbers)
        {
            double product = 1;
            for (double num : numbers)
                product *= num;
            return product;
        }

        static double Divide(const std::initializer_list<double>& numbers)
        {
            double result = *(numbers.begin());
            for (auto it = numbers.begin() + 1; it != numbers.end(); ++it)
            {
                if (*it == 0)
                    throw std::runtime_error("Divide by zero exception");
                result /= *it;
            }
            return result;
        }

        static double Power(double baseNum, double exponent)
        {
            double result = 1;
            for (int i = 0; i < exponent; i++)
                result *= baseNum;
            return result;
        }

        static double Abs(double value)
        {
            return value >= 0 ? value : -value;
        }

        static float Abs(float value)
        {
            return value >= 0 ? value : -value;
        }

        static int Abs(int value)
        {
            return value >= 0 ? value : -value;
        }

        static long Abs(long value)
        {
            return value >= 0 ? value : -value;
        }

        static double SquareRoot(double number)
        {
            if (number < 0)
                throw std::invalid_argument("Cannot take square root of negative number");
            double guess = number / 2;
            for (int i = 0; i < 100; i++)
            {
                double newGuess = (guess + number / guess) / 2;
                if (Abs(newGuess - guess) < 0.0001)
                    break;
                guess = newGuess;
            }
            return guess;
        }

        static double Exp(double x)
        {
            double result = 1.0;
            double term = 1.0;
            int n = 1;
            while (term > 0.0000001)
            {
                term *= x / n;
                result += term;
                n++;
            }
            return result;
        }

        static double CubeRoot(double x)
        {
            if (x >= 0)
            {
                return Power(x, 1.0 / 3.0);
            }
            else
            {
                return -Power(-x, 1.0 / 3.0);
            }
        }

        static double Evaluate(const std::string& expression)
        {
            std::map<char, std::function<double(double, double)>> operators = {
                {'+', [](double a, double b) { return a + b; }},
                {'-', [](double a, double b) { return a - b; }},
                {'*', [](double a, double b) { return a * b; }},
                {'/', [](double a, double b) { return a / b; }}
            };

            std::stack<double> values;
            std::stack<char> ops;

            std::istringstream iss(expression);
            std::string token;

            while (iss >> token)
            {
                if (isdigit(token[0]) || (token.length() > 1 && token[0] == '-' && isdigit(token[1])))
                {
                    values.push(std::stod(token));
                }
                else if (operators.count(token[0]))
                {
                    while (!ops.empty() && operators.count(ops.top()) && operators[ops.top()](0, 0) >= operators[token[0]](0, 0))
                    {
                        double b = values.top(); values.pop();
                        double a = values.top(); values.pop();
                        char op = ops.top(); ops.pop();
                        values.push(operators[op](a, b));
                    }
                    ops.push(token[0]);
                }
                else if (token == "(")
                {
                    ops.push('(');
                }
                else if (token == ")")
                {
                    while (!ops.empty() && ops.top() != '(')
                    {
                        double b = values.top(); values.pop();
                        double a = values.top(); values.pop();
                        char op = ops.top(); ops.pop();
                        values.push(operators[op](a, b));
                    }
                    ops.pop();
                }
            }

            while (!ops.empty())
            {
                double b = values.top(); values.pop();
                double a = values.top(); values.pop();
                char op = ops.top(); ops.pop();
                values.push(operators[op](a, b));
            }

            return values.top();
        }
    };
}
