pdf("slike/grafi.pdf",paper="a4")
#Graf, ki prikazuje index enakopravnosti glede na prosti čas
#i<-0.5
#j<-1
barplot(cas[1:28,2], 
        beside=TRUE,
        names.arg = rownames(delo)[1:28],
        col= rainbow(28, start=0,end=5/8), xlab="Država", 
        ylab="Delež v %", 
        main="Enakopravnost glede na prosti čas",
        cex.names=0.55, las=2)
# while (j<28){
#   mtext(rownames(cas)[j], side=1, at=i, cex=0.55)
#   i<-i+1.205
#   j<-j+1
# }
# mtext(rownames(cas)[28], side=1, at=33.7, cex= 0.55)

#Graf, ki prikazuje index enakopravnosti glede na delo
barplot(delo[1:28,2],
        names.arg = rownames(delo)[1:28],
        beside=TRUE,
        col=heat.colors(28,alpha=2/3), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na delo",
        cex.names=0.55, las=2)

#Graf, ki prikazuje index enakopravnosti glede na denar
barplot(denar[1:28,2],
        names.arg = rownames(denar)[1:28],
        beside=TRUE,
        col=topo.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na denar",
        cex.names=0.55, las=2)

#Graf, ki prikazuje index enakopravnosti glede na moč
barplot(moc[1:28,2],
        names.arg = rownames(moc)[1:28],
        beside=TRUE,
        col=cm.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na moč",
        cex.names=0.55, las=2)

#Graf, ki prikazuje index enakopravnosti glede na zdravje
barplot(zdravje[1:28,2],
        names.arg = rownames(zdravje)[1:28],
        beside=TRUE,
        col=rainbow(28, start=1/2,alpha=3/4), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na zdravje",
        cex.names=0.55, las=2)

#Graf, ki prikazuje index enakopravnosti glede na znanje (izobraževanje, izobrazbo)
barplot(znanje[1:28,2],
        names.arg = rownames(znanje)[1:28],
        beside=TRUE,
        col=rainbow(28, start=0, end=2/6), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na izobrazbo",
        cex.names=0.55, las=2)

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
