import Data.List
import Cp
import Nat
import List

-- pointwise
ex1 :: [[a]] -> [a]
ex1 [] = []
ex1 (h:t) = h ++ ex1(reverse (transpose t))

-- ex1 (h:t) = h ++ ex1(transpose (map (reverse) t))

-- pointfree 
ex1f = (either nil conc) . recList (ex1f . reverse . transpose ) . outList