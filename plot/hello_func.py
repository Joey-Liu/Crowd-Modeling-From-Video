def hello(name):
    return "Hello, " + name + "!";
a = 13

from matplotlib.pyplot import cm
import matplotlib.pyplot as plt
import numpy as np

xx = []
for line in open('x1.txt').readlines():
	arr = []
	curLine = line.strip().split(' ')
	for i in range(3):
		arr.append(int(curLine[i]))
	#xx.append(arr)
	xx.insert(0, arr)
xx = np.array(xx)

yy = []
for line in open('y1.txt').readlines():
	arr = []
	curLine = line.strip().split(' ')
	for i in range(3):
		arr.append(int(curLine[i]))
	#yy.append(arr)
	yy.insert(0, arr)
yy = np.array(yy)

U = -1 - np.cos(xx**2 + yy)
V = 1 + xx - yy
speed = np.sqrt(U**2 + V**2)
UN = U/speed
VN = V/speed
plot1 = plt.figure()
Y, X = np.mgrid[0:2:3j, 0:2:3j]
#plt.quiver(xx, yy, UN, VN,  \
plt.quiver(X, Y, UN, VN,  \
	   U,\
	   cmap=cm.seismic,\
	   headlength=5)
plt.show(plot1)
