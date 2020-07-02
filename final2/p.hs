module P where

fact10 :: Int
fact10 = product[1..10]



even' :: Int -> Bool
even'  x      = x `mod` 2 == 0





odd' :: Int -> Bool
odd'   x    = x `mod` 2 /= 0



app :: (a -> b) -> (a -> b)
app      f   x   = f x


max' :: Int -> Int -> Int
max'      x    y   
    | x > y       = x
    | otherwise   = y


l1 = [1]: [[]]

filter' :: (a -> Bool) -> [a] -> [a]
filter'      p           []   = []
filter'      p (x:xs)
    | p x                     = x : filter' p xs
    | otherwise               = filter' p xs



-- countEven [0,0,1,2] == 3
countEven :: (Eq a, Integral a) => [a] -> Int
countEven           (x:xs)  = length [a | a <- (x:xs), even a == True]



squares :: [Int] -> [Int]
squares  xs   = [x*x | x <- xs]

-- isSquare 4 == True
isSquare :: Int -> Bool
isSquare     n = n `elem` squares [0..n]


-- tails "abc" == ["abc", "bc", "c", ""]
tails :: String -> [String]
tails      ""  = [""]
tails (x:xs) = (x:xs) : tails xs





-- isPrefixOf "abcdef" "abcdef" == True
isPrefixOf :: String -> String -> Bool
isPrefixOf      []        []   = True
isPrefixOf     _          []   = False
isPrefixOf    []          _    = True
isPrefixOf    (x:xs)    (y:ys)  = (x == y) && isPrefixOf xs ys





  --  `f` takes a list of pairs as argument.
--  for each pair (x, y) in that list, `f` should add `x` times the element `y` to the result.



frep :: [(Int, a)] -> [a]
frep [] = []
frep   [(0,_)] = []
frep  ((n, x):xs)  = replicate (abs n) x ++ frep xs


 

-- Examples:
--  f []                             = []
--  f [(0, 'a')]                     = ""
--  f [(1, 'a')]                     = "a"
--  f [(2, 'a')]                     = "aa"
--  f [(0, 'x'), (2, 'a')]           = "aa"
--  f [(2, 'a'), (3, 'b'), (1, 'a')] = "aabbba"