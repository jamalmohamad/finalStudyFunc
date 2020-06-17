
-- Extend a string to a specified width. If the string is longer than the width, do not make it shorter. (2 points)
align :: Int -> String -> String
align     n     []    | n == 0  = []
align     n      xs@(a:as)
    | n > length(xs)   = spaces (n - length(xs)) ++ xs
    | n < length(xs)   = xs



-- align 6 "apple"        == " apple"
-- align 7 "apple"        == "  apple"
-- align 2 "apple"        == "apple"
-- align (-8) "excellent" == "excellent"
-- align 15 "excellent"   == "      excellent"


spaces 0     = []
spaces n = ' ' : spaces (n-1)



-- Calculate the dot product of two lists, that is the sum of the products of the corresponding elements. The two lists are assumed to have the same length. (2 points)
dotProduct :: [Int] -> [Int] -> Int
dotProduct    []  []  = 0
dotProduct  (x:xs)     (y:ys)
    | length(x:xs) == length(y:ys)   
                                    = x * y + dotProduct xs ys
    | otherwise                  
                                    = error "the lists is not the same size"


-- dotProduct [1, 2] [3, 4] == 11
-- dotProduct [2, 2, 2] [5, 4, 3] == 24
-- dotProduct [3] [2] == 6
-- dotProduct [1..10] [1..10] ==  385
    



-- Define function a productOf :: (Int -> Bool) -> [Int] -> Int which calculates the product of integers that satisfy a condition. (2 points)
-- productOf (<4) [1,7,2,6,3,3,5] == 18
-- productOf even [8,32,65] == 256
-- productOf (==2) [1,2,3,2,1,2,3] == 8

productOf :: (Int -> Bool) -> [Int] -> Int
productOf         p        []    = 1
productOf         p            (x:xs) 
    | p x                 = x * productOf p xs
    | otherwise           = productOf p xs





-- Define a function equalsOn which checks that two functions yields same results on a list of arguments. (2 points)
equalsOn :: Eq b => (a -> b) -> (a -> b) -> [a] -> Bool
equalsOn                p          f        (x:xs)
    | p x == f x = True
    | otherwise = False


-- equalsOn (^2) (*2) [2]
-- not (equalsOn (^3) (*2) [2, 87])
-- equalsOn (<100) (>50) [51..99]
-- equalsOn id (*1) [1..10]
-- not (equalsOn (div 3) (mod 2) [1..])



-- tails "abc" == ["abc", "bc", "c", ""]
tails :: String -> [String]
tails ""         =[""]
tails    xs     =  [xs] ++ tails (drop 1 xs)



tails' []      = []
tails' (x:xs)  = [x:xs] ++ tails' xs





-- Tests whether this general sequence starts with the given sequence. (1 point)
-- startsWith "Ha" "Haskell"
-- startsWith "Scal" "Scala"
-- startsWith "" "a"
-- startsWith "" ""
-- startsWith "Real World" "Real World Haskell"
-- not (startsWith "a" "")
-- not (startsWith "ha" "Haskell")

startsWith :: String -> String -> Bool
startsWith     []      []      = True
startsWith     ""       _       = True
startsWith     _        ""      = False
startsWith     (x:xs)    (y:ys) = (x:xs) == take (length (x:xs))  (sequ (y:ys)) where
    sequ   []   = []
    sequ (x:xs)     = x : sequ xs   











