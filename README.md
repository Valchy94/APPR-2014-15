# Analiza podatkov s programom R, 2014/15

Avtor: Valentina Gnamuš

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika
Za temo projekta sem si izbrala enakopravnost med spoloma. Moj namen je analizirati domnevne razlike med ženskim in moškim delom prebivalstva na področjih dela, denarja, izobrazbe, zdravja, prostega časa in moči (politične, gospodarske). Pri tem se bom osredotočila predvsem na evropske države, ker pa je tema aktualna tudi drugod po svetu, bo za primerjavo prikazano še stanje v kakšni neevropski državi.

Pri zbiranju podatkov mi bodo v pomoč naslednje spletne strani:

* http://data.worldbank.org/topic/gender#boxes-box-topic_cust_sec
* http://www.stat.si/letopis/LetopisVsebina.aspx?poglavje=12&lang=si&leto=2012
* http://epp.eurostat.ec.europa.eu/portal/page/portal/statistics/search_database
* http://w3.unece.org/pxweb
* http://eige.europa.eu


## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
