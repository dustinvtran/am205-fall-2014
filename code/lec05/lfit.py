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
x=np.linspace(0,1,50)
A=np.fliplr(np.vander(x))
A=A[:,0:n]
y=np.cos(4*x)

# Solve using least squares
b1=np.linalg.lstsq(A,y)[0]

# Solve using normal equations
AT=np.transpose(A)
ATA=np.dot(AT,A)
print "Condition number: ",np.linalg.cond(ATA)
b2=np.linalg.solve(ATA,np.dot(AT,y))

print "Normal  : Norm(r): ",np.linalg.norm(y-np.dot(A,b2))
print "Lst. Sq.: Norm(r): ",np.linalg.norm(y-np.dot(A,b1))

# Plot output
xnew=np.linspace(0,1,200)
vnew=[vand_f(q,b1) for q in xnew]
v2new=[vand_f(q,b2) for q in xnew]
plt.plot(x,y,'o',xnew,vnew,'-',xnew,v2new)
plt.xlabel('x')
plt.ylabel('y')
plt.legend(['data','least sq.','normal'],loc='best')
plt.show()
