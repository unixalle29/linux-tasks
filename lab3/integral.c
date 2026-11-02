#include "integral.h"

double integrate(double (*f)(double), double left, double right, int steps) {
    double width = (right - left) / steps;
    double sum = 0;

    for (int index = 0; index < steps; index++) {
        double x1 = left + index * width;
        double x2 = x1 + width;
        sum += (f(x1) + f(x2)) / 2.0 * width;
    }
    return sum;
}
