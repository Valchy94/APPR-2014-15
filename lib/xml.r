# Uvoz s spletne strani

library(XML)


# Najprej za moške, to je tabela podatkov o povprečnem številu delovnih ur na teden
# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}

uvozi.podatkim <- function() {
  url.podatkim <- "podatki/Povprecnodelo_moski.html"
  doc.podatkim <- htmlTreeParse(url.podatkim, useInternalNodes=TRUE)
  
  # Poiščemo vse tabele v dokumentu
  tabelem <- getNodeSet(doc.podatkim, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrsticem <- getNodeSet(tabelem[[1]], ".//tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznamm <- lapply(vrsticem[1:length(vrsticem)-1], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrikam <- matrix(unlist(seznamm), nrow=length(seznamm), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnames(matrikam) <- gsub("\n", " ", stripByPath(vrsticem[[length(vrsticem)]], ".//th"))
  
  # Podatke iz matrike spravimo v razpredelnico
  return(data.frame(apply(gsub("\\(.*$", "",matrikam[,2:7]),
                          2, as.numeric), row.names=matrikam[,1]))
}

