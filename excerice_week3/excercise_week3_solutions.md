<script>

</script>
<style>
yellow{color:yellow}
orange{color:orange}
red{color:red}
purple{color:purple}
blue{color:blue}
green{color:green}
blue{color:blue;}

</style>

Datenbanken
Ubungsblatt 3 ̈

# Aufgabe 1 (Keys)

Folgende Relation sagt aus an welchen Tagen Sie sich mit welcher Person an welchem
Ort getroffen haben. (Die Relation macht keine Aussagen daruber, wie oft wir uns mit ̈
einer Person and einem Tag an einem Ort getroffen haben, falls das mehrfach passiert
ist, und das ist auch nicht beabsichtigt.)


|person| place |date|
|---|---|---|
|alice| bar| 1.1.2017|
|bob| bar| 2.2.2017|
|bob| cafe| 3.3.2017|

1. Bestimmen Sie alle superkeys f ̈ur die gegebene Relation.

2. Bestimmen Sie alle candidate keys f ̈ur die gegebene Relation.
3. Bestimmen Sie alle superkeys f ̈ur das gegebene Relationsschema.
4. Bestimmen Sie alle candidate keys f ̈ur das gegebene Relationsschema.
5. Welchen primary key w ̈urden Sie w ̈ahlen und warum?



## solution 

1. 
"A superkey is a combination of columns that uniquely identifies any row within a relational database management system (RDBMS) table" - google 
<br>
```sql
CREATE TABLE meetings
(
    name varchar(128),
    place varchar(128), 
    date date,
    CONSTRAINT name_place_date_superkey PRIMARY KEY (name, place, date)
);
```
als superkey wuerde ich die kombination der properties 'person', 'place' und 'date' nehmen, da ansonstent kollisionen auftreten koennten und der superkey nicht mehr unique waere , beispiel:

rot : kollision superkey : "person" und "place"

blau : kollision superkey : "place" und "date"

gelb: kollision superkey : "person" und "date"

|person| place |date|
|---|---|---|
|<red>alice</red>| <red>bar</red>| <blue>1.1.2017</blue>|
|<yellow>alice</yellow>| cafe| <yellow>1.1.2017</yellow>|
|<yellow>alice</yellow>| park| <yellow>1.1.2017</yellow>|
|alice| <blue>cafe</blue>| <blue>2.1.2017</blue>|
|<red>alice</red>| <red>bar</red>| 5.1.2017|
|bob| bar| 1.1.2017|
|bob| <blue>cafe</blue>| <blue>2.1.2017</blue>|

2. 
"A candidate key, or simply a key, of a relational database is a minimal superkey.[1] In other words, it is any set of columns that have a unique combination of values in each row (which makes it a superkey), with the additional constraint that removing any column would possibly produce duplicate rows (which makes it a minimal superkey)." - wikipedia

der minimal superkey kann nur aus kombination von 'person', 'place' und 'date' gewaehlt werden, da die anderen kombinationen nicht unique sind, das constraint dass wenn eine property entfernt wird, kann auf einer beliebigen property ('person', 'place' , 'date') gesetzt werden

3. welches relationsschema ? 
4. welches relationsschema ? 

5. ich wuerde fuer jeden neuen db eintrag einen autoincrement integer "id" als primary key verwenden, damit jeder datensatz eindeutig zu unterscheiden ist

# Aufgabe 2 (Keys)

Folgende Relation gibt Auskunft ̈uber Skilifte und deren Attribute.

|TelefonNr|Ort|Skigebiet|Lift|Kapazitaet|
|---|---|---|---|---|
|033 854 12 12 |Grindelwald| First| Oberjoch |2500|
|033 854 12 12 |Grindelwald| First |Oberlaeger |2000|
|033 854 12 12 |Grindelwald| Kl. Scheidegg |Fallboden |3000|
|033 854 12 14 |Wengen| Kl. Scheidegg |Fallboden |3000|

1. Bestimmen Sie alle superkeys f ̈ur die gegebene Relation.
2. Bestimmen Sie alle candidate keys f ̈ur die gegebene Relation.
3. Welche dieser candidate keys sind auch candidate keys f ̈ur das gegebene Schema?
4. Welchen primary key w ̈urden Sie w ̈ahlen und warum?


## solution 
1. Ort, Skigebiet, Lift
2. Ort, skigebiet, Lift
3. welches schema
4. einen unsigned autoincrement int als primary key, alles andere ist hoechstens ein ueberbleibsel aus den frueheren zeiten wo speicher noch sehr teuer war oder mathematisch interessant aber ffuer ein it system absolut verkomplizierend und unnoetig

# Aufgabe 3 (Relationale Algebra)

