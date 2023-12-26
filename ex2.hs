import Data.List
import Data.Maybe
import Distribution.Simple.Utils
import Cp
import Nat
import List
-- Utils ---------------------------

-- isVowel
isVowel :: Char -> Bool
isVowel a = elem a "aeiouAEIOU"

-- isPar
isPar :: Int -> Bool
isPar a = (mod a 2) == 0

-- replaceWhen
replaceWhen :: (a -> Bool) -> [a] -> [a] -> [a]
replaceWhen _ l1 [] = l1
replaceWhen f l1@(h1:t1) l2@(h2:t2) = 
    if f h1 then
        h2:(replaceWhen f t1 t2) 
    else 
        h1:(replaceWhen f t1 l2)

-- replaceWhen touples
replaceWhent :: (a -> Bool) -> ([a], [a]) -> [a]
replaceWhent _ (l1, []) = l1
replaceWhent f (h1:t1, h2:t2) = 
    if f h1 then
        h2:(replaceWhent f (t1, t2)) 
    else 
        h1:(replaceWhent f (t1, h2:t2))

--pointfree replacewhen touples
replaceWhent :: (a -> Bool) -> ([a], [a]) -> [a]
(replaceWhent f ) . (id >< nil)  = p1
(replaceWhent f) . (cons >< cons) = cond (f . p1 . p1) (cons . ((p1 . p2) >< ((replaceWhent f) . ((p2 . p1) >< (p2 . p2))))) (cons . ((p1 . p1) >< ((replaceWhent f) . ((p2 . p1) >< p2))))



-- End Utils -----------------------

ex2 :: (a -> Bool) -> [a] -> [a]
ex2 _ [] = []
ex2 f l = replaceWhen f l ((reverse . (filter f)) l1)
    where l1 = (p2 . dup) l


-- pointfree 
ex2f f = (uncurry(replaceWhen f)) . (split id (reverse . (filter f)))

ex2ff = curry(uncurry(replaceWhent) . (split p1 (split p2 reverseaux)))
    where 
        reverseaux = (reverse. uncurry(filter))