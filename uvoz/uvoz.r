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
                       as.is = TRUE, row.names = 1, 
                       fileEncoding = "Windows-1250"))
   }
cat("Uvažam podatke o spolni enakopravnosti glede na preživljanje prostega časa.\n")
index_cas <- uvoziTabelo_cas()

#DELO
uvoziTabelo_delo <- function() {
  return(read.table("podatki/index_delo.csv", header=TRUE, sep = ";", 
                    as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na delo.\n")
index_delo <- uvoziTabelo_delo()

#DENAR
uvoziTabelo_denar <- function() {
  return(read.table("podatki/index_denar.csv", header=TRUE, sep = ";", 
                    as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na denar.\n")
index_denar <- uvoziTabelo_denar()

#MOČ
uvoziTabelo_moc <- function() {
  return(read.table("podatki/index_moc.csv", header=TRUE, sep = ";", 
                    as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na moč.\n")
index_moc <- uvoziTabelo_moc()

#ZNANJE
uvoziTabelo_znanje <- function() {
  return(read.table("podatki/index_znanje.csv", header=TRUE, sep = ";", 
                    as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na znanje.\n")
index_znanje <- uvoziTabelo_znanje()

#ZDRAVJE
uvoziTabelo_zdravje <- function() {
  return(read.table("podatki/index_zdravje_2010.csv", header=TRUE, sep = ";", 
                    as.is = TRUE, row.names = 1, 
                    fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o spolni enakopravnosti glede na zdravje.\n")
index_zdravje_2010 <- uvoziTabelo_zdravje()