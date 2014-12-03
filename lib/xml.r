# Uvoz s spletne strani

library(XML)

# # Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# # iz vozlišč, ki ustrezajo podani poti.
# stripByPath <- function(x, path) {
#   unlist(xpathApply(x, path,
#                     function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
# }
# 
# uvozi.obcine <- function() {
#   url.obcine <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   doc.obcine <- htmlTreeParse(url.obcine, useInternalNodes=TRUE)
#   
#   # Poiščemo vse tabele v dokumentu
#   tabele <- getNodeSet(doc.obcine, "//table")
#   
#   # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
#   # trenutnim vozliščem
#   vrstice <- getNodeSet(tabele[[2]], "./tr")
#   
#   # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
#   # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
#   seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
#   
#   # Iz seznama vrstic naredimo matriko
#   matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
#   
#   # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
#   colnames(matrika) <- gsub("\n", " ", stripByPath(tabele[[2]][[1]], ".//th"))
#   
#   # Podatke iz matrike spravimo v razpredelnico
#   return(data.frame(apply(gsub("\\*", "",
#                           gsub(",", ".",
#                           gsub("\\.", "", matrika[,2:5]))),
#                     2, as.numeric), row.names=matrika[,1]))
# }

# Najprej za moške, to je tabela podatkov o povprečnem številu delovnih ur na teden - upam :)
# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}

uvozi.podatkim <- function() {
  url.podatkim <- "file:///D:/DOKUMENTI/Gugec%20FMF/2.%20LETNIK/Analiza%20podatkov%20s%20programom%20R/APPR%20PROJEKT/podatki/Povprecnodelo_moski.html"
  doc.podatkim <- htmlTreeParse(url.podatkim, useInternalNodes=TRUE)
  
  # Poiščemo vse tabele v dokumentu
  tabelem <- getNodeSet(doc.podatkim, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrsticem <- getNodeSet(tabelem[[1]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznamm <- lapply(vrsticem[2:length(vrsticem)], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrikam <- matrix(unlist(seznamm), nrow=length(seznamm), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnamesm(matrikam) <- gsub("\n", " ", stripByPath(tabelem[[2]][[1]], ".//th"))
  
  # Podatke iz matrike spravimo v razpredelnico
  return(data.frame(apply(gsub("\\*", "",
                               gsub(",", ".",
                                    gsub("\\.", "", matrikam[,2:5]))),
                          2, as.numeric), row.names=matrikam[,1]))
}