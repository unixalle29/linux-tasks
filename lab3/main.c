#include <stdio.h>

#include "integral.h"

int main(void) {
    double result = integrate(function, 0.0, 1.0, 1000);
    printf("integral = %.6f\n", result);
    return 0;
}
