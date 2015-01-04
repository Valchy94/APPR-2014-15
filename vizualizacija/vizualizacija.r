# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid sveta.\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "europa", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")
drzave <- c('Belgium','Bulgaria','Czech Republic','Denmark', 'Germany','Estonia','Ireland',
            'Greece','Spain','France','Italy', 'Cyprus','Latvia','Lithuania','Luxembourg',
            'Hungary','Malta','Netherlands','Austria','Poland','Portugal','Romania',
            'Slovenia','Slovakia','Finland','Sweden','United Kingdom')
drzave <- drzave[drzave %in% svet$name_long]
EU <- svet[svet$name_long %in% drzave,]
casa<-c(cas$Time[1:16],cas$Time[18:27])
dela<-c(delo$Work[1:16],delo$Work[18:27])
denarja<-c(denar$Money[1:16],denar$Money[18:27])
moci<-c(moc$Power[1:16],moc$Power[18:27])
zdravja<-c(zdravje$Health[1:16],zdravje$Health[18:27])
znanja<-c(znanje$Knowledge[1:16],znanje$Knowledge[18:27])
EU$casmz <- casa
EU$delomz<-dela
EU$denarmz<-denarja
EU$mocmz<-moci
EU$zdravjemz<-zdravja
EU$znanjemz<-znanja
koordinate <- coordinates(EU)
imena <- as.character(EU$name)
rownames(koordinate) <- imena
names(imena) <- imena
koordinate["Cyprus",2] <- koordinate["Cyprus",2] - 1
koordinate["United Kingdom",1] <- koordinate["United Kingdom",1]+1
koordinate["United Kingdom",2] <- koordinate["United Kingdom",2]-1
koordinate["Sweden",1] <- koordinate["Sweden",1]-1
koordinate["Greece",1] <- koordinate["Greece",1]-0.8
koordinate["Finland",2] <- koordinate["Finland",2]-2
imena["United Kingdom"] <- "United\nKingdom"

#Rišem zemljevide
cat("Rišem zemljevide v PDF.\n")

pdf("slike/zemljevid.pdf")
print(spplot(EU, 'casmz', xlim=c(-25,40), ylim=c(33,73), 
       main = "Enakopravnost spolov glede na prosti čas",
       col.regions=rainbow(26, start=0, end=3/7),
       sp.layout=list(
         list("sp.text", koordinate, imena, cex=0.6)),
       par.settings = list(panel.background=list(col="#FDFD99"))))

print(spplot(EU, 'delomz', xlim=c(-25,40), ylim=c(33,73), 
             main = "Enakopravnost spolov glede na delo",
             col.regions=rainbow(26, start=0, end=3/7),
             sp.layout=list(
               list("sp.text", koordinate, imena, cex=0.6)),
             par.settings = list(panel.background=list(col="#FDFD99"))))

print(spplot(EU, 'denarmz', xlim=c(-25,40), ylim=c(33,73), 
             main = "Enakopravnost spolov glede na prihodke",
             col.regions=rainbow(26, start=0, end=3/7),
             sp.layout=list(
               list("sp.text", koordinate, imena, cex=0.6)),
             par.settings = list(panel.background=list(col="#FDFD99"))))

print(spplot(EU, 'mocmz', xlim=c(-25,40), ylim=c(33,73), 
             main = "Enakopravnost spolov glede na moč",
             col.regions=rainbow(26, start=0, end=3/7),
             sp.layout=list(
               list("sp.text", koordinate, imena, cex=0.6)),
             par.settings = list(panel.background=list(col="#FDFD99"))))

print(spplot(EU, 'zdravjemz', xlim=c(-25,40), ylim=c(33,73), 
             main = "Enakopravnost spolov glede na zdravje",
             col.regions=rainbow(26, start=0, end=3/7),
             sp.layout=list(
               list("sp.text", koordinate, imena, cex=0.6)),
             par.settings = list(panel.background=list(col="#FDFD99"))))

print(spplot(EU, 'znanjemz', xlim=c(-25,40), ylim=c(33,73), 
             main = "Enakopravnost spolov glede na znanje",
             col.regions=rainbow(26, start=0, end=3/7),
             sp.layout=list(
               list("sp.text", koordinate, imena, cex=0.6)),
             par.settings = list(panel.background=list(col="#FDFD99"))))
dev.off()


# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.obcine <- c()
#   manjkajo <- ! nove.obcine %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.obcine[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }
# 
# # Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# druzine <- preuredi(druzine, obcine)
# 
# # Izračunamo povprečno velikost družine.
# druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
# min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
# max.povprecje <- max(druzine$povprecje, na.rm=TRUE)
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid...\n")
# pdf("slike/povprecna_druzina.pdf", width=6, height=4)
# 
# n = 100
# barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# plot(obcine, col = barve)
# 
# dev.off()