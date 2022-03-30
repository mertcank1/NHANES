library(nhanesA)
library(SASxport)
library("writexl")
nhanesTables('Q', 2015)
nhanesTableVars('Q', 'DPQ_I')
DPQ_E
nhanesTables('Q', 2005)
DPQ_D2005_2006 <- nhanes('DPQ_D')
Demo_D2005_2006 <- nhanes('DEMO_D')
Demo_D2005_2006<- Demo_D2005_2006[,c(1,5,6,15,17,22)]
OCQ_D2005_2006 <- nhanes('OCQ_D')
OCQ_D2005_2006 <-OCQ_D2005_2006[,1:2] 
BMX_D2005_2006 <- nhanes('BMX_D')
BMX_D2005_2006<-BMX_D2005_2006[,c(1,3)]
Dx2005_2006 <- merge(OCQ_D2005_2006, BMX_D2005_2006,by = "SEQN",all = TRUE)
D2005_2006 <- merge(DPQ_D2005_2006, Demo_D2005_2006,by = "SEQN",all = TRUE)
D2005_2006<- merge(D2005_2006, Dx2005_2006,by = "SEQN",all = TRUE)
nrow(D2005_2006)
year=rep("2005-2006",10348)
DPQ_D2005_2006<-cbind(D2005_2006,year)
############################################
DPQ_D2007_2008 <- nhanes('DPQ_E')
Demo_D2007_2008 <- nhanes('DEMO_E')
Demo_D2007_2008<- Demo_D2007_2008[,c(1,5,6,15,17,22)]
OCQ_D2007_2008 <- nhanes('OCQ_E')
OCQ_D2007_2008 <-OCQ_D2007_2008[,1:2] 
BMX_D2007_2008 <- nhanes('BMX_E')
BMX_D2007_2008<-BMX_D2007_2008[,c(1,3)]
Dx2007_2008 <- merge(OCQ_D2007_2008, BMX_D2007_2008,by = "SEQN",all = TRUE)
D2007_2008 <- merge(DPQ_D2007_2008, Demo_D2007_2008,by = "SEQN",all = TRUE)
D2007_2008<- merge(D2007_2008, Dx2007_2008,by = "SEQN",all = TRUE)
nrow(D2007_2008)
year=rep("2007-2008",10149)
DPQ_D2007_2008<-cbind(D2007_2008,year)
############################################
DPQ_D2009_2010 <- nhanes('DPQ_F')
Demo_D2009_2010 <- nhanes('DEMO_F')
Demo_D2009_2010<- Demo_D2009_2010[,c(1,5,6,15,17,22)]
OCQ_D2009_2010 <- nhanes('OCQ_F')
OCQ_D2009_2010 <-OCQ_D2009_2010[,1:2] 
BMX_D2009_2010 <- nhanes('BMX_F')
BMX_D2009_2010<-BMX_D2009_2010[,c(1,3)]
Dx2009_2010 <- merge(OCQ_D2009_2010, BMX_D2009_2010,by = "SEQN",all = TRUE)
D2009_2010 <- merge(DPQ_D2009_2010, Demo_D2009_2010,by = "SEQN",all = TRUE)
D2009_2010<- merge(D2009_2010, Dx2009_2010,by = "SEQN",all = TRUE)
nrow(D2009_2010)
year=rep("2009-2010",10537)
DPQ_D2009_2010 <-cbind(D2009_2010,year)
############################################
DPQ_D2011_2012 <- nhanes('DPQ_G')
Demo_D2011_2012 <- nhanes('DEMO_G')
Demo_D2011_2012<- Demo_D2011_2012[,c(1,4,5,18,19,37)]
OCQ_D2011_2012 <- nhanes('OCQ_G')
OCQ_D2011_2012 <-OCQ_D2011_2012[,1:2] 
BMX_D2011_2012 <- nhanes('BMX_G')
BMX_D2011_2012<-BMX_D2011_2012[,c(1,3)]
Dx2011_2012<- merge(OCQ_D2011_2012, BMX_D2011_2012,by = "SEQN",all = TRUE)
D2011_2012 <- merge(DPQ_D2011_2012, Demo_D2011_2012,by = "SEQN",all = TRUE)
D2011_2012<- merge(D2011_2012, Dx2011_2012,by = "SEQN",all = TRUE)
nrow(D2011_2012)
year=rep("2011-2012",9756)
DPQ_D2011_2012<-cbind(D2011_2012,year)
############################################
DPQ_D2013_2014 <- nhanes('DPQ_H')
Demo_D2013_2014 <- nhanes('DEMO_H')
Demo_D2013_2014<- Demo_D2013_2014[,c(1,4,5,17,18,47)]
OCQ_D2013_2014 <- nhanes('OCQ_H')
OCQ_D2013_2014<-OCQ_D2013_2014[,1:2] 
BMX_D2013_2014 <- nhanes('BMX_H')
BMX_D2013_2014<-BMX_D2013_2014[,c(1,3)]
Dx2013_2014<- merge(OCQ_D2013_2014, BMX_D2013_2014,by = "SEQN",all = TRUE)
D2013_2014 <- merge(DPQ_D2013_2014, Demo_D2013_2014,by = "SEQN",all = TRUE)
D2013_2014<- merge(D2013_2014, Dx2013_2014,by = "SEQN",all = TRUE)
nrow(D2013_2014)
year=rep("2013-2014",10175)
DPQ_D2013_2014<-cbind(D2013_2014,year)
############################################
DPQ_D2015_2016 <- nhanes('DPQ_I')
Demo_D2015_2016 <- nhanes('DEMO_I')
Demo_D2015_2016<- Demo_D2015_2016[,c(1,4,5,17,18,47)]
OCQ_D2015_2016 <- nhanes('OCQ_I')
OCQ_D2015_2016<-OCQ_D2015_2016[,1:2] 
BMX_D2015_2016 <- nhanes('BMX_I')
BMX_D2015_2016<-BMX_D2015_2016[,c(1,3)]
Dx2015_2016<- merge(OCQ_D2015_2016, BMX_D2015_2016,by = "SEQN",all = TRUE)
D2015_2016 <- merge(DPQ_D2015_2016, Demo_D2015_2016,by = "SEQN",all = TRUE)
D2015_2016<- merge(D2015_2016, Dx2015_2016,by = "SEQN",all = TRUE)
nrow(D2015_2016)
year=rep("2015-2016",9971)
DPQ_D2015_2016<-cbind(D2015_2016,year)
############################################
DPQ_D2017_2020 <- read.xport("P_DPQ.XPT")
Demo_D2017_2020 <- read.xport("P_DEMO.XPT")
Demo_D2017_2020<- Demo_D2017_2020[,c(1,4,5,12,13,29)]
OCQ_D2017_2020 <- read.xport("P_OCQ.XPT")
OCQ_D2017_2020<-OCQ_D2017_2020[,1:2] 
BMX_D2017_2020 <- read.xport("P_BMX.XPT")
BMX_D2017_2020<-BMX_D2017_2020[,c(1,3)]
Dx2017_2020<- merge(OCQ_D2017_2020, BMX_D2017_2020,by = "SEQN",all = TRUE)
D2017_2020 <- merge(DPQ_D2017_2020, Demo_D2017_2020,by = "SEQN",all = TRUE)
D2017_2020<- merge(D2017_2020, Dx2017_2020,by = "SEQN",all = TRUE)
nrow(D2017_2020)
year=rep("2017-2020",15560)
DPQ_D2017_2020<-cbind(D2017_2020,year)
names(DPQ_D2017_2020)[15]<-paste("DMDMARTL")
data<-rbind(DPQ_D2005_2006,DPQ_D2007_2008,DPQ_D2009_2010,DPQ_D2011_2012,DPQ_D2015_2016,DPQ_D2017_2020)
data$total<- rowSums( data[,2:10] )
write_xlsx(data, "C:\\Users\\Ali\\Desktop\\NHANESdemo.xlsx")

