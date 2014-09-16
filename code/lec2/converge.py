#!/usr/bin/python
from math import *

# Function to differentiate
def f(x):
    return sin(x)

# Position to differentiate at, plus initial interval size
x=1
h=10

while h>1e-10:
    
    # Finite-difference calculation
    ddf=(f(x+h)-2*f(x)+f(x-h))/(h*h)

    # Print output
    print h,ddf,abs(ddf+sin(x))

    # Scale interval size
    h*=0.5
