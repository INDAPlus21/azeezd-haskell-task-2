# Azeez Daoud (azeezd) Haskell Uppgift 2
Code is under `src/`, answers to written exercises is under `docs/`.

Proof for kattis is provided as `proof.png`

# Techniques Used:
Here is how the different functions were implemented:

## 1 Fibonacci
The Fibonacci numbers were calculated using the Golden Ratio formula without the usage of any recursion.

![fib formula](https://latex.codecogs.com/gif.latex?%5Cdpi%7B200%7D%20%5Cbg_white%20%5Csmall%20%5Cbegin%7Balign*%7D%20F%28n%29%20%26%3D%20%5Cfrac%7B%5Cvarphi%5En%20-%20%281-%5Cvarphi%29%5En%7D%7B%5Csqrt%7B5%7D%7D%20%5C%5C%5B0.1cm%5D%20n%20%26%5Cin%20%5Cmathbb%7BN%7D%20%5C%5C%5B0.2cm%5D%20%5Cvarphi%20%26%3D%20%5Cfrac%7B1%20&plus;%20%5Csqrt%7B5%7D%7D%7B2%7D%20%3D%201.6180%5Cdots%20%5Cend%7Balign*%7D)

Phi is the golden ratio.

## 2 Rövarspråk
1. Take a string
2. If the first character `x` is a consonant, add (prepend) `xox` to the start of rövarspråk of the tail (recursive part).
3. If the string is empty, return it.

### Inverse rövarspråk

1. Take a string
2. If the first character `x` is a consonant, drop the next two characters (`ox`) and add (prepend) the character to inverse rövarspråk of what is left after the dropping (recursive part)
3. If the string is empty, return it.

## 3 Medellängd (Average Length of Words in a sentence)
The function is built on two other functions `letterCounter` and `wordCounter` in which the former gets the amount of alphabetical characters in a string and the latter gives the amount of words in a string.

### `letterCounter'`, the generalisation of `letterCounter`
1. Take a (String, Double), call it `(str, n)`
2. If first character in String part is an alphabet call `letterCount'(TAIL OF str, n+1)` (recursive part)
3. Otherwise (first character not an alphabet) call letterCount`(TAIL OF str, n), note `n` is unchanged (recursive part).
4. if `str` is empty return `(str, n)`

`letterCount` takes a string `str` and calls `letterCount'` with the parameters `(str, 0)`.

### `wordCounter'`, the generalisation of `wordCounter`
1. Take a (Char, String, Double), call it `(c, str, n)`
2. If previous character `c` is non-alphabetical and the head of `str` is an alphabet then we encountered a new word, call `wordCounter'(HEAD OF str, TAIL OF str, n + 1)` (recursive part)
3. Otherwise (both `c` and head are alphabets, still in a word. Or neither are alphabets, still haven't encountered a new word), call wordCounter`(HEAD OF str, TAIL OF str, n), note `n` is unchanged (recursive part)
4. if `str` is empty return `(c, str, n)`

`wordCount` takes a string `str` and calls `wordCount'` with the parameters `(' ', str, 0)`.

### The average
The average is calculated by taking the amount of letters and divides it by amount of words, that is 

`f(str) = letterCount(str) / wordCount(str)`

## 4 Skyffla (Shuffle a list)
This is function is built upon another function `everySecond` which returns every second element in a given list

### The `everySecond` function
1. Take a list
2. Add (prepend) its head with the TAIL OF the TAIL OF the list (recursive part). (In Haskell it's more of `x:y:xs` rather than TAIL TAIL).
3. If list has one element or none, return it.

### The `skyffla` function
1. Take a list
2. Get `everySecond` of the list and prepend it to `everySecond` of tail of original list (recursive part).
3. If list has one element or none, return it.