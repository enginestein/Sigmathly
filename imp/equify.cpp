#include <iostream>
#include <string>
#include <cmath>
#include <sstream>
#include <stack>
#include <vector>
#include <functional>

using namespace std;

double evaluateExpression(const string& expression)
{
    stack<char> operators;
    stack<double> operands;

    auto performOperation = [&]()
    {
        char op = operators.top();
        operators.pop();
        double operand2 = operands.top();
        operands.pop();
        double operand1 = operands.top();
        operands.pop();

        double result = 0.0;

        switch (op)
        {
        case '+':
            result = operand1 + operand2;
            break;
        case '-':
            result = operand1 - operand2;
            break;
        case '*':
            result = operand1 * operand2;
            break;
        case '/':
            result = operand1 / operand2;
            break;
        case '^':
            result = pow(operand1, operand2);
            break;
        }

        operands.push(result);
    };

    auto precedence = [](char op)
    {
        switch (op)
        {
        case '+':
        case '-':
            return 1;
        case '*':
        case '/':
            return 2;
        case '^':
            return 3;
        default:
            return 0;
        }
    };

    stringstream ss(expression);
    string token;
    while (getline(ss, token, ' '))
    {
        if (token.empty())
            continue;

        if (isdigit(token[0]) || (token[0] == '-' && token.size() > 1 && isdigit(token[1])))
        {
            double operand;
            stringstream(token) >> operand;
            operands.push(operand);
        }
        else if (token == "(")
        {
            operators.push('(');
        }
        else if (token == ")")
        {
            while (!operators.empty() && operators.top() != '(')
            {
                performOperation();
            }

            if (!operators.empty() && operators.top() == '(')
            {
                operators.pop();
            }
        }
        else
        {
            while (!operators.empty() && precedence(operators.top()) >= precedence(token[0]))
            {
                performOperation();
            }

            operators.push(token[0]);
        }
    }

    while (!operators.empty())
    {
        performOperation();
    }

    return operands.top();
}
