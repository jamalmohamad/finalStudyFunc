{-
reference solutions to lambda website exercise
http://lambda.inf.elte.hu/FL_FunDef_en.xml#exercise 



what is a function?
a function takes one parameter and reduce a value
f :: Int -> Int   f has type of Int and produce a value of Integer (x+1)
f x = x + 1  




Definition of Operators

-}






module Lambda where 
import Data.Foldable


f :: Int -> Int
f     x   = x + 1




-- Generate the following list: [1, 2, …, n-1, n, n-1, …, 2, 1]

countDown :: Integer -> [Integer]
countDown     0  = []
countDown     x  = x : countDown (x-1)

mountain :: Integer -> [Integer]
mountain      n     = [1..n-1] ++ countDown n



-- Calculate the sum of squares from 1 to n.
sumSquaresTo :: Integer -> Integer
sumSquaresTo x = sum [a*a | a <- [1..x]]




-- Define a function, which given an integer n, returns the positive divisors of n!
divisors :: Integer -> [Integer]
divisors = undefined



-- Let scale' t be scaling from origin by t.

-- scale' 5 (3, 4) == (15, 20)
scale' :: Num a => a -> (a, a) -> (a, a)
scale' = undefined




-- Define modulo 3 multiplication. This means that for every x and y between 0 and 3, this expression will be true:
-- x `mul3` y == (x * y) `mod` 3
-- Use pattern matching to achieve this. Do not use the mod function or multiplication operator in your solution!


-- 2 `mul3` 2 == 1
-- 0 `mul3` 2 == 0
-- 2 `mul3` 1 == 2

mul3 :: Int -> Int -> Int
mul3 = undefined


-- Define a function that replaces a line break with a space, and otherwise returns the same value. Recall that ‘’ is the character value for a newline.

-- replaceNewline  'x' == 'x'
-- replaceNewline '\n' == ' '
--  
replaceNewline :: Char -> Char
replaceNewline = undefined





-- list patterns 
-- Empty list pattern: [] 
-- Non-empty list pattern: a: b
-- Other list patterns: [a], [a, b], …
null :: [a] -> Bool
null [] = True
null _  = False
head :: [a] -> a
head (x:xs) = x
tail :: [a] -> [a]
tail (x:xs) = xs


-- Redefine sum!
--sum :: Num a => [a] -> a
--sum = undefined












main = print (f 2)