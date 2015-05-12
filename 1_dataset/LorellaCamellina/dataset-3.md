##DATASET

Il brief che ci è stato indicato richiede come base di partenza un Dataset relativo alla Facoltà di Design dell'Università della Repubblica di San Marino (a noi decidere se si tratti di contenuti, studenti, output, etc).

Ho voluto prendere in considerazione dati che immagino in continuo mutamento, vivaci, molto diversi fra loro anche nell'arco di una singola giornata: il rumore ed il calore. Mi affascinano in quanto li considero valori strettamente legati alla quotidianità della vita universitaria nella sua sede, l'antico monastero Santa Chiara. Penso che potrebbero trovare una traduzione valida sottoforma di installazione e che sarebbero anche capaci di significati paralleli.

##Luoghi

Primissimo step, la creazione di un elenco degli spazi dove andare ad effettuare il prelievo dei dati. Ho già attuato qui una scrematura rispetto ai luoghi che secondo me "fanno" l'Università, andando a escludere tutti gli spazi interni alla sede che però non sono abitualmente frequentati da studenti o docenti.

Aule | Laboratori | Sale Docenti | Condivisi | Cellette
---------- | ----------- | ----------- | ----------- | -----------
A | Modelli | Direzione | Portineria | Celletta 1 
B | Informatica | Segreteria | Riviste | Celletta 2
D | Fotografia | Ricerca | Stampanti | Celletta 3
E |    |   | Plotter | Celletta 4
F |   |   | Distributori 1 | Celletta 5
G |   |   | Distributori 2 |  
  |   |   | Prato |  
  |   |   | Ponte fumatori | 

## Rumore

#####Strumento

Possiamo prelevare il rumore tramite _sensori di rilevamento del suono_. 

Il _segnale in ingresso_ (il suono) è una vibrazione che si propaga nell'aria formando aree a pressione variabile (onde sonore). Trattasi quindi di un _valore analogico_. 

Il _microfono_ (o trasduttore) è quello strumento che percepisce l'intensità delle variazioni di pressione, proprio come fa parte del nostro orecchio, per tradurle però in un _valore digitale_. 

I sensori di rilevamento del suono, per rendere "udibile" agli strumenti del caso il segnale in input, necessitano solitamente di un _amplificatore_, che può esser integrato o meno.

![syncview](http://i.imgur.com/OIBm5vt.jpg?1)
![photoshopmaster](http://i.imgur.com/GuZEYaE.jpg?1)

Il sensore presentato in foto permette la regolazione della sensibilità tramite un potenziometro (direttamente sul circuito) ed è dotato di due uscite AO (_uscita analogica, uscita in tempo reale del segnale di tensione del microfono_) e DO (per la gestione in digitale delle soglie) - credo. Ha dimensioni ridotte (43 x 16 x 14 mm) ed è molto economico (meno di 5 euro).

Immagino sarà necessario posizionarne uno per ogni luogo indicato  ne lla tabella ad inizio pagina, per un totale di venticinque sensori.

#####Ricerca significato

![rumore](http://i.imgur.com/eeZg84x.jpg?1)

![assenza](http://i.imgur.com/NsYxpl4.jpg?1)

#####Riferimenti

[Hover - Claudia Ciarpella](http://www.claudiaciarpella.com/portfolio/hover/)

[Yukikaze - INCAMS](https://www.youtube.com/watch?v=jJfpL5QkixU)

[Soft crash - Byoungho Kim](http://www.bitpaste.com/works_2011_soft_crash.html)

--

[Audio input - Arduino](http://scuola.arduino.cc/lesson/zzoknZl/Audio_Input)

[Leggere i valori audio in input](http://luca-petrosino.blogspot.it/2011/06/arduino-leggere-i-valori-dal-microfono.html)

--

[Microfono](http://it.wikipedia.org/wiki/Microfono)

[Sensore Keyes](http://www.giga-mobile.com/it/electronic-diy-single-chip-microcomputer/30459-keyes-microphone-sound-detection-sensor-module-for-arduino---red.html)

## Calore

#####Strumento

Per quanto riguarda il calore, ci affidiamo ad un sensore di temperatura, almeno in fase di prototipazione. Anche in questo caso l'input è una grandezza fisica quindi un valore analogico ed il sensore lo traduce in un valore digitale, in un voltaggio.

Nella realtà si potrebbero sfruttare i sensori di temperatura già posizionati nella maggioranza dei luoghi considerati, nei termostati, non presenti solo nelle cinque cellette.

![sensore](http://i.imgur.com/HCHSxiS.jpg?2)
![dim](http://i.imgur.com/lKuoGow.jpg?2)

#####Ricerca significato

![rumore](http://i.imgur.com/LAzNbUd.jpg?1)

#####Riferimenti

[Weather cube - Charmcut](https://graphicjunk.wordpress.com/)

--

[Sensore di temperatura + Arduino](http://www.logicaprogrammabile.it/arduino-sensore-di-temperatura-tmp36/)

[Lettura valore di temperatura](http://playground.arduino.cc/Italiano/Sensori)

## Conclusioni

Le variabili che condizionano i due valori scelti potrebbero essere:
- luogo di rilevamento (esterno/interno, aula/laboratorio)
- affollamento (area fumatori/laboratorio modelli, aula grande/aula piccola);
- periodo della giornata (pausa pranzo/laboratorio, prima mattinata/metà mattinata)
- periodo dell'anno (interno/esterno, lezioni/esami)

Vorrei che l'installazione riuscisse a fornire una rappresentazione della vitalità dell'Università, mai uguale a se stessa, che cambi istantaneamente mentre la si osserva. 

Di qui in avanti vorrei approfondire quali potrebbero essere le possibili _traduzioni_ alle rilevazioni.
