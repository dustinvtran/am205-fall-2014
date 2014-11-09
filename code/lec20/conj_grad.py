#!/usr/bin/python
import numpy as np
from math import sqrt

# Test problem (ax=b)
a=np.array([[2.,1.,0.],[1.,3.,0.],[0.,0.,4.]])
b=np.array([[3.],[4.],[4.]])

# Conjugate gradient algorithm
x=np.array([[0.],[0.],[0.]])
r=b-np.dot(a,x)
p=r
rsq=np.dot(r.T,r)
for i in range(3):

    # Calculate norm squared of r
    rsq=np.dot(r.T,r)
    print "Norm(r)=",sqrt(rsq[0,0])
    al=rsq/(np.dot(p.T,np.dot(a,p)))
    print "alpha=",al[0,0]
    x=x+al*p
    print "x=",x,"\n"
    r=r-al*np.dot(a,p)

    # Calculate beta and use it to remove component of previous p from r
    be=1/rsq
    rsq=np.dot(r.T,r)
    be*=rsq
    p=r+be*p

