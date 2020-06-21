{- Exam Questions from many students 2019-2020

Define a function `swapElems :: Eq a => a -> a -> [a] -> [a]`.
  `swapElems a b xs` should replace all occurences of `a` in the list `xs`
  by `b`, and all occurences of `b` by `a`.



Examples:
  swapElems 1 2 [1]               = [2]
  swapElems 1 2 [2]               = [1]
  swapElems 1 2 [3]               = [3]
  swapElems 1 2 [1,9,5,3,2,1,5,2] = [2,9,5,3,1,2,5,1]




Define a function `duplicatePred :: (a -> Bool) -> [a] -> [a]`
  `duplicatePred p l` should duplicate the elements of `l` that satisfy the
  predicate `p`.



Examples:
  duplicatePred odd  [1, 2, 3] = [1, 1, 2, 3, 3]
  duplicatePred even [1, 2, 3] = [1, 2, 2, 3]
  duplicatePred odd  [2, 4, 6] = [2, 4, 6]







Define a function 'insertAtPred'.
  'insertAtPred p y xs' should insert y before the first element of xs that
  satisfies the predicate p, or at the end of xs if no element of xs
  satisfies the predicate p.



Examples:
 insertAtPred even 99 [1, 3, 5, 2] == [1, 3, 5, 99, 2]
 insertAtPred even 99 [1, 3, 5, 7] == [1, 3, 5, 7, 99]
 insertAtPred odd  99 [1, 3, 5, 2] == [99, 1, 3, 5, 2]
 insertAtPred even 99 []           == [99]




    

Define a function addSquaresUpTo.
  'addSquaresUpTo n x' should return the list of all integers
  of the form 'n + a*a' that are less than or equal to x (where a >= 0).


Examples:
  addSquaresUpTo 0   48   == [0,1,4,9,16,25,36]
  addSquaresUpTo 0   49   == [0,1,4,9,16,25,36,49]
  addSquaresUpTo 200 100  == []
  addSquaresUpTo 568 1000 == [568,569,572,577,584,593,604,617,632,649,668,689,712,737,764,793,824,857,892,929,968]





removeLast even [0,1,2,3] == [0,1,3]
removeLast odd [0,1,2,3]  == [0,1,2]
removeLast even [1,3,5]   == [1,3,5]






removeFirst even [0,1,2,3] == [1,2,3]
removeFirst odd  [0,1,2,3] == [0,2,3]
removeFirst even [1,3,5]   == [1,3,5]




  -- Define a function `f :: [Int] -> [[Int]]` that breaks a list of integers
-- into its non-decreasing continuous subsequences.

-- Examples:
--    f []        = []
--    f [0]       = [[0]]
--    f [1,2,3]   = [[1,2,3]]
--    f [3,2,1]   = [[3], [2], [1]]      
--    f [1,4,2,3] = [[1,4], [2,3]]
--    f [1,2,4,3] = [[1,2,4], [3]]
--    f [1,1,1]   = [[1,1,1]]



-- Define a higher-order function `f :: (a -> b -> a -> c) -> (a -> b) -> [a] -> [c]`
--  that uses all of its arguments.

f :: (a -> b -> a -> c) -> (a -> b) -> [a] -> [c]
f = undefined


`insertPos :: Int -> a -> [a] -> [a]`, such that `insertPos n v xs` insert the element v after the n-th element of xs.
insertPos n v xs



-- Define a function `f :: Int -> [a] -> [[a]]`.
--   `f n xs` should breaks the list `xs` into chunks of size `n`.

 

-- Examples:
--   f 1 [1, 2, 3, 4] == [[1], [2], [3], [4]]
--   f 2 [1, 2, 3, 4] == [[1, 2], [3, 4]]
--   f 3 [1, 2, 3, 4] == [[1,2,3], [4]]
--   f 4 [1, 2, 3, 4] == [[1,2,3,4]]

 

f :: Int -> [a] -> [[a]]
f = undefined




-- Define a function `f :: [a] -> [a]`. The function `f` takes a list `xs` and
-- returns a list that consists of the elements of `xs` at indices that are
-- square numbers. (The 1st element of xs, the 4th element of xs, the 9th
-- element of xs, ...)

 

-- Examples:
--   f []      == []
--   f [0]     == 0
--   f "abcd"  == "ad"
--   f [1..49] == [1, 4, 9, 16, 25, 36, 49]

 

f :: [a] -> [a]
f = undefined



-- Define a function `f :: [Int] -> [Int]`.
--   `f` takes a list `xs` of integers, and returns a list consisting of the
--   elements of `xs` that are less than or equal to the previous element of
--   `xs`.

 

-- Examples:
--   f []           == []
--   f [1]          == [1]
--   f [1, 2, 3, 4] == [1]
--   f [4, 3, 2, 1] == [4, 3, 2, 1]
--   f [2, 1, 4, 3] == [2, 1, 3]     -- 4 is removed because 1 < 4
--   f [3, 4, 1, 2] == [3, 1]        -- 4 is removed because 3 < 4, 2 is removed because 1 < 2

 

f :: [Int] -> [Int]
f = undefined


-}





