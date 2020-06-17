module Func where 

-- define a function `insertPos :: Int -> a -> [a] -> [a]`, such that `insertPos n v xs`
-- insert the element v after the n-th element of xs.

-- insertPos 1 1 [1,2,3,4] == [1, 1, 3, 4]
insertPos :: Int -> a -> [a] -> [a]
insertPos     0      n    xs = []
insertPos     pos    n    (x:xs) = x : take (pos-1) xs ++ n : drop pos xs

{-
C

-}

-- Define a function addSquaresUpTo.
--   'addSquaresUpTo n x' should return the list of all integers
--   of the form 'n + a*a' that are less than or equal to x (where a >= 0).

    
-- Examples:
--   addSquaresUpTo 0   48   == [0,1,4,9,16,25,36]
--   addSquaresUpTo 0   49   == [0,1,4,9,16,25,36,49]
--   addSquaresUpTo 200 100  == []
--   addSquaresUpTo 568 1000 == [568,569,572,577,584,593,604,617,632,649,668,689,712,737,764,793,824,857,892,929,968]


-- try it with recursion
addSquaresUpTo :: Integer -> Integer -> [Integer]
addSquaresUpTo     n              x   =   [n+a*a | a <- [1..x], a >= 0, (n+a*a) <= x]




-- Examples:
--   swapElems 1 2 [1]               = [2]
--   swapElems 1 2 [2]               = [1]
--   swapElems 1 2 [3]               = [3]
--   swapElems 1 2 [1,9,5,3,2,1,5,2] = [2,9,5,3,1,2,5,1]


-- Define a function `swapElems :: Eq a => a -> a -> [a] -> [a]`.
--   `swapElems a b xs` should replace all occurences of `a` in the list `xs`
--   by `b`, and all occurences of `b` by `a`.
swapElems :: Eq a => a -> a -> [a] -> [a]
swapElems            _   _      []  = []
swapElems            a    b   (x:xs)
    | a == x     = b : swapElems a b xs
    | b == x     = a : swapElems a b xs
    | otherwise  = xs


-- Find the last element of a list. 
-- mylast [1,2,3,4] == 4

myLast :: [Int] -> Int
-- myLast     xs    = head (reverse xs)
myLast     = head . reverse 




-- Find the last but one element of a list. 
-- myButLast [1,2,3,4]  == 3
-- myButLast ['a'..'z'] == y

myButLast :: [a] -> a
-- using $
myButLast    xs  = head $ drop 1 $ reverse xs

-- using .
myButLast'  =  head . drop 1 . reverse 



-- Find the K'th element of a list. The first element in the list is number 1. 
-- elementAt [1,2,3] 2   == 2
-- elementAt [haskell] 5 == 'e' 
elementAt  :: [a] -> Int -> a 
-- elementAt      xs     n   =  last (take n xs)
elementAt   (x:xs)       1    =  x
elementAt  (x:xs)  k = elementAt xs (k-1)



-- Find the number of elements of a list. 
-- myLength [1,2,3,4]         == 4
-- myLength "Hello, World!"   == 13

myLength :: [a] -> Int
myLength     []     = 0
myLength     (_:xs) = 1 + myLength (xs)


-- Reverse a list. 
-- myReverse "A man, a plan, a canal, panama!" == "!amanap ,lanac a ,nalp a ,nam A"
myReverse :: String -> String
myReverse    ""     = ""
myReverse     (x:xs)    = myReverse xs ++ [x]


-- foldl version 
myReverse' :: String -> String
myReverse' = foldl (\a x -> x:a) []



-- Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x). 
-- isPalindrome [1,2,3]                    == False
-- isPalindrome "madamimadam"              == True
-- isPalindrome [1,2,4,8,16,8,4,2,1]       == True
isPalindrome :: Eq a => [a] -> Bool
-- isPalindrome    xs  = xs == (reverse xs)
isPalindrome xs        = (head xs) == (last xs) 



-- If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed. 
-- compress "aaaabccaadeeee" == "abcade"
compress :: Eq a => [a] -> [a]
compress    (x:ys@(y:_))
    | x == y       = compress ys
    | otherwise    = x : compress ys
compress ys = ys


-- decompress




-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
-- pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a','a', 'd', 'e', 'e', 'e', 'e'] == ["aaaa","b","cc","aa","d","eeee"]
pack :: (Eq a) => [a] -> [[a]]
pack    []  = []
pack    [x] = [[x]] -- base case
pack (x:xs)
    | x `elem` hh  = (x:hh):tt
    | otherwise                  = [x]:pack xs 
    where 
        hh = (head (pack xs))
        tt = (tail (pack xs))



-- Run-length encoding of a list. 
-- Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E. 
--  encode "aaaabccaadeeee" == [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]




-- Generate the following list: [1, 2, …, n-1, n, n-1, …, 2, 1]
-- mountain :: Integer -> [Integer]

countDown :: Int -> [Int]
countDown    0   = []
countDown    n   = n : countDown (n-1)

mountain n = [1..(n-1)] ++ countDown n





-- Define `removeLast :: (a -> Bool) -> [a] -> [a]`
--  `removeLast p xs` removes the last element of `xs` that satisfies the
--  predicate `p`.


-- Examples:
--   removeLast even [0, 1, 2, 3] == [0, 1, 3]
--   removeLast odd  [0, 1, 2, 3] == [0, 1, 2]
--   removeLast even [1, 3, 5]    == [1, 3, 5]


removeLast :: (a -> Bool) -> [a] -> [a]
removeLast        p          []   = []
removeLast        p          xs
    | p (last xs)                               = init xs
    | otherwise                                 = removeLast p (init xs) ++ [last xs] 