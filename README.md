# Color Structure Descriptor - based CBIR System
Implementació d'un sistema de CBIR basat en un descriptor CSD (Color Structure Descriptor) de MPEG-7 per a l'assignatura de Processament d'Imatge i Vídeo.

<p align="center">[Català] / <a href="./README_EN.md">English</a></p>

<p align="center">
  <img src="./docs/media/descriptors_dataset.png"  width="350" /><br />
  Visualització de tots els descriptors CSD per a les 2.000 imatges del dataset UKBench
</p>


## Introducció
Aquest repositori conté els fitxers i codis relacionats amb la segona versió del sistema CBIR. El projecte ha estat realitzat per la [Joana Justo](https://github.com/joanajusto) i el [Víctor Moreno](https://github.com/victhormoreno), estudiants de telecos, com a treball del laboratori de PIV durant el quadrimestre de primavera de 2023.

Si desitges obtenir informació més detallada i tècnica sobre el sistema, així com els seus resultats i rendiment, et recomanem que consultis els informes que es troben a la carpeta [`/docs/reports/`](/docs/reports) d'aquest repositori.

Els informes disponibles són:

1. Informe del prog1: [Descarrega aquí](docs/reports/memoria_prog1_moreno_justo.pdf)
2. Informe del prog2: [Descarrega aquí](doc/reports/informe_rendiment.pdf)

La primera versió del sistema (prog 1) es pot trobar a la branca [prog1](../../tree/prog1) d'aquest repositori. Aquesta, utilitza l'histograma de la imatge en escala de grisos com a descriptor en lloc del CSD.

## Estructura del sistema

L'estructura del sistema està organitzada en diversos directoris. El directori [`data`](/data/) conté els fitxers de dades necessaris, com ara la matriu de característiques H.mat i els fitxers d'entrada i sortida. El directori [`functions`](/functions/) conté les funcions que realitzen l'extracció de descriptors i el càlcul de distàncies entre imatges. D'altra banda, el directori [`scripts`](/scripts/) conté els arxius de codi principals per a l'execució del sistema.

```
+---data
|   |   H.mat
|   |   input.txt
|   |   output.txt
|   +---database
+---docs
+---functions
|   +---descriptors
|   +---distances
+---scripts
        cbir_system.m
        evaluation.m
```

El directori principal del sistema conté els següents subdirectoris i fitxers:

+ [`H.mat`](/data/H.mat): Aquest fitxer conté la matriu de característiques de les imatges emmagatzemades a la base de dades.

+ [`input.txt`](/data/input.txt): Aquest fitxer conté les dades d'entrada per a la consulta del sistema.

+ [`output.txt`](/data/output.txt): Aquest fitxer contindrà les sortides o resultats generats pel sistema.

+ [`descriptors`](/functions/descriptors/): Aquest subdirectori conté les funcions relacionades amb l'extracció de descriptors de les imatges.

+ [`distances`](/functions/distances/): Aquest subdirectori conté les funcions per a calcular les distàncies entre descriptors d'imatges.
scripts: Aquest directori conté els scripts o arxius de codi per a executar el sistema.

+ [`cbir_system.m`](/scripts/cbir_system.m) : Aquest és l'arxiu principal del sistema, que conté el codi per a executar el sistema de CBIR.

+ [`evaluation.m`](/scripts/evaluation.m): Aquest arxiu pot contenir el codi per a avaluar els resultats o rendiment del sistema.

## Utilitzar el sistema CBIR 
### 0. Clonació repositori
Per començar, clona el repositori utilitzant la següent comanda: 

``git clone https://github.com/victhormoreno/PIV-Prog-2``

### 1. Afegir database
Descarrega la base de dades des de l'enllaç següent: [https://archive.org/details/ukbench](https://archive.org/details/ukbench).  

Un cop descarregada, descomprimeix-la i guarda els arxius d'imatge a la carpeta `/data/database`.

### 2. Personalitza el Sistema

#### 2.1. Canviar els paràmetres
Modifica els paràmetres segons les teves preferències. Edita la primera secció del fitxer [`/scripts/cbir_system.m`](scripts/cbir_system.m) per especificar les opcions de cerca i els descriptors que vols emprar.

```
update_H = false; % True: update H matrix from data
path = 'C:\Users\victo\Desktop\prog2'; % Path to own project folder
quantification = 256; % Number of levels img hmmd: 128 or 256
bins = 128; Number bins of the descritor
dist_type = 'bachata'; % Options: 'mse' / 'chi' / 'bachata'
N = 10; % Number of candidates per image
```

+ ``update_H``: Un booleà que determina si vols actualitzar la matriu H a partir de les dades. Si és true, es realitzarà una actualització de la matriu H; si és false, la matriu H no es modificarà.
+ ``path``:  La ruta a la carpeta del teu propi projecte. Assegura't d'especificar la ruta correcta en aquest paràmetre.
+ ``quantification``: Nombre de nivells de la imatge quantificada en HMMD.
+ ``bins``: El nombre de bins del descriptor. Pots seleccionar entre [1,quantification], depenent de les teves preferències i necessitats.
+ ``dist_type``: El tipus de distància que vols utilitzar per a la cerca. Tens les següents opcions: 'mse' (Mean Squared Error), 'chi' (Chi-Squared), 'bachata' (Bhattacharyya). Selecciona el tipus de distància que millor s'adapti al teu sistema.
+ ``N``:  El nombre de candidats per imatge que vols obtenir en la cerca. Pots ajustar aquest valor segons la quantitat de resultats desitjats.


#### 2.2. Modificar input.txt
Modifica l'arxiu [`\data\input.txt`](data/input.txt) per a realitzar la cerca d'imatges. Aquest fitxer conté els noms de les imatges a cercar, separats per salts de línia. Al repositori hi ha un fitxer d'exemple:

```
ukbench01701.jpg
ukbench00926.jpg
ukbench01883.jpg

...

ukbench00801.jpg
```

### 3. Executar el Sistema

Un cop duts a terme els passos anteriors, ja es pot executar el programa principal. Per a fer això, cal accedir a `/scripts/cbir_system.m` i prémer el botó de `run` al matlab.

### 4. Avaluació comportament 
Analitza els resultats assolits i avalua el comportament del sistema CBIR d'acord amb els criteris establerts. Fes els ajustaments necessaris als paràmetres o als descriptors per aconseguir els resultats desitjats. El script `evaluation.m` es pot fer servir per calcular la F-score i les corbes de Recall i Precision, per un fitxer `output.txt` donat.

Aquesta és una estructura bàsica per utilitzar el sistema CBIR. Si cal, adapta les instruccions en funció de les teves necessitats i requisits específics.

