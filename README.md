# Color Strcture Descriptor - based CBIR System
Implementació d'un sistema de CBIR basat en un descriptor CSD (Color Structure Descriptor) de MPEG-7 per a l'assignatura de Processament d'Imatge i Vídeo.

## Introducció
Aquest repositori conté els fitxers i codis relacionats amb la segona versió del sistema CBIR. El projecte ha estat realitzat per la [Joana Justo](https://github.com/joanajusto) i el [Víctor Moreno](https://github.com/victhormoreno), estudiants de telecos, com a treball del laboratori de PIV durant el quadrimestre de primavera de 2023.

Si desitges obtenir informació més detallada i tècnica sobre el sistema, així com els seus resultats i rendiment, et recomanem que consultis els informes que es troben a la carpeta [`/docs/reports/`](/docs/reports) d'aquest repositori.

Els informes disponibles són:

1. Informe del prog1: [Descarrega aquí](docs/reports/memoria_prog1_moreno_justo.pdf)
2. Informe del prog2: [Descarrega aquí](doc/reports/informe_rendiment.pdf)

## Funcionament General del Sistema

## Estructura del sistema
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

## Utilitzar el sistema CBIR 
### 0. Clonació repositori
Per començar, clona el repositori utilitzant la següent comanda: 

``git clone https://github.com/victhormoreno/PIV-Prog-2``

### 1. Afegir database
Descarrega la base de dades des de l'enllaç següent: [https://archive.org/details/ukbench](https://archive.org/details/ukbench).  

Un cop descarregada, descomprimeix-la i guarda els arxius d'imatge a la carpeta `/data/database`.

### 2. Personalitza el Sistema

#### 2.1.Canviar els paràmetres
Modifica els paràmetres segons les teves preferències. Edita la primera secció del fitxer [`/scripts/cbir_system.m`](scripts/cbir_system.m) per especificar les opcions de cerca i els descriptors que vols utilitzar.

```
update_H = false; % True: update H matrix from data
path = 'C:\Users\victo\Desktop\prog2'; % Path to own project folder
bins = 256; % Number of bins of histogram: 128 or 256W
dist_type = 'bachata'; % Options: 'mse' / 'chi' / 'bachata'
N = 10; % Number of candidates per image
```

+ ``update_H``:
+ ``path``:
+ ``bins``:
+ ``dist_type``:
+ ``N``:


#### 2.2. Modificar input.txt
Modifica el l'arxiu [`\data\input.txt`](data/input.txt) per a realitzar la cerca d'imatges. Aquest fitxer conté els noms de les imatges a cercar, separats per salts de línia. Al repositori hi ha un fitxer d'exemple:

```
ukbench01701.jpg
ukbench00926.jpg
ukbench01883.jpg

...

ukbench00801.jpg
```

### 3. Executar el Sistema
### 4. Evaluacio comportament 
Analitza els resultats obtinguts i avalua el comportament del sistema CBIR en base als criteris establerts. Fes els ajustaments necessaris als paràmetres o als descriptors per aconseguir els resultats desitjats.

Aquesta és una estructura bàsica per utilitzar el sistema CBIR. Si cal, adapta les instruccions en funció de les teves necessitats i requisits específics.

