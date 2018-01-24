rmsd1=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md1.out")
rmsd2=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md2.out")
rmsd3=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md3.out")
rmsd4=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md4.out")
rmsd5=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md5.out")
rmsd6=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md6.out")
rmsd7=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md7.out")
rmsd8=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md8.out")
rmsd9=read.table("D:/Study/PIMA/DATA/COOH/RMSD/rmsd_md9.out")

rmsd=rbind(rmsd1[1:25000,],rmsd2[1:25000,],rmsd3[1:25000,],
           rmsd4[1:25000,],rmsd5[1:25000,],rmsd6[1:25000,],
           rmsd7[1:25000,],rmsd8[1:25000,],rmsd9[1:25000,])
rmsd=cbind(rmsd,rep(c("rmsd1","rmsd2","rmsd3","rmsd4","rmsd5",
                      "rmsd6","rmsd7","rmsd8","rmsd9"),each=25000))
colnames(rmsd)=c("num","rmsd","Group")

t <- theme_bw()+theme(legend.background=element_blank())
t <- t+theme(axis.text.x=element_text(size=15,face="bold"))
t <- t+theme(axis.text.y=element_text(size=15,face="bold"))
t <- t+theme(axis.title.x=element_text(size=25,face="bold"))
t <- t+theme(axis.title.y=element_text(size=25,face="bold"))

p1=ggplot(data=rmsd,aes(x=num/500,y=rmsd,colour=Group))+geom_line()
p1=p1+xlab("Time(ns)")+ylab("RMSD(\uc5)")+t

p2=ggplot(data=rmsd,aes(x=num/500,y=rmsd,colour=Group))+geom_smooth()
p2=p2+xlab("Time(ns)")+ylab("RMSD(\uc5)")+t

grid.newpage()
pushViewport(viewport(layout = grid.layout(2,1)))
vplayout = function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(p1, vp = vplayout(1, 1))
print(p2, vp = vplayout(2, 1))