-- ############################ solutions #############################

-- swapElems 1 2 [1]               = [2]
-- swapElems 1 2 [2]               = [1]
-- swapElems 1 2 [3]               = [3]
-- swapElems 1 2 [1,9,5,3,2,1,5,2] = [2,9,5,3,1,2,5,1]   -- this not working

swapElems :: Eq a => a -> a -> [a] -> [a]
swapElems _  _  []          = []
swapElems n1 n2 (x:xs)
    | x == n1               = [n2] ++ swapElems n1 n2 xs
    | x == n2               = [n1] ++ swapElems n1 n2 xs
    | otherwise             = [x] ++  swapElems n1 n2 xs




-- duplicatePred odd  [1, 2, 3] = [1, 1, 2, 3, 3]
-- duplicatePred even [1, 2, 3] = [1, 2, 2, 3]
-- duplicatePred odd  [2, 4, 6] = [2, 4, 6]

duplicatePred :: (a -> Bool) -> [a] -> [a]
duplicatePred        p           []   = []
duplicatePred        p          (x:xs) 
    | p x                     =  [x] ++ [x] ++ duplicatePred p xs
    | otherwise               = [x] ++ duplicatePred p xs






-- insertAtPred even 99 [1, 3, 5, 2] == [1, 3, 5, 99, 2]
-- insertAtPred even 99 [1, 3, 5, 7] == [1, 3, 5, 7, 99]
-- insertAtPred odd  99 [1, 3, 5, 2] == [99, 1, 3, 5, 2]
-- insertAtPred even 99 []           == [99]
insertAtPred :: Ord a => (a -> Bool) -> a -> [a] -> [a]
insertAtPred                 p          n    []        =  [n]
insertAtPred                 p          n    (x:xs)
  | p x          = n : x : xs
  | otherwise    = x : insertAtPred p n xs



-- Define a function addSquaresUpTo.
--   'addSquaresUpTo n x' should return the list of all integers
--   of the form 'n + a*a' that are less than or equal to x (where a >= 0).

  -- addSquaresUpTo 0   48   == [0,1,4,9,16,25,36]
  -- addSquaresUpTo 0   49   == [0,1,4,9,16,25,36,49]
  -- addSquaresUpTo 200 100  == []
  -- addSquaresUpTo 568 1000 == [568,569,572,577,584,593,604,617,632,649,668,689,712,737,764,793,824,857,892,929,968]
addSquaresUpTo :: Int -> Int -> [Int]
addSquaresUpTo    n x | n > x         = []
addSquaresUpTo n x  =  [n+a*a | a <- [0..x],a >= 0 , (n+a*a) <= x]






-- removeLast even [0,1,2,3] == [0,1,3]
-- removeLast odd [0,1,2,3]  == [0,1,2]
-- removeLast even [1,3,5]   == [1,3,5]

