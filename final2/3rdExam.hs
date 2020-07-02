module Exam3rd where





{-
What is a higher order function? 
Define a higher order function in Haskell. 
Define the function composition operator in Haskell together with its type and demonstrate its use in an expression. 
Define map and filter. 
What is an anonymous function? 
What are sections in Haskell?


-}




-- Define a function `f :: [Int] -> [[Int]]`.
--   `f xs` should split the list `xs` into its maximal continuous sublists of the form [n, n+1, n+2, n+3, ...]

 

-- Examples
--  f []                 == []                              work
--  f [1, 2, 3, 4]       == [[1, 2, 3, 4]]                  work
--  f [1, 2, 4, 5]       == [[1, 2], [4, 5]]                work with helper_f
--  f [1, 3, 4, 6]       == [[1], [3, 4], [6]]
--  f [1, 1, 2, 1, 2, 3] == [[1], [1, 2], [1, 2, 3]]
-- f [1,3,4,5,6] == f [[1], [3,4,5,6]]                  work
 

helper_f :: [Int] -> [[Int]]
helper_f    []      = []
helper_f    [x]      = []
helper_f   ys@(x:y:xs)  
    | (x+1) == y                     = [take (x+1) ys] ++ helper_f (drop (x+1) (y:xs)) ++ [drop(x+1) ys]
    | otherwise                      = [[x]] ++ [[x,y]] ++ helper_f (xs)


f :: [Int] -> [[Int]]
f    []     = []
f    [x]    = []   
f   as@(x:y:xs)
    | (x+1) == y      = [as]
    | (x+1) /= y      = [take x as]  ++ f (y:xs)
    | otherwise       = [[x]] ++ f (y:xs) 