# WISC-5 only VC(Verbal comprehension) factor alignment.
vc.data<- read.csv("vc_allage.csv", header= T)

# When you do MGCFA (Multi-Group Confirmatory Factor Analysis), you need to set the following.
# Constraint factor variance= 1, factor mean= 0.
# Do not give a marker indicator constraint.

model.vc<-'
VC~~ 1*VC
VC~ 0*1
VC=~ NA*s2+ s6+ s11+ s15'

model.vc.cfa<- cfa(model.vc, data= vc.data, group= "age")

samplesize<- c(232, 211, 207, 197, 202, 197, 196, 197, 193, 227, 198)

vc.align.rst <- align.main(model.vc.cfa, 4, "VC", samplesize)
vc.align.rst