removeLast :: (a -> Bool) -> [a] -> [a]
removeLast        p          (x:xs)
  | p (last xs)            = init (x:xs) 
  -- | p (last xs) == False   = (x:xs) 
  | otherwise              = removeLast p (init (x:xs)) ++ [last xs]






-- Examples:
--   f 1 [1, 2, 3, 4] == [[1], [2], [3], [4]]
--   f 2 [1, 2, 3, 4] == [[1, 2], [3, 4]]
--   f 3 [1, 2, 3, 4] == [[1,2,3], [4]]
--   f 4 [1, 2, 3, 4] == [[1,2,3,4]]

 

f :: Int -> [a] -> [[a]]
f     n     []       = []
f     n     (x:xs) | n == 1         = [[x]] ++ f n xs
f     n     xs       | n == (length xs)   = [take n xs]
f     n     xs       | n >= 2             = [take n xs] ++ [drop n xs]  


chunks 0 [x]=[[x]]
chunks n []=[]
chunks n (x:xs)=[take n (x:xs)]++chunks n (drop n (x:xs))




-- f :: (a -> b -> a -> c) -> (a -> b) -> [a] -> [c]
-- f         p                  op        (x:xs)  = [p (op x xs)] 


main =  print(f 1 [1,2,3,4])



{- many questions from many resources including questions from last year 2018/2019-}
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


data Surface = Rectangle Integer Integer

instance Show Surface where
     show (Rectangle  x y ) = "Rectangle " ++ show x ++ " " ++ show y  


-- calculateSurface (Rectangle 2 3) == 6
calculateSurface :: Surface -> Integer
calculateSurface   (Rectangle x y) = x * y


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

-- times 1 matrix1 == matrix1
-- times 3 matrix3 == [[27.0,21.0,15.0],[18.0,15.0,12.0],[15.0,12.0,9.0]]
-- times 3.141 matrix0 == [[-3.141,6.282,9.423],[9.423,15.705,0.0],[3.141,-12.564,6.282]]
times :: Double -> Matrix -> Matrix
times      n       xxs  = [ [n*x | x <- xs] | xs <- xxs]




  -- Define a function `f :: [Int] -> [[Int]]` that breaks a list of integers
-- into its non-decreasing continuous subsequences.

-- Examples:
--    f []        = []
--    f [0]       = [[0]]
--    f [1,2,3]   = [[1,2,3]]
--    f [3,2,1]   = [[3], [2], [1]]      
--    f [1,4,2,3] = [[1,4], [2,3]]
--    f [1,2,4,3] = [[1,2,4], [3]]
--    f [1,1,1]   = [[1,1,1]] ~15 min
fun :: [Int] -> [[Int]]
fun []       = []
fun [x]      = [[x]]
fun (x:y:xs)  
    | length (x:y:xs) == 3 && x < y = [(x:y:xs)]
    | x < y        = [take 2 (x:y:xs)] ++ fun xs
    | x > y        = [take 1 (x:y:xs)] ++ fun (y:xs)
    | otherwise    = [(x:y:xs)]




-- elemIndex' 2   [1,2,3,4,5] == [1]
-- elemIndex' 22  [22,33,11]  == [0]
elemIndex'    n  xs =  map fst (filter (\(i,nn) -> isElem n nn ) (zip [0..] xs)) where 
    isElem n x 
        | n == x      = True
        | otherwise   = False




-- split' "abcdefghik" 3 == ["abc", defghik]
split' [] _ = [""]
split' xs n = [take n xs] ++ [drop n xs] 

-- split' "abcdefghik" 3 ==["abc","def","ghi","k",""]
-- split' xs n = [(take n xs)] ++ split' (drop n xs) n




-- Define binary function application. apply takes a tuple which has a function and two parameters. (1 point)
-- 
apply :: (a, a -> b -> c, b) -> c
apply (x, f , y) = f x y 



