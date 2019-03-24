dist1_1 = read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md1.txt")
dist1_1 = read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md2.txt")
dist1_1 = read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md3.txt")
dist1_1 = read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md4.txt")
dist2_1 = read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md1.txt")
dist2_2 = read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md2.txt")
dist2_3 = read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md3.txt")
dist2_4 = read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md4.txt")

dist = read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md1.txt")
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md2.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md3.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/CH3/Distance/dist_md4.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md1.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md2.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md3.txt"))
dist = rbind(dist,read.table("D:/Study/PIMA/DATA/C3-OH_CH3/Distance/dist_md4.txt"))
dist = cbind(dist,rep(c("No-OH","C3-OH"),each=100000))
colnames(dist)=c("Time","Distance","Group")

library(ggplot2)

text_size=15;title_size=25
ts <- theme_bw()
ts <- ts+theme(axis.text.x=element_text(size=text_size,face="bold"))
ts <- ts+theme(axis.text.y=element_text(size=text_size,face="bold"))
ts <- ts+theme(axis.title.x=element_text(size=title_size,face="bold"))
ts <- ts+theme(axis.title.y=element_text(size=title_size,face="bold"))

p <- ggplot(data=dist[1:100000,],aes(Distance,fill=Group))+geom_histogram(bins=50,alpha=.5)
p <- p+geom_histogram(data=dist[100001:200000,],aes(Distance,fill=Group),bins=50,alpha=.5)
p <- p+xlab("Distance of MOL138@O1-HIS261@NE2(\uc5)")+ylab("Appear Times")+ts
p
