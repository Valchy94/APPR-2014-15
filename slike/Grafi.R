pdf("slike/grafi.pdf",paper="a4")
#Graf, ki prikazuje index enakopravnosti glede na prosti čas
i<-0.5
j<-1
barplot(cas[1:28,2], 
        #names.arg = rownames(cas)[1:28], 
        col= rainbow(28, start=0,end=5/8), xlab="Država", 
        ylab="Delež v %", 
        main="Enakopravnost glede na prosti čas")
while (j<28){
  mtext(rownames(cas)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(cas)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na delo
i<-0.5
j<-1
barplot(delo[1:28,2],
        #names.arg = rownames(delo)[1:28],
        col=heat.colors(28,alpha=2/3), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na delo")
while (j<28){
  mtext(rownames(delo)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(delo)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na denar
i<-0.5
j<-1
barplot(denar[1:28,2],
        #names.arg = rownames(denar)[1:28],
        col=topo.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na denar")
while (j<28){
  mtext(rownames(denar)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(denar)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na moč
i<-0.5
j<-1
barplot(moc[1:28,2],
        #names.arg = rownames(moc)[1:28],
        col=cm.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na moc")
while (j<28){
  mtext(rownames(moc)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(moc)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na zdravje
i<-0.5
j<-1
barplot(zdravje[1:28,2],
        #names.arg = rownames(zdravje)[1:28],
        col=rainbow(28, start=1/2,alpha=3/4), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na zdravje")
while (j<28){
  mtext(rownames(zdravje)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(zdravje)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na znanje (izobraževanje, izobrazbo)
i<-0.5
j<-1
barplot(znanje[1:28,2],
        #names.arg = rownames(znanje)[1:28],
        col=rainbow(28, start=0, end=2/6), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na izobrazbo")
while (j<28){
  mtext(rownames(znanje)[j], side=1, at=i, cex=0.55)
  i<-i+1.205
  j<-j+1
}
mtext(rownames(znanje)[28], side=1, at=33.7, cex= 0.55)


#Graf, ki prikazuje primerjavo med moškimi in ženskami 
#glede na povprečje opravljenih delovnih ur/teden Sloveniji
leta <- 2008:2013
podatki.zenske <- teden_zenske[22,1:6]
podatki.moski <- teden_moski[22,1:6]
plot(range(leta), range(c(podatki.zenske, podatki.moski)), "n",
     xlab="Leto", ylab="Delovne ure/teden",
     main="Opravljeno delo v Sloveniji")
lines(leta, podatki.zenske, type="p", pch=20, col="magenta")
lines(leta, podatki.moski, type="p", pch=20, col="blue")
text(2012.3,43.1, "Prikaz razlike m/ž",cex=3/4)

dev.off()
