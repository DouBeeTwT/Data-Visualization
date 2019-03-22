#=============================================================================#
# Author:         DoubeeTwT
# Function Name : RMSF
# Usage:          RMSF(text_size=15,title_size=25,f=c(...))
#
#                 -text_size   num,size of x-axis and y-axis text
#                 -title_size  num,size of x-axis and y-axis title
#                 -f           str,your input files' names
#
# Attention:      1)The input file must be 2 columns(Res number;RMSF Value)
#                 2)No more than 12 files input.If you really need to,
#                 you can add more group names into "groupname" which
#                 located in the first line of the RMSD function.
#=============================================================================#

RMSF <- function(text_size=15,title_size=25,f=c(...)){
  groupname=c("rmsf1","rmsf2","rmsf3","rmsf4","rmsf5","rmsf6",
              "rmsf7","rmsf8","rmsf9","rmsf10","rmsf11","rmsf12")
  len=length(f)
  rmsf=read.table(f[1])
  n=length(rmsf$V1)
  for (i in 2:len) {
    rmsf=rbind(rmsf,read.table(f[i]))
  }
  rmsf=cbind(rmsf,rep(groupname[1:len],each=n))
  colnames(rmsf)=c("num","rmsf","Group")
  
  library(ggplot2);library(grid)
  ts <- theme_bw()
  ts <- ts+theme(axis.text.x=element_text(size=text_size,face="bold"))
  ts <- ts+theme(axis.text.y=element_text(size=text_size,face="bold"))
  ts <- ts+theme(axis.title.x=element_text(size=title_size,face="bold"))
  ts <- ts+theme(axis.title.y=element_text(size=title_size,face="bold"))
  
  p1=ggplot(data=rmsf,aes(x=num,y=rmsf,colour=Group))+geom_line()
  p1=p1+xlab("Residue Numbers")+ylab("RMSF(\uc5)")+ylim(0,5)+ts
  
  #p1=p1+annotate("rect",xmin=164,xmax=200,ymin=0,ymax=5,fill="skyblue",alpha=.3)
  #p1=p1+annotate("rect",xmin=227,xmax=250,ymin=0,ymax=5,fill="pink",alpha=.3)
  # ====== You can use code above to highlight the zone you want to show ===== #
  
  p1
  
}

#RMSF(f=c("File name1","File name2",...))
