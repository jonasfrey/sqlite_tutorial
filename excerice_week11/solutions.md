# ex 1 

## not funktional abhaengig 
- A->B
    - geht nicht weil a1->b1 und a1->b2
- A->C 
    - geht nicht weil a2->c2 und a3->c2
- A->D 
    - geht nicht weil a1->d1 und a1->d2

- B->C
    - geht nicht weil b1->c1 und b2->c1
- B->D 
    - geht nicht weil b3->d3 und b3->d4

- C->D
    - geht nicht weil c2->d3 und c2->d4

es gibt hier keine single conclusion functional dependencies. 

## single conclusion functional dependency? 
A functional dependency α→β is calledsingle-conclusionif β is a singleton (containsexactly one attribute).
A→BCis equivalent to{A→B,A→C}

## what is a trivial abhaengigkeit ? 
Triviale funktionale Abhängigkeit:
• Ein Attribut ist immer funktional abhängig:
– von sich selbst
– und von jeder Obermenge von sich selbst
Solche Abhängigkeiten bezeichnet man als trivial


## excercise 2

F+ = { A->B, B->C, B->A, C->A }


<br>
<br>
<br>
<br>
<br>
<br>

## excercise 3 


### table reisen1
|Destination|Reisebuero|Kunde|
|---|---|---|
|bali|one-way-inc|hans|
|mallorca|one-way-inc|hans|
|jamaica|reisepro|hans|

### table reisen2
|Destination|LieblingsReisebuero|Kunde|
|---|---|---|
|bali|one-way-inc|hans|
|jamaica|reisepro|hans|

### 1. 
ja es ist redundanz moeglich, der Kunde hans kann mehrmals erfasst sein, siehe oben

### 2. 
es gibt keine, keine spalte kann als eindeutige identifikation mit einer anderen spalte in verbindung gebracht werden

### 3. 
nein