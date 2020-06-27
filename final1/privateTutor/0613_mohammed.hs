type MyString = [Char]

type Coordinate = (Integer, Integer)

data HunBool = Igaz | Hamis

data Section = Section Coordinate Coordinate
--           | SectionByAngle Coordinate Length Angle
             deriving Show

times :: Section -> Integer -> Section
times (Section (c1x, c1y) (c2x, c2y)) n
  = Section (c1x*n, c1y*n) (c2x*n, c2y*n)

plus :: Section -> Section -> Section
plus = undefined

{-
  > Section (0,0) (1,2) == Section (2,2) (3,4)
  True
-}
instance Eq Section where
  Section (c1x, c1y) (c2x, c2y)
    == Section (c3x, c3y) (c4x, c4y)
    = c2x - c1x == c4x - c3x
    && c2y - c1y == c4y - c3y

{-
  Maybe a = Nothing | Just a
  MyList
-}

myDict :: [(Integer, Char)]
myDict = [(1, 'a'), (2, 'b')]

-- Partial function: not defined for all values.
myLookup :: Integer -> Char
myLookup 1 = 'a'
myLookup 2 = 'b'
myLookup n = undefined

-- Handling partiality with Maybe:
-- Partial function: not defined for all values.
myLookup' :: Integer -> Maybe Char
myLookup' 1 = Just 'a'
myLookup' 2 = Just 'b'
myLookup' n = Nothing

nextChar :: Maybe Char -> Maybe Char
nextChar Nothing  = Nothing
nextChar (Just c) = Just (succ c)


data MyMaybe a = MyNothing | MyJust a

instance Show a => Show (MyMaybe a) where
  show (MyNothing) = "myNothing"
  show (MyJust x)  = "myJust " ++ show x

instance Eq a => Eq (MyMaybe a) where
  MyNothing == MyNothing = True
  MyNothing == _         = False
  MyJust x  == MyNothing = False
  MyJust x  == MyJust y  = x == y

data MyEither a b = MyLeft a | MyRight b
--                 Nothing + | Just b

instance (Show a, Show b) => Show (MyEither a b) where
  show (MyLeft x)  = "myLeft " ++ show x
  show (MyRight y) = "myRight " ++ show y

data MyList a = Empty | Comma a (MyList a)
              deriving (Show, Eq)

-- [0,1,2,3] == 0 : 1 : 2 : 3 : []
my0to3 :: MyList Integer
my0to3 = Comma 0 $ Comma 1 $ Comma 2 $ Comma 3 Empty

myLast :: MyList a -> a
myLast  Empty           = error "empty list"
myLast (Comma x Empty)  = x -- x : [] == [x]
myLast (Comma x xs)     = myLast xs

data Tree a = Leaf a | Branch (Tree a) (Tree a)
            deriving (Show, Eq)

leaves :: Tree a -> [a]
leaves (Leaf x)       = [x]
leaves (Branch xT yT) = leaves xT ++ leaves yT

simpleTree = Branch
            (Branch (Leaf (True, True))
                    (Leaf (True, False)))
            (Branch (Leaf (False, True))
                    (Leaf (False, False)))

data FamTree
  = Parentless String
  | HasParents String FamTree FamTree
  deriving (Show, Eq)

mohammedsFam :: FamTree
mohammedsFam = HasParents "mohammed"
              (HasParents "jamal"
                (Parentless "hadi")
                (Parentless "naima")
              )
              (HasParents "ahlam"
                (Parentless "abod")
                (Parentless "wajaha")
              )
names :: FamTree -> [String]
names (Parentless x)         = [x]
names (HasParents x xt1 xt2) = [x]
                            ++ names xt1
                            ++ names xt2

occurs :: String -> FamTree -> Bool
occurs x (Parentless y)       = x == y
occurs x (HasParents y t1 t2) = x == y
                             || occurs x t1
                             || occurs x t2
              (HasParents ""
                (Parentless "")
                (Parentless "")
              )
-- > "abod" `occurs` mohammedsFam
-- True
-- > "Trump" `occurs` mohammedsFam
-- False
