#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as plt

x=np.array([1.2,0.5,-0.1,2.3,-1.05,-2.35])

pr=range(1,100)
nx=[np.linalg.norm(x,p) for p in pr]
ni=[np.linalg.norm(x,np.inf) for p in pr]

plt.plot(pr,nx,pr,ni)
plt.xlabel('p')
plt.ylabel('norm value')
plt.legend(['p-norm','infinity norm'],loc='best')
plt.show()
