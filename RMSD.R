#=============================================================================#
# Author:         DoubeeTwT
# Function Name : RMSD
# Usage:          RMSD(n=25000,t=0.002,text_size=15,title_size=25,f=c(...))
#
#                 -n           num,number of frames you choose
#                 -t           num,interval time you use in MD     
#                 -text_size   num,size of x-axis and y-axis text
#                 -title_size  num,size of x-axis and y-axis title
#                 -f           str,your input files' names
#
# Attention:      1)The input file must be 2 columns(Frames;RMSD Value)
#                 2)No more than 12 files input.If you really need to,
#                 you can add more group names into "groupname" which
#                 located in the first line of the RMSD function.
#=============================================================================#

RMSD <- function(n=25000,t=0.002,text_size=15,title_size=25,f=c(...)){
  groupname=c("rmsd1","rmsd2","rmsd3","rmsd4","rmsd5","rmsd6",
              "rmsd7","rmsd8","rmsd9","rmsd10","rmsd11","rmsd12")
  len=length(f)
  rmsd=read.table(f[1])[1:n,]
  for (i in 2:len) {
    rmsd=rbind(rmsd,read.table(f[i])[1:n,])
  }
  rmsd=cbind(rmsd,rep(groupname[1:len],each=n))
  colnames(rmsd)=c("num","rmsd","Group")
  
  library(ggplot2);library(grid)
  ts <- theme_bw()
  ts <- ts+theme(axis.text.x=element_text(size=text_size,face="bold"))
  ts <- ts+theme(axis.text.y=element_text(size=text_size,face="bold"))
  ts <- ts+theme(axis.title.x=element_text(size=title_size,face="bold"))
  ts <- ts+theme(axis.title.y=element_text(size=title_size,face="bold"))
  
  p1=ggplot(data=rmsd,aes(x=num*t,y=rmsd,colour=Group))+geom_line()
  p1=p1+xlab("Time(ns)")+ylab("RMSD(\uc5)")+ts
  
  p2=ggplot(data=rmsd,aes(x=num*t,y=rmsd,colour=Group))+geom_smooth()
  p2=p2+xlab("Time(ns)")+ylab("RMSD(\uc5)")+ts
  
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(2,1)))
  vplayout = function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
  print(p1, vp = vplayout(1, 1))
  print(p2, vp = vplayout(2, 1))
  
}

#RMSD(f=c("File name1","File name2",...))