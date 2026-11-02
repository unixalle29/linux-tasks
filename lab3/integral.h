#ifndef INTEGRAL_H
#define INTEGRAL_H

double function(double x);
double integrate(double (*f)(double), double left, double right, int steps);

#endif
