#include "myMath.h"

#define E 2.718281828

double Power(double x , int y) {
    double temp;
    if( y == 0) return 1;
    temp = Power(x, y/2);
    if (y%2 == 0) return temp*temp;
    else {
        if(y > 0)
            return x * temp * temp;
        else
            return (temp * temp) / x;
    }
}

double Exponent(int x) {
    return Power(E, x);
}