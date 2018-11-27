#include <stdio.h>

int fib(int n);
int main () {
    
    printf("%d", fib(3));
    
}

int fib (int n) {
    if (n == 0 || n ==1 ) {
        return 1;
    }
    
    return n * fib(n-1);
}

