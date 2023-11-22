import Data.List
import Cp
import Nat
import List

-- pointwise 
isVowel :: Char -> Bool
isVowel a = elem a "aeiouAEIOU"

replaceWhen :: (a -> Bool) -> [a] -> [a] -> [a]
replaceWhen _ l1 [] = l1
replaceWhen f l1@(h1:t1) l2@(h2:t2) = 
    if f h1 == True then
        h2:(replaceWhen f t1 t2) 
    else 
        h1:(replaceWhen f t1 l2)

ex2 :: (a -> Bool) -> [a] -> [a]
ex2 _ [] = []
ex2 f l = replaceWhen f l ((reverse . (filter f)) l1)
    where l1 = (p2 . dup) l

-- pointfree 
-- replaceWhenf f = A DEFINIR

ex2f f = (uncurry(replaceWhen f)) . (split id (reverse . (filter f) . id))