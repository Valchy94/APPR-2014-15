# # 2. faza: Uvoz podatkov
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }
# 
# # Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.

#ČAS
uvoziTabelo_cas <- function() {
     return(read.table("podatki/index_cas.csv", header=TRUE, sep = ";", 
                       dec=",", as.is = TRUE, row.names = 1, 
                       fileEncoding = "Windows-1250"))
   }
cat("Uvažam podatke o spolni enakopravnosti glede na preživljanje prostega časa.\n")
cas <- uvoziTabelo_cas()

#DELO
uvoziTabelo_delo <- function() {
  return(read.table("podatki/index_delo.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na delo.\n")
delo <- uvoziTabelo_delo()

#DENAR
uvoziTabelo_denar <- function() {
  return(read.table("podatki/index_denar.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na denar.\n")
denar <- uvoziTabelo_denar()

#MOČ
uvoziTabelo_moc <- function() {
  return(read.table("podatki/index_moc.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na moč.\n")
moc <- uvoziTabelo_moc()

#ZNANJE
uvoziTabelo_znanje <- function() {
  return(read.table("podatki/index_znanje.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na znanje.\n")
znanje <- uvoziTabelo_znanje()

#ZDRAVJE
uvoziTabelo_zdravje <- function() {
  return(read.table("podatki/index_zdravje_2010.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na zdravje.\n")
zdravje <- uvoziTabelo_zdravje()

#UVAŽANJE HTML DATOTEKE
##TEDENSKO OPR: DELOVNE URE MOŠKI
source("lib/xml.r", encoding="UTF-8")
cat("Uvažam podatke o povprečno tedensko opravljenih delovnih urah za moške.\n")
teden_moski <- uvozi.podatkim()
##TEDENSKO OPR: DEL: URE ŽENSKE
source("lib/xml.r",encoding="UTF-8")
cat("Uvažam podatke o povprečno tedensko opravljenih delovnih urah za ženske.\n")
teden_zenske <- uvozi.podatkiz()


#DODATNE TABELE ZA 4. FAZO
# *BDP
uvoziTabelo_BDP <- function() {
  return(read.table("podatki/bdp glede na pps.csv", header=TRUE, sep = ";", 
                    dec=",", as.is = TRUE, row.names=1,
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o BDP.\n")
BDP <- uvoziTabelo_BDP()

#*RODNOST
uvozitabelo_rodnost<-function(){
  return(read.table("podatki/rodnost_eu27.csv",header=TRUE,sep=";",
                    dec=",", as.is=TRUE, row.names=1,
                    fileEncoding="windows-1250"))
}
cat("Uvažam podatke o rodnosti.\n")
rodnost<-uvozitabelo_rodnost()

# *VIŠJA IZOBRAZBA
uvozitabelo_izobrazba<-function(){
  return(read.table("podatki/visja izobrazba.csv", header=TRUE, sep=";",
                    dec=",", as.is=TRUE, row.names=1,
                    fileEncoding="windows-1250"))
}
cat("Uvažam podatke o izobrazbi.\n")
izobrazba <- uvozitabelo_izobrazba()

#*STOPNJA ZAPOSLENOSTI
uvozitabelo_zaposlenost<-function(){
  return(read.table("podatki/stopnja zaposlenosti.csv", header=TRUE, sep=";",
                    dec=",", as.is=TRUE, row.names=1,
                    fileEncoding="windows-1250"))
}
cat("Uvažam podatke o zaposlenosti.\n")
zaposlenost <- uvozitabelo_zaposlenost()