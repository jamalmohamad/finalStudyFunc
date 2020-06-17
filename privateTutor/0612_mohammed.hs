myList = "adaadaad"
myList2 = ["ada", "ada", "ad"]
--take 3 myList == "ada"
--drop 3 myList == "adaad"

chunksOf :: Int -> [a] -> [[a]]
chunksOf = undefined

isPeriod :: Int -> String -> Bool
isPeriod n xs
  | length xs < n                       = True
  | beginsWith (take n xs) (drop n xs)  = isPeriod n (drop n xs)
  | otherwise                           = False

beginsWith :: Eq a => [a] -> [a] -> Bool
beginsWith xs ys = all same (zip xs ys) where
  same x = fst x == snd x

--[('a','a'),('d','d'),('a','a'),]

all'    :: (a ->Bool) -> [a] -> Bool
all' p []     = True
all' p (x:xs)
  | p x       = all' p xs
  | otherwise = False

any'    :: (a ->Bool) -> [a] -> Bool
any' p []     = False
any' p (x:xs)
  | p x       = True
  | otherwise = any' p xs

filter' :: (a ->Bool) -> [a] -> [a]
filter' p []    = []
filter' p (x:xs)
  | p x         = x : filter' p xs
  | otherwise   = filter' p xs

insertAP :: Ord a => (a -> Bool) -> a -> [a] -> [a]
insertAP p y []   = [y]
insertAP p y (x:xs)
  | p x           = y : x : xs
  | otherwise     = x : insertAP p y xs

encode :: Eq a => [a] -> [(Int, a)]
encode xs = encodeWithB [] xs where
  encodeWithB [] []         = []
  encodeWithB buffer []     = [(length buffer, head buffer)]
  encodeWithB [] (x:xs)     = encodeWithB [x] xs
  encodeWithB buffer (x:xs)
    | x == head buffer      = encodeWithB (x:buffer) xs
    | otherwise             = (length buffer, head buffer)
                            : encodeWithB [x] xs

{-
  aaabcca
  a aabcca
  aa abcca
  aaa bcca
  3a : b cca
  3a : 1b : c ca
  3a : 1b : cc a
  3a : 1b : 2c : 1a
-}
