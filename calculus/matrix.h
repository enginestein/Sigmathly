#ifndef MATRIX_H
#define MATRIX_H

#include <iostream>
#include <vector>
#include <stdexcept>

namespace Sigmath {
    class Matrix {
    private:
        std::vector<std::vector<double>> data;
        int rows;
        int cols;

    public:
        Matrix(int rows, int cols);
        Matrix(std::vector<std::vector<double>> data);
        int GetRows() const;
        int GetCols() const;
        double& operator()(int row, int col);
        const double& operator()(int row, int col) const;
        static Matrix Add(const Matrix& a, const Matrix& b);
        static Matrix Subtract(const Matrix& a, const Matrix& b);
        static Matrix Multiply(const Matrix& a, const Matrix& b);
        static Matrix Inverse(const Matrix& matrix);

    private:
        static Matrix Concatenate(const Matrix& a, const Matrix& b);
    };
}

#endif // MATRIX_H
