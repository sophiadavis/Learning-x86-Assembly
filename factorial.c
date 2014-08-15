#include <stdio.h>

int main(void) {
    int i = 3;
    int ret = factorial(i);
    printf("%i! is %i\n", i, ret);
    return 0;
}

int factorial(int i) {
    if (i == 0) {
        return 1;
    }
    while(i > 0) {
        return i * factorial(i - 1);
    }
}