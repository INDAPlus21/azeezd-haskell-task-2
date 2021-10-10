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

