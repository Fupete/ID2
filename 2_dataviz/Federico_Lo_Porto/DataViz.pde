/*
The MIT License (MIT)
 Copyright (c) 2015 Federico Lo Porto for the course ID2-2015 @ UnirSM
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 Questo sketch preleva dei dati da un google fogli dove ci sono dei valori che simulano
 il rilevamento dell'ossigeno e dell'anidride carbonica all'esterno ed all'interno 
 della struttura universitaria di design all'interno della Serenissima Repubblica di 
 San Marino. Con l'utilizzo di questi dati, l'obiettivo è quello di visualizzare
 la differenza tra l'ossigeno esterno ed interno e dell'anidride carbonica esterna ed
 interna, crendo la metafora del respiro umano. I dati dell'ossigeno corisponderanno
 alla fase d'inspirazione e quelli dell'anidride carbonica alla fase di espirazione.
 */




String A_title, B_title, C_title, D_title; //titoli colonne
IntList A_values= new IntList(); // dichiarazione degli array
IntList B_values= new IntList();
IntList C_values= new IntList();
IntList D_values= new IntList();

int i=0;  //contatore
int x = 250;
int y = 250;


float co2=0;                            // inizializzo la variabile co2 a 0
float o2=0;                             //inizializzo la variabile o2 a 0
float delta_co2;
float delta_o2;
float limite_insp=0;   //inizializzo a zero la variabile che verrà incrementata per avere l'animazione dell'inspirazione
float limite_esp=0;    //inizializzo a zero la variabile che verrà diminuita per avere l'animazione dell'espirazione

boolean next = false; // FU / < SE PREMI SPAZIO CAMBI DATO. UTILE PER TEST / DEBUG.

float vel_insp = 1.8; // FU / INSERITO VARIABILI DI CONTROLLO DA QUI. SAREBBE BUONO GESTIRLE DA CONTROLp5 CON DEGLI SLIDER::::
float vel_esp = 0.7;
float zoom = 120.0;

void setup() {
  // size(displayWidth, displayHeight); //fullscreen
  size(500, 500);
  smooth(8);
  //caricamento foglio google
  String url = "https://spreadsheets.google.com/feeds/cells/1Yri2dQsyWcKnjqRIea028jvbi86DBm2yFS2Zu8WPN3I/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);
  println (A_title);  
  println (A_values);  // valore CO2 esterno
  println (B_title);  
  println (B_values); //valore Ossigeno esterno
  println (C_title);  
  println (C_values);  // valore CO2 interno
  println (D_title);  
  println (D_values);  // valore ossigeno interno
}
//int x = width/2;  
//int y = height/2;

void draw() {

  background(255, 255, 255);   //background bianco


  if ((frameCount % 600 == 0)||(i==0)||(next)) {     //condizione di rilvemanto dati, in questo modo i dati vengono estratti in un tempo prestabilito 
    //o quando i è ugale a 0, cioè solo per il primo giro di draw

    float TEMPdelta_co2 =delta_co2 (i, co2, A_values, C_values);  //prelevo il dato co2, richiamando la funzione delta_co2 e l'assegno alla variabile delta_co2 
    //(differenza tra anidride carbonica esterna ed interna)

    float TEMPdelta_o2 =delta_o2 (i, o2, B_values, D_values);    //prelevo il dato o2, richiamando la funzione delta_o2 e l'assegno alla variabile delta_o2 

    delta_co2 = 2*sqrt(TEMPdelta_co2/PI);  // < FU / L'AREA DEL CERCHIO NON IL DIAMETRO...
    delta_o2 = 2*sqrt(TEMPdelta_o2/PI);   // < FU / L'AREA DEL CERCHIO NON IL DIAMETRO...

    // < FU / PER FATTORE ARBITRARIO DI ZOOM
    delta_co2*=zoom;
    delta_o2*=zoom;

    // (la differenza dell'ossigeno esterno con quello interno)

    controllo();                                     //richiamo la funzione controllo, che ha il compito di verificare che il valore dell'ossigeno 
    //si maggiore di quello dell'anidride carbonica, se cosi non fosse scambia i valori. 

    //contatore utile per il rilevamento dei dati 
    if (next) {
      next = false;
    } else {
      i++;
    }
    /// <<< FU / COSA SUCCEDE SE HO FINITO I DATI?
  }

  noStroke();                                      //niente linee di contorno nei disegni
  disegna(x, y, o2, co2);                          //richiama la funzione disegna e gli passa i valori
  //  println("contatore ", i);                    //verifica
}