Berechnen Sie die folgenden Relationen. Achten Sie dabei auf korrekte Benennung der

Attribute.

r:

|A|B|
|---|---|
|a|d|
|b|d|
|b|e|
|c|f|


s:

|B|C|
|---|---|
|d|g|
|e|h|


1.πA(r)
2.σA=‘b‘(r)
3.r×s
4.σr.B=s.B(r×s)
5.πA(r)−πA(σB=‘d‘(r))

## 1


## solution 
```sql
-- πA(r)
select A from r
```
1. result: 
|A|
|---|
|a|
|b|
|c|

2. result: 
```sql
-- σA=‘b‘(r)
select * from r where A = 'b'
```
|A|B|
|---|---|
|b| d|
|b| e|

3. result: 
```sql
-- r×s
select 
    r.A as "r.A"
    r.B as "r.B"
    s.A as "s.A"
    s.B as "s.B"
    from r, s
```
|r.A|r.B|s.B|s.C|
|---|---|---|---|
|a|d|d|g|
|a|d|e|h|
|b|d|d|g|
|b|d|e|h|
|b|e|d|g|
|b|e|e|h|
|c|f|d|g|
|c|f|e|h|

4. 
```sql
-- σr.B=s.B(r×s)
select 
    r.A as "r.A"
    r.B as "r.B"
    s.A as "s.A"
    s.B as "s.B"
    where r.B = s.B
    from r, s
```
|r.A|r.B|s.B|s.C|
|---|---|---|---|
|a|d|d|g|
|b|d|d|g|
|b|e|e|h|


5. result: 

5.1
πA(r)
|A|
|---|
|a|
|b|
|c| 

5.2.1 
σB=‘d‘(r)

|A|B|
|---|---|
|a|d|
|b|d|

5.2 
πA(5.2.1)

|A|
|---|
|a|
|b|

### result: 
πA(r)−πA(σB=‘d‘(r)) => 5.1 - 5.2  
|A|
|---|
|c|

Datenbanken
Ubungsblatt 3 ̈

# Aufgabe 4 (Abfragen mit Relationaler Algebra)

Dr ̈ucken Sie die gegebenen Abfragen in der relationalen Algebra aus.

employee (personname, street, city)
works (personname, companyname, salary)

1. Finde die Namen aller Angestellten, welche f ̈ur First Bank Corporation (”FBC”)
    arbeiten.
2. Finde die Namen aller Angestellten, die nicht fur FBC arbeiten. ̈
3. Finde die Namen aller Angestellten, f ̈ur die es einen Angestellten der FBC gibt,
    der mindestens genausoviel verdient.
4. Finde die Namen aller Angestellten, die mehr verdienen als jeder Angestellte der
    FBC.

## solution 
1. 
```sql 
-- πpersonname(σcompanyname=‘FBC‘())
select personname from works where companyname ="FBC"
```
2. 
```sql 
-- πpersonname(σcompanyname≠‘FBC‘())
select personname from works where companyname not like "FBC"
```
3. 
```sql 
-- πpersonname(σworks.personname≠works2.personname^personname≠‘FBC‘^(works×works as works2))
select works.personname 
from works, works as works2 
where works.personname not like works2.personname and
works2.companyname = "FBC" and
works2.salary >= works.salary
```
4. 
```sql 
-- πpersonname(σworks.companyname≠"FBC"^works2.companyname="FBC"^works.salary>works2.salary(works×works as works2))
select works.personname 
from works, works as works2 
where works.companyname not like "FBC" and 
works2.companyname = "FBC" and
works.salary > works2.salary
```
# Aufgabe 5 (Aquivalente Ausdr ̈ ̈ucke)

Gegeben sind jeweils zwei Ausdr ̈ucke der relationalen Algebrauber den Relationen ̈
r(A,B,C) undt(A,B,C). Zwei Ausdr ̈uckexundysind ̈aquivalent, wenn fur alle Re- ̈
lationenrundtdie Auswertung vonxdieselbe Relation liefert, wie die Auswertung
vony. Untersuchen Sie, ob die folgenden Ausdr ̈ucke ̈aquivalent sind und begr ̈unden Sie
jeweils Ihre Aussage.

```
1. σA> 10 (πA,B(r)) und πA,B(σA> 10 (r))
2. πA(r−t) und πA(r)−πA(t)
```


## solution


1.  
ja, weil mit der project operation (π) keine manipulation der daten vorgenommen wird, welche in abhaengigkeit des select operators (σ) stehen koennte. dies gilt nur in jenem falle, weil die operationen mit den beiden verschiedenen operatoren auf der spalte "A" vorgenommen werden. 
2. 
nein weil in der minus operation die kombination von allen colums eine rolle spielt