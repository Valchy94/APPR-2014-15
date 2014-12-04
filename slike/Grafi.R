pdf("slike/grafi.pdf",paper="a4")
#Graf, ki prikazuje index enakopravnosti glede na prosti čas
barplot(cas[1:28,2], 
        names.arg = rownames(cas)[1:28], 
        col= rainbow(28, start=0,end=5/8), xlab="Država", 
        ylab="Delež v %", 
        main="Enakopravnost glede na prosti čas")

#Graf, ki prikazuje index enakopravnosti glede na delo
barplot(delo[1:28,2],
        names.arg = rownames(delo)[1:28],
        col=heat.colors(28,alpha=2/3), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na delo")

#Graf, ki prikazuje index enakopravnosti glede na denar
barplot(denar[1:28,2],
        names.arg = rownames(denar)[1:28],
        col=topo.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na denar")

#Graf, ki prikazuje index enakopravnosti glede na moč
barplot(moc[1:28,2],
        names.arg = rownames(moc)[1:28],
        col=cm.colors(28), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na moc")

#Graf, ki prikazuje index enakopravnosti glede na zdravje
barplot(zdravje[1:28,2],
        names.arg = rownames(zdravje)[1:28],
        col=rainbow(28, start=1/2,alpha=3/4), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na zdravje")

#Graf, ki prikazuje index enakopravnosti glede na znanje (izobraževanje, izobrazbo)
barplot(znanje[1:28,2],
        names.arg = rownames(znanje)[1:28],
        col=rainbow(28, start=0, end=2/6), xlab="Država",
        ylab="Delež v %",
        main="Enakopravnost glede na izobrazbo")


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
