module Invent where


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
