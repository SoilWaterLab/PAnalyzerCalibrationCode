# P Analyzer Calibration R Script
#
#
# set working directory
setwd("C:\\Users\\Sheila\\Documents\\Cornell\\Research\\PhD!\\P_calibration_code")
#
# read in data
pdata=read.table("ptestData.txt",header=T)
#
# read in calibration
pcalib=read.table("ptestCalib.txt",header=T)
#
# read in check calibration
pcheck=read.table("ptestCheck.txt",header=T)
#
# read in filter method blanks: di and di filtered (dif)
pDI=read.table("ptestDI.txt",header=T)
#
# read in other method blanks (if necessary)
pblanks=read.table("ptestBlanks.txt",header=T)
#
# linear model
p.lm=lm(KnownPppm~HeightAu,data=pcalib)
summary(p.lm)
#
# save coeff's
inter=p.lm$coeff[1]
slope=p.lm$coeff[2]
R2=summary(p.lm)$r.squared #check this should be close to 1.00
#
# make prediction
p.predict=predict(p.lm)
#
# plot calibration points and model
plot(pcalib$KnownPppm~pcalib$HeightAu,pch=16)
lines(p.predict~pcalib$HeightAu,lwd=3,col="red")
#
# add check points
points(pcheck$KnownPppm~pcheck$HeightAu,pch=1)
legend("topleft",c("calibration","checks"),pch=c(16,1))
#
# recalc di conc's
pDI$myPppm=pDI$HeightAu*slope+inter
concPinFilter=mean(pDI$myPppm[pDI$SampleID=="dif"]-pDI$myPppm[pDI$SampleID=="di"])
# if negative set to zero
if(concPinFilter[1]<0) {
  concPinFilter=0
}
#
# recalc p conc's in data table
pdata$myPppm=(pdata$HeightAu*slope+inter)-concPinFilter
#
# -----------------------------------------------------
# OPTIONAL CODE
#
# For other method blanks
# if you have other method blanks
pblanks$myPppm=pblanks$HeightAu*slope+inter
pdata$myPppmFix=pdata$myPppm-mean(pblanks$myPppm) #subtract method blanks
#
# mark limits
for (i in 1:dim(pdata)[1]){
  if(pdata$myPppmFix[i]<0) {
    pdata$myPppmFix[i]="NA"
  }
}
#
# For dilutions
dilutionFactor=10 #i.e. 10 for 10x, 100 for 100x
for (i in 1:dim(pdata)[1]){
  if(pdata$myPppm[i]!="NA") {
    pdata$myPppmFix[i]=as.numeric(pdata$myPppm[i])*dilutionFactor
  }
}
#
# -----------------------------------------------------
#
# export newly calculated data
write.table(pdata, "ptestNewData.txt", sep="\t")
