#include <stdio.h>
#include "myMath.h"

int main() 
{ 
    double x;

    printf("Please inset a real number: ");
    scanf("%lf", &x);  

    int roundedX = (int)x;
    printf("The value of f(x) = e^%.4f+(%.4f^3)-2 at the point %.4f is: %.4f\n",x, x, x, sub(add(Exponent(roundedX), Power(x,3)),2));

    printf("The value of f(x) = 3⋅%.4f+2⋅%.4f^2 at the point %.4f is: %.4f\n",x, x, x, add(mul(x, 3), mul(Power(x, 2), 2)));

    printf("The value of f(x) = (4⋅%.4f^3)/5-2%.4f at the point %.4f is: %.4f\n", x, x, x, sub(div(mul(Power(x, 3), 4), 5), mul(x, 2)));
    return 0;
}