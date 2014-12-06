# Poročilo

## 1. FAZA: Izbira teme

Za temo projekta sem si izbrala enakopravnost med spoloma. Moj namen je analizirati domnevne razlike med ženskim in moškim delom prebivalstva na področjih dela, denarja, izobrazbe, zdravja, prostega časa in moči (politične, gospodarske). Pri tem se bom osredotočila predvsem na evropske države, ker pa je tema aktualna tudi drugod po svetu, bo za primerjavo prikazano še stanje v kakšni neevropski državi.

Pri zbiranju podatkov mi bodo v pomoč naslednje spletne strani:

* http://data.worldbank.org/topic/gender#boxes-box-topic_cust_sec
* http://www.stat.si/letopis/LetopisVsebina.aspx?poglavje=12&lang=si&leto=2012
* http://epp.eurostat.ec.europa.eu/portal/page/portal/statistics/search_database
* http://w3.unece.org/pxweb
* http://eige.europa.eu

## 2. FAZA: Obdelava, uvoz in čiščenje podatkov

V tej fazi projekta sem uvozila osem podatkovnih tabel, ki sem jih pridobila na nekaterih izmed zgoraj navedenih virov. Natančneje: veliko večino podatkov (vse tabele oblike CSV) sem črpala s spletne strani Evropskega inštituta za spolno enakopravnost, ostali podatki pa so s spletne strani Evropskega statističnega urada.

Zbrane tabele sem uredila, odstranila odvečne znake in zanje napisala program za uvoz. 
Ker je za datoteke oblike HTML čiščenje podatkov nekoliko zahtevnejše kot za CSV, sem za zadnji dve tabeli v mapi lib napisala pomožen program, ki je podatke očistil. Ta program sem nato klicala v uvozi.r, kjer sem napisala tudi ostale funkcije za uvoz podatkov.

Podatke sleherne uvožene tabele sem prikazala tudi z grafi. Navadno sem za prikaz izbrala najpomembnejšo komponento tabele (na primer iz tabele index_znanje sem izbrala podatke za komponento "Knowledge", ki zajema vse ostale (pod)komponente). 

Za risanje grafov sem napisala svoj program Grafi.r, ki sem ga shranila v mapo slike.
Za prikaz podatkov iz prvih šest tabel (oblike CSV) sem izbrala stolpični graf, saj je tako najbolj razvidno, kakšna je stopnja enakopravnosti (glede na ustrezno področje) v posameznh  državah. Ta je merjena z indeksom enakopravnosti, posebne merske enote, s pomočjo katere na enostaven način lahko razberemo (ne)enakosti med spoloma (indeks=100 pomeni popolno enakopravnost, indeks=0 pa neenakopravnost).

Podatke iz zadnjih dveh tabel sem združila v enem grafu, saj sem želela primerjati število opravljenih delovnih ur moških in žensk v Sloveniji. Ker me je zanimala samo raven razlike v posameznem letu, sem si za grafično sliko izbrala točkovni graf.

Grafe sem v zaključku z ukazom pdf(...) prevedla v pdf obliko.
