import Data.List
import Cp
import Nat
import List

ex1 :: [[a]] -> [a]
ex1 [] = []
ex1 (h:t) = h ++ ex1(transpose (map (reverse) t))

ex1f = (either nil conc) . recList (ex1f . transpose . (map reverse)) . outList