module Debug where


-- keep :: (Int -> Bool) -> [a] -> [a]
-- keep f xs = ws where
--         ys = zip [0..] xs
--         -- ys is xs decorated with the indices
--         -- ys == [(0, "a"), (1, "b"), (2, "c"), (3, "d")]
--         -- zs :: [(Int, a)]
         
--         zs = filter (\(i, _) -> f i) ys
--         -- zs is obtained by filtering the list ys
--         -- zs == [(1, "b"), (3, "d")]
--         -- ws :: [a]
--         ws = map snd zs
--         -- ws is zs, undecorated
--         -- ws = ["b", "d"]

-- isSqaure x = elem x [a*a | a <- [1..x]]






















add' :: Int -> (Int -> Int) -> Int  -- hof curry function
add'    x                p    = x + 1    -- total 









-- Define a function `f :: [a] -> [a]`. The function `f` takes a list `xs` and
-- returns a list that consists of the elements of `xs` at indices that are
-- square numbers. (The 1st element of xs, the 4th element of xs, the 9th
-- element of xs, ...)

 

-- Examples:
--   f []      == []
--   f [0]     == [0]
--   f "abcd"  == "ad"
--   f [1..49] == [1, 4, 9, 16, 25, 36, 49]




keep :: (Int -> Bool) -> [a] -> [a]
keep        p          xs  = indices where
        ys = zip [1..] xs         --ys = [(0, 'a'), (1, 'b'), ()]
        zs = filter (\(i,c) -> isSquare i) ys  -- zs = [(1, 'b'), (3, 'd')]
        indices = map snd zs



-- isSquare 4 == True
isSquare n = elem n [a*a | a <- [1..n]]



main = print(keep odd "abcd")