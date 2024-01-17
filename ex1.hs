import Data.List
import Cp
import Nat
import List

-- aux
reverse_pf :: [a] -> [a]
reverse_pf = cataList reverse_gen

reverse_gen :: Either () (a2, [a2]) -> [a2]
reverse_gen = either nil (conc.swap.(singl >< id))


-- transpose_pf:: [[a]]->[[a]]
-- transpose_pf ([]:_) = nil ()

-- transpose_pf = inList . (id -|- (id >< transpose_pf).(split (map head) (map tail))) . (id -|- cons) . outList
out [] = i1 ()
out l = i2 l

transpose_ana = anaList transpose_gen

transpose_gen :: [[a1]] -> Either () ([a1], [[a1]])
transpose_gen ([]:_) = i1 ()
transpose_gen [] = i1 ()
transpose_gen l = i2 ((map head l),(map tail l))  

rotate = hyloList reverse_gen transpose_gen

-- pointwise
ex1pw :: [[a]] -> [a]
ex1pw [] = []
ex1pw (h:t) = h ++ ex1pw(reverse (transpose t))


-- pointfree 
matrot = hyloList cata_gen ana_gen
    where cata_gen = (either nil conc)
          ana_gen = recList (rotate) . outList