void keyPressed() { // SE PREMI SPAZIO CARICHI IL PROSSIMO DATO [UTILE PER TEST/DEBUG]
  if (key == ' ') {
    next = true;
  }
}

//BLOCCO ANIDRIDE CARBONICA

float delta_co2 (int i, float dato_co2, IntList A_values, IntList C_values)  // funzione delta_co2 che preleva dall'array i valori della co2 esterna 
//ed interna e calcola la differenza
{
  // println("dentro delta co2");       //verifica
  float co2_est=A_values.get(i);       //prelevo valore co2 esterno dall'array A_values nella cella i
  float co2_int=C_values.get(i);      //prelevo valore co2 interno dall'array C_values nella cella i
  dato_co2 = co2_est - co2_int;      // dato_co2 è il risultato della differenza tra la co2 esterno e quella interna

  if (dato_co2<0) {                 //controllo se il dato è negativo, se lo è lo moltiplico per -1
    dato_co2 = dato_co2 * (-1);
  }
  dato_co2 = dato_co2;         
  println(i, dato_co2);             //stampo la i e il dato

  return dato_co2;                  //restituisco il dato ottenuto
}

//BLOCCO OSSIGENO

float delta_o2 (int i, float dato_o2, IntList B_values, IntList D_values)             // funzione delta_o2 che preleva dall'array i valori della o2 esterno
//ed interno e calcola la differenza
{
  // println("dentro delta o2");                                                //verifica

  float o2_est= B_values.get(i);                                               //prelevo valore o2 esterno dall'array B_values nella cella i
  float o2_int= D_values.get(i);                                              //prelevo valore o2 interno dall'array D_values nella cella i
  dato_o2= o2_est - o2_int;                                                 // dato_o2 è il risultato della differenza tra la co2 esterno e quella interna

  if (dato_o2<0) {                                          //controllo se il dato è negativo, se lo è lo moltiplico per -1
    dato_o2 = dato_o2 * (-1);
  }
  dato_o2 = dato_o2;                                  
  println(i, dato_o2);                                      //stampo la i e il dato 

  return dato_o2;                                        //ritorna valore ossigeno
}



//BLOCCO CONTROLLO

void controllo ()   

{
  float comodo = 0;  
  if (delta_co2 > delta_o2)       //se il valore delta_co2 è maggiore di delta_o2 inverto i valori
  {
    comodo = delta_o2;
    delta_o2 = delta_co2;
    delta_co2 = comodo;
    fill(255, 0, 0, 80);          //allora colora di rosso la bolla
  } else {
    fill(0, 0, 255, 80);         //altrimenti di azzurro
  }

  limite_esp = delta_co2;        //a limite_esp assegno il valore delta_co2 che nella funzione disegna sarà diminuito per creare l'animazione 
  co2 = limite_esp;              // assegno ad co2 il valore limite_esp, in seguito avrà il ruolo di controllare che limite_esp non superi il valore co2 (controllo_co2 nella funzione disegna)
  limite_insp = delta_o2;       // a limite_insp assegno il valore delta_o2 che nella funzione disegna sarà incrementato per creare l'animazione
  o2 = limite_insp;            // assegno ad o2 il valore del limite_insp, in seguito avrà il ruolo di controllare che il limite_insp non super il valore o2 (controllo_o2 nella funzione disegna)
}






// BLOCCO DISEGNO

