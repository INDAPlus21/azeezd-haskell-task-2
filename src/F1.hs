import Data.Char

-- Calculate Fibbonacci number using the Golden Ratio formula (from course SF1671)
phi = (1 + sqrt 5) / 2
fib :: Float -> Integer
fib n = round ((phi ** n - (1 - phi) ** n) / sqrt 5)

vowels = ['a', 'e', 'i', 'o', 'u', 'y']
consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']
rovarsprak :: String -> String
rovarsprak [] = [] -- Base case
rovarsprak (x:xs)
    | x `elem` vowels = x:rovarsprak xs -- If vowel prepend the letter and continue to check the tail
    | otherwise = (x:"o") ++ [x] ++ rovarsprak xs -- otherwise, add "xo" then "xox" then preprend to rovarsprak of tail


karpsravor :: String -> String
karpsravor [] = [] -- Base case
karpsravor (x:xs)
    | x `elem` consonants = x:karpsravor(drop 2 xs) -- If consonant x then drop next two characters "ox" and prepend x to the new tail
    | otherwise = x:karpsravor xs -- If vowel, continue without changes



{-
First form of the letter counting function. Is used in the friendlier letterCounter function (no apostrophe!)

Algorithm (Recursion): 
Takes a String and Double (easier for the medellangd function) and if the head is an alphabet then increments the double by 1 and
continues counting with the tail of the string and the newly updated counter value.
If non-alphabet is encountered then continues counting on the tail but does not increase the counter value
-}
letterCounter' :: (String, Double) -> (String, Double)
letterCounter' ([], n) = ([], n) -- Base case, empty string breaks the recursion and returns the value
letterCounter' (x:xs, n) -- String and starting number given
    | isAlpha x = letterCounter' (xs, succ n) -- Alphabet; increase counter by 1 and continue with tail: f(tail, n+1)
    | otherwise = letterCounter' (xs, n) -- Non-alphabet; count using the tail, counter unchanged f(tail, n)

{-
The useable form of the letter counting function.

Takes a string and returns the amount of alphabet in it.
Using the letterCounter' function with initial parameters for counter 0
-}
letterCounter :: String -> Double
letterCounter [] = 0
letterCounter str = snd (letterCounter' (str, 0)) -- Extract second value of the letterCounter', it is the counter value

{-
First form of the word counting function. Used in the friendlier wordCounter function (again, no apostrophe!)

Algorithm (Recursion):
A new word is when the previous character is non-alphabetical and the current letter is alphabetical.
If previous character was non-alphabetical and current is alphabetical then call the same function giving it
the current character as the previous, the tail as the string and increment the word counter by one.
If previous and current is alphabetical then we are still in a word and haven't encountered one yet. So call the same function with
the current letter as the previous and the tail as the string but leave the counter unchanged.
Same reasoning for if both current and previous is not alphabetical, still hasn't encountered a new word.
-}
wordCounter' :: (Char, String, Double) -> (Char, String, Double)
wordCounter' (c, [], n) = (c, [], n)
wordCounter' (c, x:xs,n) 
    | not (isAlpha c) && isAlpha x = wordCounter' (x, xs, succ n) -- Previous is not alphabet but current is: new word!
    | otherwise = wordCounter' (x, xs, n) -- Counter unchanged

-- Extracts the third item from a tuple. Used in wordCounter to extract the counter value from wordCounter'
third :: (a, b, c) -> c
third (_, _, n) = n

{-
The useable wordCounter function.
Takes a string and calls the wordCounter' function with the inital parameters:
Previous character ' '
Counter = 0
-}
wordCounter :: String -> Double 
wordCounter [] = 0
wordCounter str =  third (wordCounter' (' ', str, 0))

-- Average word length is letters per sentence divided by amount of words
medellangd :: String -> Double
medellangd [] = 0
medellangd str = letterCounter str / wordCounter str

