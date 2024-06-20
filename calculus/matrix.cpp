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
        Matrix(int rows, int cols) : rows(rows), cols(cols) {
            data.resize(rows, std::vector<double>(cols, 0.0));
        }

        Matrix(std::vector<std::vector<double>> data) : data(data) {
            rows = data.size();
            cols = data[0].size();
        }

        int GetRows() const {
            return rows;
        }

        int GetCols() const {
            return cols;
        }

        double& operator()(int row, int col) {
            return data[row][col];
        }

        const double& operator()(int row, int col) const {
            return data[row][col];
        }

        static Matrix Add(const Matrix& a, const Matrix& b) {
            if (a.GetRows() != b.GetRows() || a.GetCols() != b.GetCols()) {
                throw std::invalid_argument("Matrices must have the same dimensions");
            }

            int rows = a.GetRows();
            int cols = a.GetCols();
            Matrix result(rows, cols);

            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < cols; j++) {
                    result(i, j) = a(i, j) + b(i, j);
                }
            }

            return result;
        }

        static Matrix Subtract(const Matrix& a, const Matrix& b) {
            if (a.GetRows() != b.GetRows() || a.GetCols() != b.GetCols()) {
                throw std::invalid_argument("Matrices must have the same dimensions");
            }

            int rows = a.GetRows();
            int cols = a.GetCols();
            Matrix result(rows, cols);

            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < cols; j++) {
                    result(i, j) = a(i, j) - b(i, j);
                }
            }

            return result;
        }

        static Matrix Multiply(const Matrix& a, const Matrix& b) {
            if (a.GetCols() != b.GetRows()) {
                throw std::invalid_argument("Matrices cannot be multiplied");
            }

            int rows = a.GetRows();
            int cols = b.GetCols();
            int common = a.GetCols();
            Matrix result(rows, cols);

            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < cols; j++) {
                    for (int k = 0; k < common; k++) {
                        result(i, j) += a(i, k) * b(k, j);
                    }
                }
            }

            return result;
        }

        static Matrix Inverse(const Matrix& matrix) {
            if (matrix.GetRows() != matrix.GetCols()) {
                throw std::invalid_argument("Matrix must be square");
            }

            int n = matrix.GetRows();
            Matrix identity(n, n);
            for (int i = 0; i < n; i++) {
                identity(i, i) = 1.0;
            }
            Matrix augmented = Concatenate(matrix, identity);

            for (int i = 0; i < n; i++) {
                double pivot = augmented(i, i);
                if (pivot == 0) {
                    throw std::invalid_argument("Matrix is not invertible");
                }

                for (int j = 0; j < 2 * n; j++) {
                    augmented(i, j) /= pivot;
                }

                for (int k = 0; k < n; k++) {
                    if (k != i) {
                        double factor = augmented(k, i);
                        for (int j = 0; j < 2 * n; j++) {
                            augmented(k, j) -= factor * augmented(i, j);
                        }
                    }
                }
            }

            Matrix inverse(n, n);
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    inverse(i, j) = augmented(i, j + n);
                }
            }

            return inverse;
        }

    private:
        static Matrix Concatenate(const Matrix& a, const Matrix& b) {
            int rows = a.GetRows();
            int cols = a.GetCols() + b.GetCols();
            Matrix concatenated(rows, cols);

            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < a.GetCols(); j++) {
                    concatenated(i, j) = a(i, j);
                }

                for (int j = 0; j < b.GetCols(); j++) {
                    concatenated(i, j + a.GetCols()) = b(i, j);
                }
            }

            return concatenated;
        }
    };
}