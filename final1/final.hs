module Final where

{- Exam Questions from many students 2019-2020 -}

-- Define a function `swapElems :: Eq a => a -> a -> [a] -> [a]`.
--   `swapElems a b xs` should replace all occurences of `a` in the list `xs`
--   by `b`, and all occurences of `b` by `a`.



-- Examples:
--   swapElems 1 2 [1]               = [2]
--   swapElems 1 2 [2]               = [1]
--   swapElems 1 2 [3]               = [3]
--   swapElems 1 2 [1,9,5,3,2,1,5,2] = [2,9,5,3,1,2,5,1]


swapElems :: Eq a => a -> a -> [a] -> [a]
swapElems           _     _     []  = []
swapElems           n1    n2   (x:xs)
    | n1 == x          = n2 : swapElems n1 n2 xs
    | n2 == x          = n1 : swapElems n1 n2 xs
    | otherwise        = x  : swapElems n1 n2 xs





-- Define a function `duplicatePred :: (a -> Bool) -> [a] -> [a]`
--   `duplicatePred p l` should duplicate the elements of `l` that satisfy the
--   predicate `p`.



-- Examples:
--   duplicatePred odd  [1, 2, 3] = [1, 1, 2, 3, 3]
--   duplicatePred even [1, 2, 3] = [1, 2, 2, 3]
--   duplicatePred odd  [2, 4, 6] = [2, 4, 6]


duplicatePred :: (a -> Bool) -> [a] -> [a]
duplicatePred        p         []    =  []
duplicatePred       p           (x:xs)
    | p x         = x : x : duplicatePred p xs
    | otherwise   = x : duplicatePred p xs





-- Define a function 'insertAtPred'.
--   'insertAtPred p y xs' should insert y before the first element of xs that
--   satisfies the predicate p, or at the end of xs if no element of xs
--   satisfies the predicate p.



-- Examples:
--  insertAtPred even 99 [1, 3, 5, 2] == [1, 3, 5, 99, 2]
--  insertAtPred even 99 [1, 3, 5, 7] == [1, 3, 5, 7, 99]
--  insertAtPred odd  99 [1, 3, 5, 2] == [99, 1, 3, 5, 2]
--  insertAtPred even 99 []           == [99]


insertAtPred   p  n  []        = [n]
insertAtPred   p  n  (x:xs)
    | p x                      =  n : x : xs 
    | otherwise                = x : insertAtPred p n xs 





-- Define a function addSquaresUpTo.
--   'addSquaresUpTo n x' should return the list of all integers
--   of the form 'n + a*a' that are less than or equal to x (where a >= 0).


-- Examples:
--   addSquaresUpTo 0   48   == [0,1,4,9,16,25,36]
--   addSquaresUpTo 0   49   == [0,1,4,9,16,25,36,49]
--   addSquaresUpTo 200 100  == []
--   addSquaresUpTo 568 1000 == [568,569,572,577,584,593,604,617,632,649,668,689,712,737,764,793,824,857,892,929,968]

addSquaresUpTo  n x = [n + a*a | a <- [0..x] ,(n+a*a) <= x, a >= 0]







-- removeLast even [0,1,2,3] == [0,1,3]
-- removeLast odd [0,1,2,3]  == [0,1,2]
-- removeLast even [1,3,5]   == [1,3,5]
removeLast :: (a -> Bool) -> [a] -> [a]
removeLast  p  xs
    | p (last(xs))           =  init (xs)
    | otherwise              =  removeLast p (init xs) ++ [last xs]




-- removeFirst even [0,1,2,3] == [1,2,3]
-- removeFirst odd [0,1,2,3]  == [0,2,3]
-- removeFirst even [1,3,5]   == [1,3,5]
removeFirst :: (a -> Bool) -> [a] -> [a]
removeFirst        p       []  = []
removeFirst       p           xs 
    | p (head xs)                   = tail xs
    | otherwise                     = [head xs] ++ removeFirst p (tail xs)







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




-- Define a function `f :: Int -> [a] -> [[a]]`.
--   `f n xs` should breaks the list `xs` into chunks of size `n`.

 

-- Examples:
--   f 1 [1, 2, 3, 4] == [[1], [2], [3], [4]]
--   f 2 [1, 2, 3, 4] == [[1, 2], [3, 4]]
--   f 3 [1, 2, 3, 4] == [[1,2,3], [4]]
--   f 4 [1, 2, 3, 4] == [[1,2,3,4]]

f :: Int -> [Int] -> [[Int]]
f _ []    = []
f n xs 
   | n == 1              = [take 1 xs] ++ f n (tail xs)
   | n < (length xs)     = [take n xs] ++ [drop n xs]
   | otherwise            = [xs]






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

 

ff :: [Int] -> [Int]
ff    []     = []
ff   [x]     = [x]
ff as@(x:y:z:r:xs)
    | x < y  && y < z && z < r   = [x]
    | x > y  && y > z && z > r   = as
    | x > y && y < z && z > r    = [x,y,r]
    | x < y && y > z && z < r    = [x,z]





-- Define a function `f :: [a] -> [a]`. The function `f` takes a list `xs` and
-- returns a list that consists of the elements of `xs` at indices that are
-- square numbers. (The 1st element of xs, the 4th element of xs, the 9th
-- element of xs, ...)

 

-- Examples:
--   f []      == []
--   f [0]     == 0
--   f "abcd"  == "ad"
--   f [1..49] == [1, 4, 9, 16, 25, 36, 49]

 


fm :: [a] -> [a]
fm     []  = []
fm    [x]     = [x]  
fm    xs      = map snd (filter (\(i,x) -> isSquare i) (zip [1..] xs))

isSquare :: Int -> Bool
isSquare     n   = elem n [a*a | a<- [1..n]]








