import Data.List
import Cp
import Nat
import List

-- pointwise
ex1pw :: [[a]] -> [a]
ex1pw [] = []
ex1pw (h:t) = h ++ ex1(reverse (transpose t))

-- pointfree 
ex1 = (either nil conc) . recList (ex1 . reverse . transpose ) . outList