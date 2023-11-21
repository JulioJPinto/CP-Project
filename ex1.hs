import Data.List
import Cp
import Nat
import List

ex1 :: [[a]] -> [a]
ex1 [] = []
ex1 (h:t) = h ++ ex1(transpose (map (reverse) t))