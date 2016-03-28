def hello(name):
    return "Hello, " + name + "!";
a = 13

from matplotlib.pyplot import cm
import matplotlib.pyplot as plt
import numpy as np

xfile = 'er8xVel'; yfile = 'er8yVel'
numCols = len(open(xfile).readline().strip().split('  '));
xx = []
for line in open(xfile).readlines():
	arr = []
	curLine = line.strip().split('  ')
	for i in range(numCols):
		arr.append(float(curLine[i]))
	#xx.append(arr)
	xx.insert(0, arr)
xx = np.array(xx)

yy = []
for line in open(yfile).readlines():
	arr = []
	curLine = line.strip().split('  ')
	for i in range(numCols):
		arr.append(float(curLine[i]))
	#yy.append(arr)
	yy.insert(0, arr)
yy = np.array(yy)

# U = -1 - np.cos(xx**2 + yy)
# V = 1 + xx - yy
speed = np.sqrt(xx**2 + yy**2)
UN = xx/speed
VN = yy/speed
plot1 = plt.figure()
Y, X = np.mgrid[0:23:24j, 0:31:32j]
#plt.quiver(xx, yy, UN, VN,  \
# plt.quiver(X, Y, UN, VN,\
	   # xx,\
	   # cmap=cm.seismic,\
	   # headlength=7)
plt.quiver(xx, yy)
plt.show(plot1)
print numCols
