Datenbanken
Ubungsblatt 4 ̈

# Aufgabe 1 (Abfragen mit Relationaler Algebra)

Dr ̈ucken Sie die gegebenen Abfragen in der relationalen Algebra aus.

```
employee (personname, street, city)
works (personname, companyname, salary)
company (companyname, city)
manages (personname, managername)
```

1. Finde die Namen und Wohnorte aller Angestellten, welche f ̈ur FBC arbeiten.
2. Finde die Namen und Wohnorte mit Strasse aller Angestellten, welche f ̈ur FBC
    arbeiten und die mehr als CHF 100’000.- verdienen.
3. Finde die Namen aller Angestellten, die in der Stadt arbeiten in der sie auch
    wohnen.
4. Finde die Namen aller Angestellten, die in derselben Stadt an derselben Strasse
    wohnen, wie ihr Manager.
5. Finde die Firma mit den meisten Angestellten.
6. Finde die Firma, welche insgesamt die kleinste Lohnsumme bezahlt.
7. Finde diejenigen Firmen, deren Angestelle im Durchschnitt mehr verdienen, als
    der Durchschnittslohn der FBC.
8. Finde alle Firmen, die in jeder Stadt sind, in der auch die FBC ist.

## solution 

1. 
```sql
select * from employee where works.companyname = "FBC" left join works on employee.personname = works.personname
```
2. 
```sql
select * from employee where works.companyname = "FBC" AND where works.salary < 100000 left join works on employee.personname = works.personname
```
3. 
```sql
select * from employee where works.salary < 100000 left 
join company on employee.city = company.city
```
4. 
```sql
select * from employee as manager 
join manages on employee.personname = managers.personname
```
5. 
```sql
SELECT MAX(counts) FROM (SELECT COUNT(companyname) as counts
FROM works
GROUP BY companyname); 
```
6. 
```sql
SELECT MIN(sum) FROM (
    SELECT COUNT(salary) as lohn
    FROM works
    GROUP BY salary
); 
```
7.  
```sql
SELECT AVG(salary) FROM works  where companyname = "FBC"
```
8.  
```sql
(SELECT * FROM company company1, company company2  where company1.companyname = "FBC" and company1.city = company2.city and company1.companyname IS NOT company2.companyname)
```
### operatoren 

|additional (helper) operator|equivalent basic relational algebra operation|description|
|---|---|---|
|table_a ∩ table_b|table_a – (table_a – table_b)|intersection / schnittmenge|
|table_a ⋈ table_b|nothing|Natural join (⋈)/ takes only rows where column names and values are the same and merges them into one row on the result|
|table_a  ⟕  table_b |-|left outer join|
|table_a  ⟖  table_b|-|right outer join|
|table_a  ⟗  table_b|-|full outer join|
|πID, name, dept_name, salary/12 (table_human) |asdf|Generalized Projection/ like normal projection but functions with arithmetic operations and other column names can be used as the selected column names, see "salary/12" |
|sum(column_name)(table_name)|-|Aggregation / a predefined function , which takes multiple records as input and returns single result (avg, min, max, sum, count)
|asdf|asdf|asdf|
|asdf|asdf|asdf|
|asdf|asdf|asdf|
|asdf|asdf|asdf|
|asdf|asdf|asdf|
|asdf|asdf|asdf|

# Aufgabe 2 (NULL-Werte)

Gegeben sind folgende Relationenr(A,B,C,D) unds(A,E):

```
A B C D
”A” 1000 3 ””
”A” 700 Null ”agh”
”A” Null 0 ”abcdf”
”A” 1000 4 Null
”B” Null Null ”bdf”
”B” 1500 Null ”c”
Null 1000 8 ””
Null 700 12 Null
```
## A E

## ”B” 1

## ”C” 2

## ”C” 3

1. Evaluieren Sie f ̈ur jede Zeile vonrden Wert des Pr ̈adikatspmit

```
p= (B·C <5000 orDis null)
```
```
Berechnen Sie:
```
```
2.σp(r)
```
```
3.AGavg(B),sum(C)(r)
```
```
4.AGavg(B)(πA,B(r))
```
```
5.r ./ s
```
## 1


Datenbanken
Ubungsblatt 4 ̈

```
6.r ./s
```
```
7.r./s
```
# Aufgabe 3 (Implementation Kartesisches Produkt und Natural Join)

Gegeben seien Relationenr(A,B) unds(B,C). Die Relationen liegen in Form von Listen
von Tupeln vor. Tupel sind Listen mit fester L ̈ange, in unserem Falle mit L ̈ange zwei.
Zus ̈atzlich zu den ̈ublichen Funktionenheadundtailgibt es auf Listen (und damit
auch auf Tupeln) die Funktionlist cons(element a, list l)die die Liste liefert,
die durch Voranstellen von Elementaan die Listelentsteht. Die leere Liste heisstnil.
Andere Funktionen auf Listen gibt es nicht.

1. Geben Sie einen Algorithmus an, um das kartesische Produkt der beiden Relatio-
    nen zu berechnen.
2. Geben Sie einen Algorithmus an, um den natural join der beiden Relationen zu
    berechnen.

## 2


