#!/usr/bin/python
from math import *
import sys

# Function to differentiate
def f(x):
    return sin(3*x)

# Exact derivative of f
def df(x):
    return 3*cos(3*x)

# General second-order accurate derivative formula
def deriv(x,b,c):
    return ((b*b-c*c)*f(x)+c*c*f(x+b)-b*b*f(x-c))/(b*c*(b+c))

# Function to compute the derivative on the unequal grid
def do_deriv(N,show):
    al=pow(3,1.0/N)-1.0
    inor=0.0

    for k in range(-N,N+1):
        x=pow(1.0+al,k)

        # Compute value of b
        if k==N: b=pow(1.+al,k-2)-x
        else: b=al*x

        # Compute value of c
        if k==-N: c=x-pow(1.+al,k+2)
        else: c=al*x/(1.+al)

        # Calculate numerical and exact derivatives,
        # and print results if requested
        ndf=deriv(x,b,c)
        adf=df(x)
        if show:
            print x,adf,ndf,adf-ndf

        # See if this error contributes to the infinity norm and if so, store
        # it
        err=abs(ndf-adf)
        if inor<err:
            inor=err

    # Return infinity norm
    return (al,inor)

# Uncomment these lines to do a single derivative computation
#do_deriv(10,1)
#sys.exit()

for N in (10,20,40,80,160,320,640):
    (al,inor)=do_deriv(N,0)
    print al,inor
