module Practice where


flip' p x y = p y x

-- map' (+1) [1,2,3] == [2,3,4]
map'  f   []         = []
map'  f  (x:xs) = f x : map' f xs



-- filter' (even) [1,2,3,4]
filter'  p      []       = []
filter'  p      (x:xs)
    | p x               = x : filter' p xs
    | otherwise         = filter' p xs



headInt (x:xs) = x 
tailInt (x:xs) = xs




-- elem' 1 [1,2,3,4] == True
elem'    n    (x:xs) 
    | n == x        = True
    | otherwise     = False




sum' []    = 0
sum' (x:xs)   = x + sum' (xs)






main = print()