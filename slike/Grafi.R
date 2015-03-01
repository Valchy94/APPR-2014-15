pdf("slike/grafi.pdf",paper="a4")
#Graf, ki prikazuje index enakopravnosti glede na prosti čas
#i<-0.5
#j<-1
attach(cas)
cas1<-cas[order(Time[1:27]),]
imenacas<-c(rownames(cas1),rownames(cas)[28])
barplot(c(cas1$Time,cas$Time[28]), 
        beside=TRUE,
        names.arg = imenacas,
        col= rainbow(28, start=0,end=5/8), xlab="Država", 
        ylab="Delež v %", 
        main="Enakopravnost glede na prosti čas",
        cex.names=0.55, las=2)
detach(cas)
# while (j<28){
#   mtext(rownames(cas)[j], side=1, at=i, cex=0.55)
#   i<-i+1.205
#   j<-j+1
# }
# mtext(rownames(cas)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na delo
attach(delo)
delo1<-delo[order(Work[1:27]),]
imenadelo<-c(rownames(delo1),rownames(delo)[28])
barplot(c(delo1$Work,delo$Work[28]),
        names.arg = imenadelo,
        beside=TRUE,
        col=heat.colors(28,alpha=2/3), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na delo",
        cex.names=0.55, las=2)
detach(delo)
#Graf, ki prikazuje index enakopravnosti glede na denar
attach(denar)
denar1<-denar[order(Money[1:27]),]
imenadenar<-c(rownames(denar1),rownames(denar)[28])
barplot(c(denar1$Money,denar$Money[28]),
        names.arg = imenadenar,
        beside=TRUE,
        col=topo.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na denar",
        cex.names=0.55, las=2)
detach(denar)
#Graf, ki prikazuje index enakopravnosti glede na moč
attach(moc)
moc1<-moc[order(Power[1:27]),]
imenamoc<-c(rownames(moc1),rownames(moc)[28])
barplot(c(moc1$Power,moc$Power[28]),
        names.arg = imenamoc,
        beside=TRUE,
        col=cm.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na moč",
        cex.names=0.55, las=2)
detach(moc)
#Graf, ki prikazuje index enakopravnosti glede na zdravje
attach(zdravje)
zdravje1<-zdravje[order(Health[1:27]),]
imenazdravje<-c(rownames(zdravje1),rownames(zdravje)[28])
barplot(c(zdravje1$Health,zdravje$Health[28]),
        names.arg = imenazdravje,
        beside=TRUE,
        col=rainbow(28, start=1/2,alpha=3/4), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na zdravje",
        cex.names=0.55, las=2)
detach(zdravje)
#Graf, ki prikazuje index enakopravnosti glede na znanje (izobraževanje, izobrazbo)
attach(znanje)
znanje1<-znanje[order(Knowledge[1:27]),]
imenaznanje<-c(rownames(znanje1),rownames(znanje)[28])
barplot(c(znanje1$Knowledge,znanje$Knowledge[28]),
        names.arg = imenaznanje,
        beside=TRUE,
        col=rainbow(28, start=0, end=2/6), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na izobrazbo",
        cex.names=0.55, las=2)
detach(znanje)
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
text(2010.3,43.15, "Prikaz razlike v tedensko opravljenih delovnih urah",cex=6/7)
legend(2012.1,43.1, c("moški","ženske"), pch=c(20,20), col=c("blue", "magenta"))

dev.off()
