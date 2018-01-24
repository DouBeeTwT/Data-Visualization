rmsf1=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md1.out")
rmsf2=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md2.out")
rmsf3=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md3.out")
rmsf4=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md4.out")
rmsf5=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md5.out")
rmsf6=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md6.out")
#rmsf7=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md7.out")
#rmsf8=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md8.out")
#rmsf9=read.table("D:/Study/PIMA/DATA/COOH/RMSF/rmsf_md9.out")

rmsf=rbind(rmsf1,rmsf2,rmsf3,rmsf4,rmsf5,rmsf6)
rmsf=cbind(rmsf,rep(c("rmsf1","rmsf2","rmsf3","rmsf4","rmsf5",
                      "rmsf6"),each=282))
colnames(rmsf)=c("num","rmsf","Group")

library(ggplot2)
library(grid)

t <- theme_bw()+theme(legend.background=element_blank())
t <- t+theme(axis.text.x=element_text(size=15,face="bold"))
t <- t+theme(axis.text.y=element_text(size=15,face="bold"))
t <- t+theme(axis.title.x=element_text(size=25,face="bold"))
t <- t+theme(axis.title.y=element_text(size=25,face="bold"))

p1=ggplot(data=rmsf,aes(x=num,y=rmsf,colour=Group))+geom_line()
p1=p1+xlab("Residue Numbers")+ylab("RMSF(\uc5)")+ylim(0,5)+t
p1=p1+annotate("rect",xmin=164,xmax=200,ymin=0,ymax=5,fill="skyblue",alpha=.3)
p1=p1+annotate("rect",xmin=227,xmax=250,ymin=0,ymax=5,fill="pink",alpha=.3)
p1