void disegna(int verticeX, int verticeY, float controllo_o2, float controllo_co2)
{
  /*   VERIFICHE 
   println("dentro disegna");
   println("controllo_o2  ", controllo_o2);
   println("Controllo_co2  ", controllo_co2);
   println(limite_insp, " prima dell'if limite insp");
   println( limite_esp, " prima dell'if limite_esp");
   
   */


  if (limite_insp < controllo_o2)      // se limite_insp è minore di controllo_o2 (valore massimo o2) 
  {
    limite_insp = limite_insp + (controllo_o2/limite_insp)*vel_insp;   //allora, incrementa il limite_insp del valore di limite_insp + una 
    //quantità variabile ottenuta dal valore massimo dell'ossigeno diviso 
    //il limite_insp, più il limite_insp si avvicinerà al numeratore più 
    //sarà veloce l'animazione, per simulare la fase d'inspirazione umana 
    ellipse( verticeX, verticeY, limite_insp, limite_insp);   // disegno la bolla fase inspirazione
    //   println("dentro if limite_insp");                    // verifica
    //   println(limite_insp, "  limite insp");                //verifica
    if (limite_insp>controllo_o2) {                            //se il limite è maggiore del valore massimo
      delay(300);                                              // allora fai una pausa, per simulare l'intervallo tra la fase d'inspirazione ed espirazione
    }
  } else                                                       //altrimenti
  {
    ellipse( verticeX, verticeY, limite_esp, limite_esp);       //disegna bolla fase espirazione
    limite_esp= limite_esp - (controllo_co2/limite_esp)*vel_esp;         //diminuisco la variabile limite_esp di limite_esp - il risulatao della divisione tra il
    //valore massimo della co2 e il limite_esp
    //println( limite_esp, "dentro if limite_esp");         //verifica
    if (limite_esp < controllo_co2) {                       // se limite_esp è minore del valore massimo di co2
      //println("pausa");
      delay(100);                                           //allora pausa di 100 millisecondi
    }
  }

  if ((limite_esp < controllo_co2)||(limite_esp < 0) || (limite_insp < 0))    // se limite_esp è minore del massimo della co2 o minore di 0 o limite_insp è 
    //minore di 0
  {
    limite_insp = controllo_co2;                                             //limite_insp assegni il valore massimo della co2, nonchè suo punto di partenza
    limite_esp = controllo_o2;                                               //limite_esp assegni il valore massimo dell'o2, nonchè suo punto di partenza
    //queste ultime due istruzioni creano un'animazione in loop
    println("dentro if refresh _________________//////_____");        //verifica
  }
}






void load_G_Spreadsheet(String url) {

  JSONObject G_Spreadsheet_data = null;

  try 
  { 
    G_Spreadsheet_data = loadJSONObject(url);
  } 
  catch(Exception el) 
  { 
    println("Error loading JSON"); 
    exit();
  }

  if (G_Spreadsheet_data == null) 
  { 
    println("No data"); 
    exit();
  } else 
    parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this start the magic
} 


//FUNZIONE PER CARICARE JSON

void parse_G_Spreadsheet_JSON(JSONObject jdata) {

  JSONObject feed = jdata.getJSONObject("feed");
  JSONArray entries = feed.getJSONArray("entry");

  for (int i = 0; i < entries.size (); i++) {
    JSONObject entry = entries.getJSONObject(i);
    JSONObject entry_title = entry.getJSONObject("title");
    JSONObject entry_value = entry.getJSONObject("content");

    // cell content index
    String index = entry_title.getString("$t");
    char current_column = index.charAt(0); // < 'empiric' but works :)

    // cell content value
    String value = entry_value.getString("$t");

    // fill the right title/List values <<<< modify to your needs! <<<<
    if (index.equals("A1") == true) {   //inserisce il titolo
      A_title = value;
    } else
      if (index.equals("B1") == true) { 
      B_title = value;
    } else 
      if (index.equals("C1")== true) {
      C_title = value;
    } else
      if (index.equals("D1")) {
      D_title = value;
    } else
      if (current_column == 'A') { 
      A_values.append(int(value));
    } else
      if (current_column == 'B') { 
      B_values.append(int(value));
    } else
      if (current_column =='C') {
      C_values.append(int(value));
    } else
      if (current_column =='D') {
      D_values.append(int(value));
    }
  }
} 
