##################################
#script to tidy up Liu et al data#
###to remove sites without age####
##################################

#read in data
setwd("C:/Users/Phil/Documents/My Dropbox/Work/PhD/Publications, Reports and Responsibilities/Publications/Liu_et_al/Liu_reanalysis")
Liu<-read.csv("Liu_et_al.csv")

#subset to give only columns of interest
head(Liu)
as.factor(Liu$Site)
factor(Liu$Site)
Liu_sub<-Liu[-c(2:4,6,18:22)]
Liu_sub<-Liu_sub[-c(898:903),]
colnames(Liu_sub)<-c("ID","Site","Lat","Long","Mean_T","Mean_precip","AGB","L_AGB","T_AGB","Age","A_L_Ratio","A_T_Ratio","Ref")
Liu_sub<-subset(Liu_sub,AGB>0)
head(Liu_sub)
levels(Liu_sub$Site)<-seq(1:449)
Liu_sub$Age_sq<-Liu_sub$Age^2
Liu_sub2<-subset(Liu_sub,Age>0)

write.csv(Liu_sub2,"Liu_Aged.csv")