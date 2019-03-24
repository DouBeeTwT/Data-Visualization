import numpy as np

# def p function
def p(x,y):
    return np.array([[1],[x],[y],[x**2],[x*y],[y**2]])
# def w function
def w(s):
    if s <= 0.5:
        return 2.0/3-4*(s**2)+4*(s**3)
    elif 0.5 < s <= 1:
        return 4.0/3-4*s+4*(s**2)-4.0/3*(s**3)
    elif s > 1:
        return 0
    else:
        print("Error: Distance out of range")
        exit(-1)

def distance(vec1,vec2):
    return np.sqrt(np.sum(np.square(vec1 - vec2)))

def MLS(data,Smax):
    Lenth = len(data[:,0])
    R = np.zeros((Lenth,3))
    for i in range (Lenth):
        datai = []
        for j in range (Lenth):
            S = distance(data[i],data[j])
            if 0 <= S <= Smax:
                datai.append([j,S/Smax])
        A = np.zeros((6,6))
        datai = np.array(datai)
        #print(datai)
        B = np.zeros((6,1))
        Y = []
        if len(datai[:,0])<=5:
            R[i] = [data[i,0],data[i,1],data[i,2]]
        elif len(data[:,0])>5:
            for j in range(len(datai[:,0])):
                P = p(data[int(datai[j,0]),0],data[int(datai[j,0]),1])
                A = A + w(datai[j,1])*np.matmul(P,P.T)
                B = B + w(datai[j,1])*P*data[int(datai[j,0]),2]
            #print(A,B)
            r = np.matmul(p(data[i,0],data[i,1]).T,np.matmul(np.linalg.pinv(A),B))
            R[i] = [data[i,0],data[i,1],r[0]]
        #print(i)
    return R

input = np.loadtxt("D:/Github/Data-Visualization/3D-Surface/result.dat")
data = MLS(input[:,[0,1,2]],1.3)
np.savetxt("D:/Github/Data-Visualization/3D-Surface/MLS-result.dat",data)
