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