-- foldr' (-) 0 [1,2,3] == 2 
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr'        p     _def            []  =  _def
foldr'        p      _def  (x:xs)  = p x (foldr' p _def xs)





-- foldl' (-) 0 [1,2,3] == 6
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl'         p          _def   []       = _def
foldl'         p          _def  (x:xs)    = foldl' p (p _def x) xs














-- Define binary function application. apply takes a tuple which has a function and two parameters. (1 point)

--     apply :: (a, a -> b -> c, b) -> c

--     apply (2, (+), 1)            == 3
--     apply (2, (-), 1 )           == 1
--     apply (1, (:), [])           == [1]
--     apply ([1..3], (++), [4..6]) == [1..6]

apply :: (a, a -> b -> c, b) -> c
apply    (x,      f     , y ) = f x y




-- Copy the following declarations into your solution:
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
times    x         xxs    = [[a*x | a <- xs] | xs <- xxs]








fApp :: [Int] -> Int
fApp xs       = length $ reverse xs




data Rectangle = Rectangle Integer Integer 


instance Show Rectangle where
    show (Rectangle x y) = "Rectangle" ++ show (x) ++ show(y)


calculateRec :: Rectangle -> Integer
calculateRec  (Rectangle x y) = x * y  






--productOf (<4) [1,7,2,6,3,3,5] == 18
productOf :: Num a => (a -> Bool) -> [a] -> a
productOf        p     []    = 1
productOf        p      (x:xs)
    | p x                      = x * productOf p xs
    | otherwise                = productOf p xs




-- Define (using either recursion or standard haskell functions) a function
-- `split`, that takes a list `xs`, and splits its elements into two lists.
-- The lengths of the two returned lists should be close to (length xs `div` 2).
-- Tests:
--   split []      == ([], [])
--   split [1]     == ([1], [])
--   split [1,2]    can be  ([1], [2]) or ([2], [1])
--   split [1,2,3]  can be  ([1,2], [3]) or ([1,3], [2]) or ...
split :: [Int] -> ([Int], [Int])
split    []     =  ([], [])
split    [x]    = ([x], [])
split    xs   | length xs == 2  = ([head xs], [last xs])
split    xs   | length xs == 3  = (init xs, [last xs]) 



counter :: (Num a, Eq a) => a -> [a]
counter             0  = []
counter             n  = n : counter (n-1)

counterm n = reverse (counter n)




-- count 'a' "aabaa" == 4
count :: Char -> String -> Int
count    c        ""     = 0
count    c        (x:xs)
    | c == x             = 1 + count c xs
    | otherwise          = count c xs



--   Add the index of each element to the element itself. (2 points)

--     addIndex :: [Int] -> [Int]

--     addIndex []  == []0
--     addIndex [0] == [0]
--     addIndex [0,0,0,0] == [0..3]
--     addIndex [0..5]    == [0,2..10]
--     addIndex [1,5,4]   == [1,6,6] + [0,1,2]

addIndex :: [Int] -> [Int]
addIndex    []     =  []
addIndex    [x]   = [x]
addIndex    xs    = map (\(i,x) -> i+x) (zip[0..] xs)





    -- Expand each pair in a list so that an element e occurs n times in the result. (2 points)

    -- expand :: [(Int, a)] -> [a]

    -- expand [(1,'a'), (0,'b'), (2,'c')] == "acc"
    -- expand [(0,'a'), (1,'b'), (2,'c')] == "bcc"
    -- expand [(1,'a'), (2,'b'), (0,'c')] == "abb"
    -- expand [(0,True), (0,False)] == []
    -- expand [] == []


--expand :: [(Int, a)] -> [a]
expand     []       = []
expand    xs        = concat $ map (\(i, x) -> replicate i x) xs 

-- Examples:
--   allDifferent []           == True
--   allDifferent [1, 1]       == False
--   allDifferent [1, 2, 3]    == True
--   allDifferent [1, 2, 3, 2] == False
allDifferent     [] = True
allDifferent (x:xs) 
    | x `elem` xs = False
    | otherwise   = allDifferent xs

-- 1. Define a type Time, that can store times of the day in the format (HH AM/HH PM).
--   (e.g. 12 AM,  01 AM,  12 PM,  07 PM, ...)

data Time = Time Int String deriving(Show,Eq)



-- 2. Define a function `nextTime :: Time -> Time` that advances a given time of the day by 1 hour.
nextTime :: Time -> Time
nextTime    (Time x y) 
    | x == 12 && y == "AM" = Time (succ x) "PM"
    | otherwise            = Time (succ x) "AM"



-- Define a function `f :: Eq a => [a] -> [a] -> Int`.
-- Given two lists `xs` and `ys`, `f xs ys` should count the number of positions
-- where the two lists match.
-- Examples:
--  f "abc" "abc" == 3
--  f "abc" "aaa" == 1
--  f "abc" "aac" == 2
--  f "abc" "cab" == 0
--  f ""    "abc" == 0

f1 :: Eq a => [a] -> [a] -> Int
f1       []  ys          = 0

f1            (x:xs)  (y:ys)
    | x == y                = 1 + f1 xs ys
    | otherwise             = f1 xs ys



-- Define a function `f :: Eq a => [a] -> [[a]]`
--   `f xs` should split the list `xs` between each pair of consecutive equal elements.

 

-- Examples:
--   f [1, 2, 3, 4] = [[1, 2, 3, 4]]
--   f [1, 2, 2, 1] = [[1, 2], [2, 1]]
--   f [1, 1, 1, 1] = [[1], [1], [1], [1]]
--   f [] = []

 

f2 :: Eq a => [a] -> [[a]]
f2        []      = []
f2         (x:y:xs)
    | x /= y            =  [(x:y:xs)]
    | otherwise         = []
    




