module Invent where
import Data.List
   

-- count 5 == [1,2,3,4,5]
count :: Int -> [Int]
-- count     x  = [a | a <- [1..x]]
count    0   = []
count    x   = count (x-1) ++ [x]   -- [1..10]
-- count x = x : count(x-1)        -- [10,9,8,7,6,......,1]


-- getIndex [1,2,3,4] == [0,1,2,3]
-- getIndex [4,3,2] == [0,1,2]
getIndex :: [Int] -> [Int]
-- getIndex    xs    = [i | (x,i) <- zip xs [0..]]
getIndex       []    = []
-- getIndex       xs    = \(x,i) -> zip xs [0..]




-- getEvenIndexValues [1,2,3,4]     == [1,3]
-- getEvenIndexValues [2,4,6,8,10]  ==  [2,6,10]
-- getEvenIndexValues [1,3]         == [1]
getEvenIndexValues  xs   = [x | (x,i) <- zip xs [0..], even i]



-- findNext 4 [1,2,3,4,5]  == 5
-- findNext 2 [1,2,4]      == 4
-- findNext 1 []           == 1
findNext :: Int -> [Int] -> Int
findNext    n       []   = n
findNext    0       _    = 0
findNext     n      (x:y:xs)
    | n == x                  = y
    | otherwise               = findNext n (y:xs)




-- addIndexToValues [1,2,3] == [0+1,1+2, 2+3] [1,3,5]
-- addIndexToValues [2,4,6] == [2,5,8]
-- addIndexToValues []      == []

addIndexToValues xs = [i+x | (x,i) <- zip xs [0..]]




--   f [1, 1, 1, 1]       = [0, 1, 2, 3]
--   f [1, 2, 3, 4]       = [0, 0, 0, 0]
--   f [1, 2, 1, 2, 2, 1] = [0, 0, 1, 1, 2, 2]
--   f []                 = []

 
countOcc :: Int -> [Int] -> Int
countOcc    _ []        = 0
countOcc    n   xs   = length [ a | a <- xs  ,n == a]

f :: [Int] -> [Int]
f           (x:xs) = [countOcc a (take i (x:xs)) | (a,i) <- zip (x:xs) [0..]]




--generate zeros
--  generateZeros 3 = [0,0,0]
generateZeros :: Int -> [Int]
generateZeros n = take n (repeat 0)





-- findPrevious 4 [1,2,3,4,5]  == 3
-- findPrevious 2 [1,2,4]      == 1
-- findPrevious 1 []           == 1
findPrevious  :: Int -> [Int] -> Int
findPrevious      _      []    = 0
findPrevious      n     (x:y:xs)
    | n == y                      = x
    | otherwise                   = findPrevious n (y:xs)








fn :: Eq a => [a] -> [[a]]

 

fn []        = []
fn (x:xs)
  | all (==x) xs      = [[x]] ++ fn xs
  | head(xs) == head(drop 1 xs)  = [take 2 (x:xs)] ++ [drop 2 (x:xs)]
  | otherwise         = [(x:xs)]




-- Define (using either recursion or standard haskell functions) a function
-- `split`, that takes a list `xs`, and splits its elements into two lists.
-- The lengths of the two returned lists should be close to (length xs `div` 2).
-- Tests:
--   split []      == ([], [])
--   split [1]     == ([1], [])
--   split [1,2]    can be  ([1], [2]) or ([2], [1])
--   split [1,2,3]  can be  ([1,2], [3]) or ([1,3], [2]) or ...
split :: [Int] -> ([Int], [Int])
split    []    =  ([], [])
split   [x]    =  ([x], [])
split (x:xs)
    | length (x:xs) == 2       = ([x], [head xs])
    | otherwise                = (init (x:xs), [last xs])






 
-- Define a function `f :: Eq a => [a] -> [[a]]`                                                                                                        
--   `f xs` should split the list `xs` between each pair of consecutive equal elements.                                                                 

 

 

-- Examples:  
--   f []            = []  
--   f [1, 2, 2, 1]  = [[1, 2], [2, 1]]   
--   f [2,2,4]       = [[2], [2,4]]    
--   f [1,2,3,4,4,5] = [[1,2,3,4], [4,5]]
--   f [1, 2, 3, 4]  = [[1, 2, 3, 4]]                                                                                                                    
--   f [1, 1, 1, 1]  = [[1], [1], [1], [1]]                                                                                       

helper_f :: Eq a => [a] -> [a]
helper_f        []    = []
helper_f        [x]  =  [x]
helper_f   (x:y:xs)
  | x /= y      = [x] ++ helper_f (y:xs)
  | otherwise   = [x]




