module Bif where



-- any (<3) [1,2,3]                  == True 
-- all (==3) [1,2,3,4]               == False
-- all (==3) [3,3,3]                 == True
-- filter (>4) [1,2,3,4,5,6]         == [5,6]
-- map (+1) [1,2]                    == [2,3]
-- head [1,2,3]                      == 1
-- tail [1,2,3]                      == [2,3]
-- concat [[1,2], [3,4]]             == [1,2,3,4]
-- zip [1,2] [a,b]                   == [(1,'a'), (2, 'b')]
-- take 3 [1,2,3,4,5,6]              == [1,2,3]
-- drop 3 [1,2,3,4,5,6]              == [4,5,6]
-- length [2,3,4,5]                  == 4
-- replicate 3 'a'                   == "aaa"
-- elem 2 [1,2,3]                    == True
-- reverse [1,2,3]                   == [3,2,1]
-- foldr (-) 0 [1,2,3]               == 2
-- foldl (-) 0 [1,2,3]               == -6
-- takeWhile (/= ' ') "abc de f"     == "abcdef"
-- dropWhile (== ' ') "     abc"     == "abc"
-- (.)




-- type String  = [Char]


-- lists pattern
-- 1:(2:(3:(:[]))



-- [x*x | x <- [1..5], even x ]

-- pairs [1,2,3,4] == [(1,2), (2,3), (3,4)]
pairs :: [a] -> [(a,a)]
pairs   xs  = zip xs (tail xs)


sorted :: Ord a => [a] -> Bool
sorted              xs  = and [x <= y| (x,y) <- pairs xs]


positions :: Eq a => a -> [a] -> [Int]
positions            n    xs  = [i  | (i,x) <- zip [0..] xs, n == x]






count :: Char -> String -> Int
count     c       xs     = length [x | x <- xs, c == x] 



