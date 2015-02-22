# 4. faza: Analiza podatkov

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
barva<-rainbow(28,start=0,end=7/10)
sloimena1=c(sloimena[1:14],"Luksemburg",
            sloimena[16],"Malta",sloimena[17:25],
            "Združeno Kraljestvo","EU (27 držav)")
pdf("slike/analiza.pdf",paper="a4")
plot(denar$Money,BDP$X2010,
     main = "BDP glede na enakopravnost v dohodku",
     xlab = "BDP na prebivalca v standardih kupne moči",
     ylab = "Indeks enakopravnosti glede na denarne vire",
     col=rainbow(28),
     pch=rep(20,28))
legend(40,260,sloimena1,pch=rep(20,14),
       col=barva,cex=0.7,y.intersp=0.7,x.intersp=0.2)
dev.off()