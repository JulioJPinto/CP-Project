import Cp
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




out' = distl.(outList >< id)
out'' :: ([a], [a]) -> Either [a] (a, ([a], [a])) -- A* x A'* -> A'* + (Ax(A*xA'*))

in'' :: Either [a] (a, ([a], [a])) -> ([a], [a])
in' = (inList >< id).undistl




out_ ([],l) = Left l
out_ ((h:t),l) = Right (h,(t,l))

funct''  f = id -|- id >< f


splitOn :: ( a->Bool) -> [a] -> (a,[a])
splitOn _ [x] = (x,[])
splitOn f (h:t) = if f h then (h,t) else (left,right) where (left,right) = splitOn f t
splitOn _ _ = undefined

func f = in'' . (funct'' (func f)) . (id -|- ((cond (f.p1) (aux f) id ))) . out''
aux f = split (p1.(splitOn f).p2.p2) (split (p1.p2) (p2.(splitOn f).p2.p2))

func_ f = in'' . (funct'' (func_ f)) . (id -|- ((cond (f.p1) aux id ))) . out''
    where aux (_,(y,z)) = (h,(y,t)) where (h,t) = splitOn f z


res_com_um_loop g = p1.(func g).dup 


-- rw :: (a -> Bool) -> ([a], [a']) -> ([a],[a'])
rw f = in''.(id -|- ((cond (f.p1) aux id ))) . funct'' (rw f).  out''
    where aux = (split  (p1.(splitOn f).p2.p2) (split (p1.p2) (p2.(splitOn f).p2.p2)))

res f = p1. rw f . dup -- (split id (filter f))



in'' = either (split (const []) id) ((cons >< id). assocl)

out'' = (p2 -|- assocr).distl.(outList >< id)

ana'' f = in'' . funct'' (ana'' f) . f

rw' f = ana'' ((id -|- (aux)) . out'')
    where aux (a, (as, (b:bs))) = if  f a then (b,(as,bs)) else (a, (as, b:bs))
          aux _ = error "lista B mais pequena que lista A"
                             
ex2 f = (rw' f) . (split id (reverse . (filter f)))


-- End Utils -----------------------

ex2pw :: (a -> Bool) -> [a] -> [a]
ex2pw _ [] = []
ex2pw f l = replaceWhen f l ((reverse . (filter f)) l1)
    where l1 = (p2 . dup) l

-- pointfree 

ex2ff = curry(uncurry(rw') . (split p1 (split p2 reverseaux)))
    where 
        reverseaux = (reverse. uncurry(filter))


