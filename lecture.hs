{-
1- What is a function? What is λ (lambda) calculus? Present the syntax of λ calculus. 
What is β (beta) reduction, and how does a function application evaluate in λ calculus? 
What is currying? What is the normal form of an expression? When do we say that an expression is reducible?


f x = x + 1          A simple function takes one parameter x and produces a value

\(body . output)   \x.x   lambda calculas
\x -> x + 1

beta reduction
\(x.x) \(y.y) 2
= \(y.y) 2 
= \(x.x) 2
= 2   


f = \x -> x + 1    function evaluation in lambda
f 2 = 3




currying
transforms a function that takes multiple parameters into a chain of one-parameter functions
-> is right associative and the function add is left associative

• Uncurried functions: One function, many arguments
• Curried functions: Many functions, one argument apiece

add :: Int -> (Int -> Int)    means take an arg and return a function that takes another args and return an Int

addOne = add 1
addTwo = addOne 2
addTwo = 3


normal form of an expression
x = x + 1

reducible form
(\x -> x + 1)(7) == 8 

################################################################################################################################




































2- Present the syntax of Haskell functions and constants. Show step-by-step evaluation of a function application. 
Show how functions can be used in infix and prefix form. 
What is precedence and associativity of an operator? 
What is the difference between left and right associativity?

x = 2   x is a constant

f :: Int -> Int   function f has type of  Integer and will return an integer
f x      = x * x
f 2      = 2 * 2 
f 2 = 4


function application $


    
2 * 2      infix form
(*) 2 2    prefix form


precedence and associativity of an operator
infixl 7 *     precedence level 7, associate from left



right associative
2 + (4 - 6) == 4
(1 - (2 + 3)) == -4

left associative
(2 + 4) - 6 == 0
((1 - 2) + 3) == 2
################################################################################################################################






























3- Define the notion of type. 
What are the predefined numeric types in Haskell? 
What is a type class? 
Present Num, Integral, Fractional, Eq, Ord and Show type classes. 
When do we say that a type has an instance of a type class? 
Define a new data type and make the type an instance of a type class without deriving. 
Present how function types are written in Haskell. 
What is currying in Haskell?

Type annotation syntax is  [function name] ::  [type]  f :: Int
Type class syntax is         (Ea a, Num a) => a ......


-- Types are how we group a set of values together that share something in common.
:: has type of

numeric types 
Integral   - Int, Integer 
Fractional - Float, Double


:info Num
:info Integral
:info Fractional
:info Eq
:info Ord

data Date = Sunday | Monday | Tuesday


instance Show Date where
    show Sunday   = "Sunday"
    show Monday   = "Monday"
    show Tuesday  = "Tuesday"

presentDate :: Date -> Date
presentDate   Sunday      = Sunday


Currying
transforms a function that takes multiple parameters into a chain of one-parameter functions
add :: Int -> (Int -> Int)    means take an arg and return a function that takes another args and return an Int, -> is right associative

addOne = add 1
addTwo = addOne 2
addTwo = 3

##############################################################################################################################



























4- Present tuple types, their construction in Haskell expressions and how a function can pattern match on tuples. 
Present the list type, its data constructors, and how a function can pattern match on lists.
What is the difference between tuples and lists? 


tuples (1, 'a', "hello") :: (Int, Char, String)          tuples can mix between types
lists  [1,2,3] :: [Int] ot ['a'] :: Sting/ [Char]        list can not mix between types



list comprehensions are a means of generating new list from a list or lists.
evaluation [o/p | generators, conditions] 
[x | x <- [1..5], even x] == [2,4]


String can be defined as [Char] (list of Chars)


#################################################################################################################################































5- Show how new data types can be defined in Haskell. 
What is a type constructor and data constructor? Present an example of new data type in Haskell. 
Show how functions can pattern match on values of the new data type. When do we say that a function is total or partial? 
Present the definition of the list type in Haskell. Make the type an instance of a type class without deriving.

The arrow, (->), is the type constructor for functions in Haskell.
-- type constructors are used in type signature
-- data constructors are used in values 

-- data type-constructor = data-constructor
data MyMaybe a = Nothing | Just a        MyMaybe is type constructor and Nothing, Just is data constructor


-- total function   - is defined for all values
-- partial function - is not defined for all possible values


-- Partial function: not defined for all values.
myLookup :: Integer -> Char
myLookup 1 = 'a'
myLookup 2 = 'b'
myLookup n = undefined


-- Handling partiality with Maybe:
-- Total function: defined for all values.
myLookup' :: Integer -> Maybe Char
myLookup' 1 = Just 'a'
myLookup' 2 = Just 'b'
myLookup' n = Nothing













#################################################################################################################################


6- What is a recursive function? 
Define a recursive function over lists and explain its behavior using step-by-step evaluation. 
What is a base case? 
Present the three step principle of recursively solving a problem. 
Show how the order of function clauses affects the behavior of the function.



recursive function is a function that repeat it self
base case is the non recursive function that stops the recursion 

three principles are 
-- break down problem into sub-problems
-- solve the sub-problems recursively
-- combine all sub-problems solutions to solve the original problem


count 0  = []
count  n = n : count (n-1) 
-- count  0 = []  -- will run in infinite loop




1 + 2 infix
(+) 1 2 prefix
(+1) partial application currying




#################################################################################################################################




7- Present the three categories of types in Haskell. 
What is polymorphism and what kinds of polymorphism are supported in Haskell? Define a function for each kind of polymorphism. 
What makes a function polymorphic in Haskell? 
Demonstrate parametricity in Haskell. 
Present numeric literals in Haskell and their types. 
What operations can be used on a value given only the type class instances of its type but not the type itself?



-- Types in Haskell
1. Integral Type        Integer(limitless) --> Int(fixed precision)
2. Fractional Type      Float, Double, Rational scintefic
2. Functional Type      Integer -> Integer -> Integer


polymorphisims are like interfaces accept arguments and returns results of multiples type 

-- polymorphisim types
1. concerete               f :: Integer -> Integer
2. parametric              f :: a -> a
3. constraind              f :: Integer -> Integer




typeclasses : Num, Ord, Eq, Show







    




#################################################################################################################################





8- What is a higher order function? 
Define a higher order function in Haskell. 
Define the function composition operator in Haskell together with its type and demonstrate its use in an expression. 
Define map and filter. What is an anonymous function? What are sections in Haskell?

HOF takes functions as arguments or returns a function

(.)
ff :: [Int] -> Bool
ff = elem 2 `comp` reverse 

comp :: (b -> c) -> (a -> b) -> a -> c
comp      f            g       x  = f (g x)


anonymous functions are also called lambda 
\x -> x + 1

-- map (+1) [1,2] == [2,3] 
map p    []    = []
map p   (x:xs) = p x : map' p xs


filter' (==1) [1,2,3,1] == [1,1

filter' p [] = []
filter' p   (x:xs) 
    | p x = [x] ++ filter' p xs
    | otherwise = filter' p xs



Sections
refers to partial application of infix operators
(+1) 2 == 3


################################################################################################################################


























9- What does it mean to fold a list? 
What is the difference between folding from left and right? 
Define foldr with type declaration and demonstrate its use in an example. 
Define a recursive function over list using foldr. 
Define foldl with type declaration and demonstrate its use in an example.

folding a list, means apply default operator to multiple elements to get single results

folding from left 
foldl (-) 0 [1,2,3] == (((0 - 1) - 2) - 3) == -6


folding from right
foldr (-) 0 [1,2,3] == (1 - 2 - (3 - 0))) == 2


-- foldr' (-) 0 [1,2,3] == 2 
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr'        p     _def            []  =  _def
foldr'        p      _def  (x:xs)  = p x (foldr' p _def xs)





-- foldl' (-) 0 [1,2,3] == 6
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl'         p          _def   []       = _def
foldl'         p          _def  (x:xs)    = foldl' p (p _def x) xs


map with foldr



-}


