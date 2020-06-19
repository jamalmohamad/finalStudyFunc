module Final where

import Data.List
import Data.Char
import Data.Ord



decompress :: [(Int,Char)] -> [Char]
--decompress [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')]            == "aaaabccaadeeee"
decompress    xs = concat (map (\(i,x) -> replicate i x) xs)




-- Define the function `drop'` by recursion.
-- `drop'` is called `drop` in Prelude.
-- Tests:
--   drop' 0  [1,2,3] == [1,2,3]
--   drop' 1  [1,2,3] == [2,3]
--   drop' 2  [1,2,3] == [3]
--   drop' 3  [1,2,3] == []
--   drop' 33 [1,2,3] == []
drop' :: Int -> [Int] -> [Int]
drop'       n     xs  | n == 0 = xs
drop'       _     []           = []
drop'       n     (x:xs)
    | n <= length(x:xs)    = drop' (n-1) xs
    | otherwise          = []




-- Define the function `take'` by recursion.
-- `take'` is called `take` in Prelude.
-- Tests:
--   take' 0  [1,2,3] == []
--   take' 1  [1,2,3] == [1]
--   take' 2  [1,2,3] == [1,2]
--   take' 3  [1,2,3] == [1,2,3]
--   take' 33 [1,2,3] == [1,2,3]
take' :: Int -> [Int] -> [Int]
take'    n        (x:xs) | n == 0 = []
take'    _         []             = []
take'    n         (x:xs)
    | n <= length(x:xs)           = x : take' (n-1) xs
    | otherwise                   = (x:xs)






-- Define by recursion a function `merge` that takes two sorted lists and merges
-- them in a single sorted list.
-- Tests:
--   merge []      []      == []
--   merge []      [1,2,3] == [1,2,3]
--   merge [1,2,3] []      == [1,2,3]
--   merge [1]     [2]     == [1,2]
--   merge [1]     [2]     == [1,2]
--   merge [1,3]   [2,4]   == [1,2,3,4]
--   merge [1,4]   [2,3]   == [1,2,3,4]
merge :: [Int] -> [Int] -> [Int]
merge      []      []    = []
merge      []      ys     = ys
merge      xs      []     = xs
merge      (x:xs)      (y:ys)    
    | x <= y = x : merge xs (y:ys)
    | otherwise   = y : merge (x:xs) (ys)






-- Define (using either recursion or standard haskell functions) a function
-- `split`, that takes a list `xs`, and splits its elements into two lists.
-- The lengths of the two returned lists should be close to (length xs `div` 2).
-- Tests:
--   split []      == ([], [])
--   split [1]     == ([1], [])
--   split [1,2]    can be  ([1], [2]) or ([2], [1])
--   split [1,2,3]  can be  ([1,2], [3]) or ([1,3], [2]) or ...
split :: [Int] -> ([Int], [Int])
split      []       = ([], [])
split      [x]      = ([x], [])
split      (x:y:xs)
    | length (x:y:xs) == 2   = ([x], [y])
    | otherwise              = (init (x:y:xs), [last xs])
 






-- Use the functions `merge` and `split` to define a Haskell version of merge sort.
-- Tests:
--   sort []        == []
--   sort [1]       == 1
--   sort [1, 2, 3] == [1, 2, 3]
--   sort [1, 2, 3] == [1, 2, 3]
--   sort [2, 1, 3] == [1, 2, 3]
--   sort [3, 2, 1] == [1, 2, 3]
--   sort [1, 2, 1] == [1, 1, 2]
--sort :: [Int] -> [Int]
sort'     xs = undefined




--productOf (<4) [1,7,2,6,3,3,5] == 18
productOf :: (Int -> Bool) -> [Int] -> Int
productOf         p               []  = 1
productOf         p            (x:xs)
    | p x                             = x * productOf p xs
    | otherwise                       = productOf p xs


--or 
productOf'  p   (xs)   = product (filter p xs)




-- isLetter 'a'  == True
-- isLetter '1'  == False
isLetter' :: Char -> Bool
isLetter'     c   = 'a' <= c && c <= 'z'




isLetterOrSpace' :: Char -> Bool
isLetterOrSpace'     c  | isLetter c = True
isLetterOrSpace'     ' '             = True
isLetterOrSpace'     _               = False



-- cipher "hello" 13 == "uryyb"
cipher :: [Char] -> Int -> [Char]
cipher     (x:xs)       n   =  undefined



-- count 'a' "aabaa" == 4
count    _      []   = 0
count    c     (x:xs)
    | c == x           = 1 + rest
    | otherwise        = rest
    where 
        rest = count c xs
    

-- binToDec   1 1 == 3
-- eq b1 *2^1 + b2 * 2^0

binToDec b1 b2 = b1 * pow2 1 + b2 * pow2 0 where
    pow2 x = 2 ^ x




-- f [[1,2,3],[4],[5,6]] == [[2], [4], [6]]
f xxs = [[a | a <- xs, even a] | xs <- xxs]



-- removeLowercase "The Big Dog" == "TBD"
removeLowercase st = [ c | c <- st, c `elem` ['A'..'Z']]




charToInt c = ord c - ord 'a'

intToChar i = chr (i + ord 'a')


shift = undefined


-- Write a simple function that takes in a MetricUnit, and returns its symbol

--     Meter → "m"
--     Liter → "L"
--     KiloGram → "kg"


-- MetricUnit is called type constructor
-- after the = called value constructor

data MetricUnit    = Meter | Liter   | Kilogram   deriving(Show, Eq)
data ImperialUnit  = Yard  | Gallon  | Pound      deriving(Show, Eq)

data Measurement  = MetricMeasurement Double MetricUnit  | ImperialMeasurement Double ImperialUnit  deriving(Show)


-- convert (MetricMeasurement 2 Meter) == ImperialMeasurement 2.18722 Yard
convert :: Measurement -> Measurement
convert    (MetricMeasurement x y)
    | y==Meter = ImperialMeasurement (1.0936*x) Yard -- work only with Meter
    
    




symbol :: MetricUnit -> String
symbol  Meter        = "m"
symbol  Liter        = "L"
symbol Kilogram      = "Kg"    


-- with guards
symbol' :: MetricUnit -> String
symbol' x 
    | x == Meter     = "m"
    | x == Liter     = "L"
    | x == Kilogram  =  "Kg"











type String' = [Char]

-- exclain "hello"  == "hello!"
exclain :: String' -> String
exclain     str    = str ++ "!"


data Direction = North | South | East | West


rotate :: Direction -> Direction  -- deriving(Show)
rotate    North = North
rotate    South = South
rotate    East  = East
rotate    West  = West


instance Show Direction where
    show North = "North"
    show South = "South"
    show West  = "West"
    show East  = "East"


data Point = Point Integer Integer  deriving(Show, Eq, Read)


--data Surface = Rectangle Integer Integer | Circle Integer Integer deriving (Show, Read, Eq)


-- data Surface = Rectangle Integer Integer

-- instance Show Surface where
--     show Rectangle  = "Rectangle Integer Integer"


-- -- calculateSurface (Rectangle 2 3) == 6
-- calculateSurface :: Surface -> Integer
-- calculateSurface    (Rectangle x y) = x * y


-- Read converts strings to other types
-- The type classOrdcontains all types that can be compared
data Date = Sunday | Monday | Tuesday


instance Show Date where
    show Sunday   = "Sunday"
    show Monday   = "Monday"
    show Tuesday  = "Tuesday"

presentDate :: Date -> Date
presentDate   Sunday      = Sunday









-- ff [[1,2,3],[4],[5,6]] == [[2], [4], [6]]
ff  xxs = [[a | a <- xs, even a] |xs <- xxs ]



-- 23:21 to 1:55  ~3h
-- Determine at which index is the greatest element in the list. (The indexing shall start from 1)
-- maxElem [11,33,22]    == [2]
-- maxElem [1,3,8,5,9]   == [5]
maxElem xs = map fst (filter(\(i,c) -> isMax c) (zip [1..] xs)) where 
    isMax n 
        | n == maximum xs = True 
        | otherwise       = False 



-- define a new data types that calculate the rectangle surface l*w, define it with deriving and without deriving 

-- calculateSurface (Rectangle 2 3)  == 6
-- calculateSurface (Rectangle 4 2)  == 8
-- calculateSurface (Rectangle 2 10) == 20 








--2:08 to 2:12
-- Examples:
--   f 1 [1, 2, 3, 4] == [[1], [2], [3], [4]]
--   f 2 [1, 2, 3, 4] == [[1, 2], [3, 4]]
--   f 3 [1, 2, 3, 4] == [[1,2,3], [4]]
--   f 4 [1, 2, 3, 4] == [[1,2,3,4]]
f2 _ []  = []
f2 n xs  | n == 1 = [[head xs]] ++ f2 n (tail xs)
--f2 n xs  | n == length(xs) = [xs]
f2 n xs                    = [take n xs] ++ [drop n xs]






type Matrix = [[Double]]

matrix0 = [[-1.0, 2.0, 3.0], [3.0, 5.0, 0.0], [1.0, -4.0, 2.0]]
matrix1 = [[1.0, 1.0, 1.0], [3.0, 2.0, 1.0]]
matrix2 = [[3.0, 2.0], [3.0, 1.0], [2.0, 1.0]]
matrix3 = [[9.0, 7.0, 5.0], [6.0, 5.0, 4.0], [5.0, 4.0, 3.0]]



-- Define a function times which multiplies every element in a matrix with a contant. (2 points)
times :: Double -> Matrix -> Matrix
times      n       xxs  = [ [n*x | x <- xs] | xs <- xxs]


-- times 1 matrix1 == matrix1
-- times 3 matrix3 == [[27.0,21.0,15.0],[18.0,15.0,12.0],[15.0,12.0,9.0]]
-- times 3.141 matrix0 == [[-3.141,6.282,9.423],[9.423,15.705,0.0],[3.141,-12.564,6.282]]