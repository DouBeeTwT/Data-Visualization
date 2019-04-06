import matplotlib.pyplot as plt
import matplotlib.colors as col
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
import numpy as np

######

data = np.loadtxt("D:/Github/Data-Visualization/3D-Surface/result_40x40.dat")
X=list({}.fromkeys(data[:,0]).keys())
X_num = len(X)
Y=list({}.fromkeys(data[:,1]).keys())
Y_num = len(Y)
Y, X = np.meshgrid(Y, X)
Z = np.array(data[:,2]).reshape(X_num,Y_num)
###
#Created by matplotlib
###

norm = plt.Normalize(Z.min(), Z.max())
colors = cm.viridis(norm(Z))
rcount, ccount, _ = colors.shape

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.grid(False)
#ax.axis('off')
ax.set_zlim(-2, 7)
ax.view_init(20, -117)
ax.xaxis.set_pane_color((0,0,0,0))
ax.yaxis.set_pane_color((0,0,0,0))
ax.zaxis.set_pane_color((0,0,0,0))


#ax.zaxis.add_axes([left, bottom, width, height])
surface = ax.plot_surface(X, Y, Z, rcount=rcount, ccount=ccount, facecolors=colors, shade=False)
surface.set_facecolor((0,0,0,0))
plt.contour(X, Y, Z, offset = -2, cmap = 'viridis')
ax.set_xlabel('C-O Distance(Å)')
ax.set_ylabel('N-O Distance(Å)')
ax.set_zlabel('Free Energy(kcal/mol)')
#x_min,x_max=ax.get_xlim()
#y_min,y_max=ax.get_ylim()
#z_min,z_max=ax.get_zlim()
#plt.savefig('G:/PIMA/US/test.png',dpi=500)
plt.show()
##########
