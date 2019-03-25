import matplotlib.pyplot as plt
import matplotlib.colors as col
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
import numpy as np

######

data = np.loadtxt("D:/Github/Data-Visualization/3D-Surface/MLS-result.dat")
X=list({}.fromkeys(data[:,0]).keys())
X_num = len(X)
Y=list({}.fromkeys(data[:,1]).keys())
Y_num = len(Y)
X, Y = np.meshgrid(X, Y)
Z = np.array(data[:,2]).reshape(X_num,Y_num,order='F')
###
#Created by matplotlib
###
norm = plt.Normalize(Z.min(), Z.max())
colors = cm.viridis(norm(Z))
rcount, ccount, _ = colors.shape

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.grid(False)
ax.axis('off')
ax.set_zlim(-2, 5)
ax.view_init(20, -117)
ax.xaxis.set_pane_color((0,0,0,0))
ax.yaxis.set_pane_color((0,0,0,0))
ax.zaxis.set_pane_color((0,0,0,0))
plt.plot([5.5,5.5],[3.6,5.5],[-2,-2],"k-",lw=0.8)
plt.plot([3.6,5.5],[5.5,5.5],[-2,-2],"k-",lw=0.8)
plt.plot([3.6,3.6],[3.6,5.5],[-2,-2],"k-",lw=0.8)
plt.plot([3.6,5.5],[3.6,3.6],[-2,-2],"k-",lw=0.8)
plt.plot([3.6,3.6],[5.5,5.5],[-2, 5],"k-",lw=0.8)

for i in range (20):
    plt.plot([3.6+i*0.1,3.6+i*0.1],[3.6,3.65],[-2,-2],"k-",lw=0.8)
    plt.plot([3.6,3.65],[3.6+i*0.1,3.6+i*0.1],[-2,-2],"k-",lw=0.8)
for i in range (1,5):
    plt.plot([3.5+i*0.5,3.5+i*0.5],[3.6,3.7],[-2,-2],"k-",lw=0.8)
    plt.plot([3.6,3.7],[3.5+i*0.5,3.5+i*0.5],[-2,-2],"k-",lw=0.8)
    ax.text(i*0.5+3.4,3.3,-2,i*0.5+3.5,fontsize=11)
    ax.text(3.3,i*0.5+3.4,-2,i*0.5+3.5,fontsize=11)
for i in range (13):
    plt.plot([3.6,3.65],[5.5,5.5],[i*0.4,i*0.4],"k-",lw=0.8)
for i in range (4):
    plt.plot([3.6,3.7],[5.5,5.5],[i*1.6,i*1.6],"k-",lw=0.8)
    ax.text(3.3,5.5,i*1.6,str((i*16)/10),fontsize=11)

#ax.zaxis.add_axes([left, bottom, width, height])
surface = ax.plot_surface(X, Y, Z, rcount=rcount, ccount=ccount, facecolors=colors, shade=False)
surface.set_facecolor((0,0,0,0))
plt.contour(X, Y, Z, offset = -2, cmap = 'viridis')
x_min,x_max=ax.get_xlim()
y_min,y_max=ax.get_ylim()
z_min,z_max=ax.get_zlim()
#plt.savefig('G:/PIMA/US/test.png',dpi=500)
plt.show()
##########
