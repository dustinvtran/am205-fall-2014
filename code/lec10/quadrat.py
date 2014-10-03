#!/usr/bin/python
from math import *

# Function to integrate
def f(x):
    return sin(x)

# Trapezoidal rule
def trap(f,a,b,n):

    # Step size
    h=(b-a)/float(n)

    # Trapezoidal formula
    fi=0.5*(f(a)+f(b))
    for i in range(1,n):
        fi+=f(a+i*h)

    # Return scaled answer
    return fi*h

# Simpson's rule
def simp(f,a,b,n):
    
    # Step size
    h=(b-a)/float(n)

    # Simpson's formula
    fi=f(a)+f(b)
    for i in range(1,n):
        fi+=4*f(a+(i-0.5)*h)+2*f(a+i*h)
    fi+=4*f(b-0.5*h)

    # Return scaled answer
    return fi*h/6.0

# Exact answer
ex=cos(0)-cos(5)

# Integrate with grids of different sizes
j=1
while j<=65536:
    print j,1/float(j),trap(f,0,5,j)-ex,simp(f,0,5,j)-ex
    j*=2