ff :: Eq a => [a] -> [[a]]
ff            []   = []
ff          xs   = [helper_f xs] ++ [drop (length $ helper_f xs) xs]




-- Define a function `duplicateLast :: (a -> Bool) -> [a] -> [a]`
--   `duplicateLast p xs` should duplicate the last element of `xs` that satisfies the predicate `p`.


-- Examples:
--   duplicateLast odd  [1] == [1, 1]
--   duplicateLast even [0, 1, 2, 3] == [0, 1, 2, 2, 3]
--   duplicateLast odd  [0, 1, 2, 3] == [0, 1, 2, 3, 3]
--   duplicateLast odd  [0, 2, 4, 6] == [0, 2, 4, 6]




helper_ff :: (a -> Bool) -> [a] -> [a]
helper_ff        p          []  = []
helper_ff        p         (x:xs)
  | p (last $ (x:xs))                     = (x:xs) ++ [last $ (x:xs)]
  | p (last (init (x:xs)))                =  init (x:xs) ++ [last(init (x:xs))] ++ [last (x:xs)]
  | otherwise                             = (x:xs)




duplicateLast :: (a -> Bool) -> [a] -> [a]
duplicateLast        p          (x:xs) = helper_ff p (x:xs)





-- not fully solved
-- Define a function `f :: (a -> Bool) -> [a] -> [[a]]`.
--   `f p xs` should be the list of the maximal continuous sublists of `xs` that
--   consist only of elements satisfying the predicate `p`.


-- Examples:
--   f even [0, 1, 2, 3] == [[0], [2]]
--   f odd  [0, 1, 2, 3] == [[1], [3]]
--   f even [0, 2, 1, 3] == [[0, 2]]
--   f odd  [0, 2, 1, 3] == [[1, 3]]
--   f odd  [0, 2, 4]    == []
--   f odd  [1, 1, 1, 0, 1, 1, 1] == [[1, 1, 1], [1, 1, 1]]


generic_f1 :: (a -> Bool) -> [a] -> [a]
generic_f1        p         []   = []
generic_f1        p          (x:xs)
  | p x                            = x : generic_f1 p xs
  | otherwise                      = generic_f1 p xs



fff :: Ord a => (a -> Bool) -> [a] -> [[a]]
fff       p   [] = []
fff       p          (x:xs) 
  | p x && (x:xs) == sort(x:xs)       = [[x]] ++ (fff p $ generic_f1 p (xs))
  | otherwise                  =  [generic_f1 p (x:xs)]





-- Define a function `merge3 :: Ord a => [a] -> [a] -> [a] -> [a]`. `merge3`
--   takes 3 sorted list `xs`, `ys`, `zs` and returns a single sorted list
--   containing the elements of `xs`, `ys` and `zs`. (without using the sort
--   function).


-- Examples:
  -- merge3 [1, 2, 3] [7, 8, 9] [4, 5, 6] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  -- merge3 [1, 4, 9] [2, 6, 8] [3, 5, 7] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  -- merge3 [1, 2, 6] [3, 4, 5] []        = [1, 2, 3, 4, 5, 6]
  -- merge3 []        [1, 2, 3] []        = [1, 2, 3]



sort' :: Ord a => [a] -> [a]
sort'             []  =   []
sort'            (x:xs) = (sort'(filter (<x) xs)) ++ [x] ++ (sort' (filter (>=x) xs))


merge3 :: Ord a => [a] -> [a] -> [a] -> [a]
merge3              xs     ys    zs  = sort'(xs ++ ys ++ zs)










-- Define a higher-order function `f :: ((a, b) -> (b, c)) -> (a -> a -> b) -> [a] -> [(c, b)]`
--   that uses all of its arguments.
-- f odd [1, 0, 1, 3, 0, 1, 5, 3] == [[1], [1, 3], [1, 5, 3]]

f2 :: ((a, b) -> (b, c)) -> (a -> a -> b) -> [a] -> [(c, b)]
f2               f               p           (x:xs) = undefined








-- The partitionAt function takes an integer `a` and a list `xs`, and returns
-- two lists `ys` and `zs`. The list `ys` contains all integers from `xs` that
-- are smaller than `a`, and the list `zs` contains the other elements of `xs`.
partitionAt :: Ord a => a -> [a] -> ([a], [a])
partitionAt             a     []  = ([], [])
partitionAt             a     (x:xs)
  | x <= a                        = (x:ys, zs)
  | otherwise                     = (ys, x:zs)
  where (ys, zs) = partitionAt a xs














