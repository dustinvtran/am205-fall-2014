#!/usr/bin/python
from math import *
import numpy as np
import matplotlib.pyplot as plt

n=12
def vand_f(x,b):
    fx=b[n-1]
    for i in range(n-1):
        fx*=x
        fx+=b[n-2-i]
    return fx

# Construct rectangular Vandermonde matrix
x=np.linspace(0.2,1,5)
A=np.fliplr(np.vander(x,N=n))
y=np.cos(4*x)

# Solve using least squares
#b=np.linalg.lstsq(A,y)[0]

# Compute A^T A 
AT=np.transpose(A)
ATA=np.dot(AT,A)
print "Condition number: ",np.linalg.cond(ATA)

# Add regularizer and solve
S=0.1*np.identity(n)
STS=np.dot(np.transpose(S),S)
b=np.linalg.solve(ATA+STS,np.dot(AT,y))

# Print some diagnostic information
print b
print "Norm(r): ",np.linalg.norm(y-np.dot(A,b))
print "Norm(b): ",np.linalg.norm(b)

# Plot output
xnew=np.linspace(0,1,200)
vnew=[vand_f(q,b) for q in xnew]
plt.plot(x,y,'o',xnew,vnew)
plt.xlabel('x')
plt.ylabel('y')
plt.legend(['data','least sq.','normal'],loc='best')
plt.show()