-- 
-- apply (2, (+), 1)            == 3
-- apply (2, (-), 1 )           == 1
-- apply (1, (:), [])           == [1]
-- apply ([1..3], (++), [4..6]) == [1..6]
-- 



--  Call two functions on the same parameter and collect both results. (1 point)

mapBoth :: (a -> b) -> (a -> c) -> a -> (b, c)
mapBoth       f           g        n  = (f n, g n)

--      mapBoth (*2) (+1) 0       == (0,1)
--      mapBoth fst snd (0,'a')   == (0,'a')
--      mapBoth head last [1..10] == (1,10)





-- Apply each function in the left component of a pair to the right component. (2 points)
    -- elemwiseApply [] == []
    -- elemwiseApply [((*2), 0), ((+1), 3)] == [0,4]
    -- elemwiseApply [(head, [1..10]), (last, [1..10])] == [1,10]

elemwiseApply :: [(a -> b, a)] -> [b]
elemwiseApply   []          = []
elemwiseApply    [(pp, x), (pa, y)] = [pp x, pa y]



--   Consider the following type for numbers. It distinguishes odd and even numbers.

data Number = Even Int | Odd  Int deriving (Eq, Show)

-- Define a function which increases a Number. (1 point)


-- inc show (Even x)  = "Odd "  ++ show x
-- inc show (Odd y)  = "Even " ++ show y
-- inc (Even 0) == Odd 1
-- inc (Even 8) == Odd 9
-- inc (Odd 1)  == Even 2

inc :: Number -> Number
inc    (Even x) =  Odd (x+1)
inc    (Odd x)  = Even (x+1)




    -- Enumerate indices of odd numbers in a list. (2 points)

    -- oddIx :: [Int] -> [Int]

    -- oddIx [1]   == [0]
    -- oddIx [1,2] == [0]
    -- oddIx []    == []
    -- oddIx [0..10] == [1,3,5,7,9]
    -- oddIx [1..10] == [0,2,4,6,8]
    -- oddIx [1,4,6,7,3,14,8] == [0,3,4]

--oddIx :: [Int] -> [Int]
oddIx     xs   = map fst (filter (\(i,n) -> isOdd n) (zip [0..] xs)) where
    isOdd n 
        | odd n     = True
        | otherwise = False


    -- Expand each pair in a list so that an element e occurs n times in the result. (2 points)

    -- expand :: [(Int, a)] -> [a]

    -- expand [(1,'a'), (0,'b'), (2,'c')] == "acc"
    -- expand [(0,'a'), (1,'b'), (2,'c')] == "bcc"
    -- expand [(1,'a'), (2,'b'), (0,'c')] == "abb"
    -- expand [(0,True), (0,False)] == []
    -- expand [] == []

--expand :: [(Int, a)] -> [a]
expand    xs = concat $ map (\(i,c) -> replicate i c) xs










--   Add the index of each element to the element itself. (2 points)

--     addIndex :: [Int] -> [Int]

--     addIndex []  == []0
--     addIndex [0] == [0]
--     addIndex [0,0,0,0] == [0..3]
--     addIndex [0..5]    == [0,2..10]
--     addIndex [1,5,4]   == [1,6,6] + [0,1,2]

addIndex :: [Int] -> [Int]
addIndex    xs    = [x  | x <- (map (\(i,a) -> i+a) (zip [0..] xs))]



-- Define the reverse of map. It takes an element and a list of functions. It applies each function over the element. (2 points)
-- reverseMap :: a -> [a -> b] -> [b]

-- reverseMap 5 [(+1), (*2), (7-)] == [6, 10, 2]
-- reverseMap 3 [\n -> take n [1..], \n -> replicate n 0, \n -> drop n [1..3]] == [[1..3], [0,0,0], []]


--reverseMap :: a -> [a -> b] -> [b]
reverseMap    n     [p,q,s]      = [p n] ++ [q n] ++ [s n]