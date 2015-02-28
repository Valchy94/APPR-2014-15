# 4. faza: Analiza podatkov
library(mgcv)

# Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")
# 
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()
cat("Rišem graf.\n")
#barva<-rainbow(28,start=0,end=7/10)
#Želim prikazati, kako so države razvrščene po indeksu enakopravnosti
X<-scale(as.matrix(denar[1]))
t <- hclust(dist(X), method = "ward.D")
GDP<-BDP$X2010
Mo<-denar$Money
model<-gam(Mo~s(GDP))
#model<-lm(Mo~I(log1p(GDP)))

sloimena1=c(sloimena[1:14],"Luksemburg",
            sloimena[16],"Malta",sloimena[17:25],
            "Združeno Kraljestvo","EU (27 držav)")
pdf("slike/analiza.pdf",paper="a4",family="Arial")

#Želim prikazati, kako so države razvrščene po indeksu enakopravnosti:
plot(t, hang=-1, cex=0.6, 
     main = "Razvrstitev držav po indeksu enakopravnosti",
     xlab="Države",
     ylab="Medsebojno razlikovanje")
#BDP glede na enakopravnost v dohodkih:
plot(BDP$X2010,denar$Money,
     main = "BDP glede na enakopravnost v dohodku",
     xlab = "BDP na prebivalca v standardih kupne moči",
     ylab = "Indeks enakopravnosti glede na denarne vire",
     #col=rainbow(28),
     pch=rep(20,28))
curve(predict(model,data.frame(GDP=x)),add=TRUE,col="red")

# legend(200,80,sloimena1,pch=rep(20,14),
#        col=barva,cex=0.7,y.intersp=0.7,x.intersp=0.2)
#Malo bom preverila kaj je z rodnostjo:
plot(znanje$Index,rodnost$X2010,
     main = "Stopnja rodnosti glede na enakopravnost",
     xlab = "Indeks enakopravnosti po posameznih državah",
     ylab = "Stopnja rodnosti v letu 2010")
indeks<-znanje$Index
rodn<-rodnost$X2010
#curve(predict(gam(rodn~s(indeks)),data.frame(indeks=x)),add=TRUE,col="magenta")
curve(predict(loess(rodn~indeks)),data.frame(indeks=x)),add=TRUE,col="cyan")
# legend(60,1.7,sloimena1,pch=rep(20,14),
#        col=barva,cex=0.7,y.intersp=0.7,x.intersp=0.2)
#zaposlenost glede na enakopravnost v znanju
plot(znanje$Knowledge, zaposlenost$X2010,
     main="Stopnja zaposlenosti glede na enakopravnost v znanju",
     xlab="Indeks enakopravnosti glede na pridobivanje znanja",
     ylab="Stopnja zaposlenosti v letu 2010")
#abline(lm(zaposlenost$X2010~znanje$Knowledge),col="blue")
znam<-znanje$Knowledge
delam<-zaposlenost$X2010
nekaj<-gam(delam~s(znam))
curve(predict(nekaj,data.frame(znam=x)),add=TRUE,col="blue")

dev.off()