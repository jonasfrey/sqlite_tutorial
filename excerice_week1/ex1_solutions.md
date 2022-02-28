Datenbanken
Ubungsblatt 1 ̈

# Aufgabe 1

Sie m ̈ochten in einer Tabelle in einer Datenbank speichern, an welchem Datum
Sie sich mit welcher Person an welchem Ort getroffen haben.

1. Geben Sie das Schema dieser Datenbank.
2. Geben Sie ein Beispiel f ̈ur eine Instanz dieses Schemas.

# solution 1 
```sql 
create table meetings (
    n_id integer primary key autoincrement,
    s_name varchar(512), 
    s_location varchar(512)
);
insert into meetings (
    s_name,
    s_location 
)
values 
(
    "Grafted Scion", 
    "Chapel of Anticipation" 
), 
(
    "Margit", 
    "Stormhill"
)

```
# Aufgabe 2

1. Erweitern Sie das Beispiel aus der letzten Aufgabe: Sie wollen in der selben
    Tabelle auch noch die Telefonnummer der Personen speichern.
2. Erkl ̈aren Sie anhand dieses Beispiels Redundanz in einer Datenbank.
3. Erkl ̈aren Sie, wie aus dieser Redundanz Inkonsistenz entstehen kann.
# solution 2 
```sql
alter table meetings
add column n_phone_number int
```
```sql
insert into meetings (
    s_name,
    s_location, 
    n_phone_number
)
values 
(
    "Margit", 
    "Stormhill", 
    0313212121 
)
```

```sql 
1|Grafted Scion|Chapel of Anticipation|
2|Margit|Stormhill|
3|Margit|Stormhill|313212121
```
wenn nun die zb die person "margit" wieder getroffen wird, ist sie redundant in der tabelle weil ihr gleicher name 2 mal gespeichert ist, ausserdem sind die daten inkonsistent weil im 2. eintrag ihre telefonnummer vorhanden ist, beim ersten jedoch nicht.
## redundanz 
wuerde der name margit in einem record geaendert werde, muesste jeder record mit diesem namen geandert werden um konsistenz zu bewahren. das selbe gilt fuer die location "stormhill" 

# Aufgabe 3

Gegeben seien die Tabellen 'instructor' undde 'partmentals' CSV-Dateien. Implementieren Sie folgende Abfragen einer Ihnen genehmen Programmiersprache:

1. select name
    from instructor
    where ID = '22222'
2. select building
    from instructor, department
    where instructor.dept_name = department.dept_name and
       name = 'Einstein'

Warum nutzt man eine deklarative Sprache wie SQL zur Datenbankabfrage?
Warum nicht eine prozedurale Programmiersprache wie Java oder Python?

# solution 3 
```python
def index_of(s_haystack, s_searchterm): 
    n_index = -1
    try: 
        n_index = s_haystack.index(s_searchterm) 
        return n_index
    except: 
        return -1

s_instructor = open("instructor", "r")
a_instructor_records = s_instructor.splitlines()
a_result = filter(lambda s_record: return index_of(s_record, "22222,") == 0)
```

```python
s_instructor = open("instructor", "r")
a_instructor_records = s_instructor.splitlines()

s_department = open("department", "r")
a_department_records = s_department.splitlines()


a_result = filter(lambda s_record: return index_of(s_record, "22222,") == 0)
```
# Aufgabe 4

Gegeben sei ein Array in der globalen Variable a mit Kontostaendnden in nicht-fluechtigem Speicher. Es soll die Integritaetsbedingung gelten, dass die Summe
aller Werte des Arrays gleich bleibt. Nun soll das erste Konto geleert und auf
das zweite Konto ̈uberwiesen werden. Dazu gibt es die Funktion:

```c 
void transact(int[] a)
    a[1] = a[1] + a[0];
    a[0] = 0;
```
Erkl ̈aren Sie, wie bei einem Systemabsturz die Integrit ̈atsbedingung verletzt wer-
den kann.

Erweitern Sie die Funktion auf geeignete Weise, um sicherzustellen, dass die
Integrit ̈atsbedingung zu jedem Zeitpunkt gilt.

## 1


 