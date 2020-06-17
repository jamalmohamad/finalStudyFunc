module Study where 

-- practice01
f :: String
f = "Hello"

first :: (Eq a, Eq b, Enum a, Enum b) => a -> b -> a  -- a,b are type variables
first    x   y  = x






app :: (a -> b) -> (a -> b)
app       f       =   f                      -- can write like this this
--app         f      x   = f x               -- or like this, both should accept f x 


-- The partitionAt function takes an integer `a` and a list `xs`, and returns
-- two lists `ys` and `zs`. The list `ys` contains all integers from `xs` that
-- are smaller than `a`, and the list `zs` contains the other elements of `xs`.
partitionAt :: Ord a => a -> [a] -> ([a], [a])
partitionAt a [] = ([], [])
partitionAt a (x:xs)
  | x <= a    = (x:ys, zs)
  | otherwise = (ys, x:zs)
  where (ys, zs) = partitionAt a xs







type Property a = a -> Bool



isPal :: (Eq a) => Property [a]
isPal  []       = True
isPal  (c:[])   =  True 
isPal s
    | head s == last s              = isPal(init (tail s))
    | otherwise                     = False




-- data HunBool = Hamis | Igaz --deriving (Ord, Read, Enum, Bounded)





-- Define `removeLast :: (a -> Bool) -> [a] -> [a]`
--  `removeLast p xs` removes the last element of `xs` that satisfies the
--  predicate `p`.


-- Examples:
--   removeLast even [0, 1, 2, 3] == [0, 1, 3]
--   removeLast odd  [0, 1, 2, 3] == [0, 1, 2]
--   removeLast even [1, 3, 5]    == [1, 3, 5]




-- removeLast :: (a -> Bool) -> [a] -> [a]
-- removeLast         p         xs@(a:as)
--   | p (last xs)           = init xs
--   | otherwise             = p a : removeLast p xs





-- Define `isPeriod :: Int -> String -> Bool` 
--   `isPeriod n s` checks if `n` is a period of the string `s`. 
--   n is a period of a string [s_1, s_2, ..., s_m] when 
--   for every i such that (1 <= i) and (i+n <= m), s_i == s_(i+n). 

-- (isPeriod n s is not defined when n <= 0). 

-- Examples: 
--   isPeriod 99 ""      == True 
--   isPeriod 1 "a"      == True 
--   isPeriod 1 "aaa"    == True 
--   isPeriod 3 "aaa"    == True 
--   isPeriod 2 "aba"    == True 
--   isPeriod 2 "ababab" == True 
--   isPeriod 6 "ababab" == True 
--   isPeriod 3 "abaaba" == True 



  

--   isPeriod 1 "aba"    == False 
--   isPeriod 2 "abc"    == False 
--   isPeriod 2 "ababb"  == False 
--   isPeriod 3 "ababab" == False 

  
--18:42 - 
-- isPeriod :: Int -> String -> Bool 
-- isPeriod    n        s   
--   | n <= 0        = error "not defined"







mnmInt :: [Int] -> Int
mnmInt    []     = error "empty list"
mnmInt    [x]    =  x
mnmInt    (x:xs) =  min x (mnmInt xs) 



delete :: Eq a => a -> [a] -> [a]
delete x [] = []
delete x (y:ys) 
  | x == y = ys
  | otherwise = y : delete x ys


--1:23
-- f xs replaces each element of the list xs by its number of occurences in the list xs.
-- f [] = []
-- f [1,2,3] == [1,1,1]
-- f [1,1,1] == [3,3,3]
-- f [3,2,1,2,3] == [2,2,1,2,2]



-- debug
-- ff [1,2,3] = 1 : 2 : 3 : 2 : [] 
ff :: [Int] -> [Int]
ff     [] = []
ff     (x:xs) = undefined


-- this one I understand it 
-- simpleRecursion [1,2,3] == [1,2,3]
simpleRecursion :: [Int] -> [Int]
simpleRecursion    []      = []
simpleRecursion     (x:xs) = x : simpleRecursion xs        -- 
-- taking element by element outside and create a new list with new elements




-- this one I know how it works but can not apply it in haskell

-- replaceMiddle 0 []         == []
-- replaceMiddle 1 [2,3,4]    == [2,1,4]
-- replaceMiddle 2 [1,3,2]    == [1,2,2]
-- replaceMiddle 1 [3,4,5,7]  == [3,4,5,7]
-- my Explanation to replaceMiddle, int n is replaced in the middle of a list containing three numbers only 
replaceMiddle :: Int -> [Int] -> [Int]
replaceMiddle     n    [x,y,z]      = [x,n,z]






--drop' 2 [1,2,3]
drop' :: Int -> [a] -> [a]
drop'    n      xs  | n <= 0 = xs
drop'    _     []            = []
drop'    n      (x:xs)           = drop' (n-1) xs


take' :: Int -> [a] -> [a]
take'     n     xs | n <= 0 = xs
take'     n     []          = []
take'     n     (x:xs)      = x : take (n-1) xs



-- insertPos 1 1 [1,2,3,4] == [1, 1, 3, 4]
insertPos :: Int -> a -> [a] -> [a]
insertPos     0      v     xs = []
insertPos     n      v    (x:xs)   = x : take(n-1) xs ++ v : drop (n-1) xs
-- insertPos  n      v    xs         = take n xs ++ v : drop (n-1)
insertPos     n      v    (x:xs)   = x : take(n-1) xs ++ v : drop (n-1) xs


-- chuncksOf 
slice :: Int -> [a] -> [[a]]
