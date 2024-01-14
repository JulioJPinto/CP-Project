import Data.List
import Data.Maybe
import Distribution.Simple.Utils
import Cp
import Nat
import List

-- isVowel
isVowel :: Char -> Bool
isVowel a = elem a "aeiouAEIOU"

-- isPar
isPar :: Int -> Bool
isPar a = (mod a 2) == 0

-- -- replaceWhen
replaceWhen :: (a -> Bool) -> [a] -> [a] -> [a]
replaceWhen f (h1:t1) l2@(h2:t2) = 
    if f h1 then
        h2:(replaceWhen f t1 t2) 
    else 
        h1:(replaceWhen f t1 l2)
replaceWhen _ l1 _ = l1

-- replaceWhen uncurried
replaceWhent :: (a -> Bool) -> ([a], [a]) -> [a]
replaceWhent f (h1:t1, h2:t2) = 
    if f h1 then
        h2:(replaceWhent f (t1, t2)) 
    else 
        h1:(replaceWhent f (t1, h2:t2))
replaceWhent _ (l1, _) = l1

rW :: (a -> Bool) -> ([a],[a]) -> [a]
rW f = (either g h) . alpha
    where alpha = coassocr.(distr-|-distr).distl.(coswap><coswap).(outList><outList)
          g = cons.(cond (f.p1.p1) true' false') -- .(rW f .p2 >< p2)  
          true' =  (split (p1.p2) ((rW f).(split (p2.p1) (p2.p2))))
          false' = (split (p1.p1) ((rW f).(split (p2.p1) (cons.(split (p1.p2) (p2.p2))))))
          h = inList . either (i2.p1) (either (i1.p1) (i1.p1))

-- End Utils -----------------------

ex2pw :: (a -> Bool) -> [a] -> [a]
ex2pw _ [] = []
ex2pw f l = replaceWhen f l ((reverse . (filter f)) l1)
    where l1 = (p2 . dup) l

-- pointfree 
ex2 f = (rW f) . (split id (reverse . (filter f)))

ex2ff = curry(uncurry(rW) . (split p1 (split p2 reverseaux)))
    where 
        reverseaux = (reverse. uncurry(filter))