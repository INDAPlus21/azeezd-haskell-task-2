# Fråga 1: Varför kan man skriva utryck så som detta i Haskell?
```haskell
let evenNumbers = [ 2 * n | n <- [1..]]
print (take 1000000 evenNumbers)
```
Det är eftersom Haskell är en lat språk. Detta innebär att när en funktion eller definition deklareras så gör Haskell endast en fel kontroll.
Därefter när man kallar på funktionen eller definition då börjar Haskell att beräkna. Man kan alltså säga, den beräknar vid behov.

# Fråga 2: Vad innebär rekursion?
Rekursion innebär att en funktion defineras i termer av sig själv. 
Det betyder att för att beräkna ett värde av ett funktion så ska man först beräkna ett mindre värde av samma funktion och till slut samla ihop allt till ett enda värde.
Man behöver också ett basfall där rekursionen stoppas. Basfallet är det minsta värdet i definitionen, nästan som atomet som bygger rekursionen.
Exempel på detta är fakultet definitionen:
```
f(0) = 1
f(n) = n * f(n-1)
```

# Fråga 3:  Varför fungerar följande funktion i språk så som haskell och inte i t.ex javascript
```haskell
sum :: Integral n, Num n => n -> n -> n
sum s 0 = s
sum s n = sum (s + n) (pred n)
```

```javascript
function sum(s, n) {
     if(n == 0){
         return s;
     } else{
         return sum(s + n, n - 1);
     }
}
```
Detta är på grund av Currying mekanismen. Currying innebär att man skapar en funktion med multipla parametrar som returnerar en funktion med färre parametrar som bygger upp den originella funktionen.
I fallet med Haskell koden det finns `sum s 0 = s` vilket är en funktion som tar in två argument `s` och `0`.
Eftersom `s` är ett variabel så blir `sum s` en funktion som tar in `0` och då eftersom `sum s` argument är `0` så returneras `s`.
Det är samma som att säga att `sum s n` kan skrivas matematisk som `sum(s,n)` och då `s` slåss ihop med `sum` och blir en funktion själv: `sum(s)(n)`.
Vilket är vad Haskell i huvudsak kontrollerar här att värdet på `sum(s)(0)` är `s`.

Jämfört med imperativa språk så tar man hänsyn till värde som ett skick eller "State" av programmet som ändras.
Medan funktionella språk som Haskell är allt funktioner som returnerar allt från tal, listor och även funktioner själv.

(Jag tror att modernare JavaScript har currying nu)
