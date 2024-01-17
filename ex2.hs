import Cp
import List

-- isVowel
isVowel :: Char -> Bool
isVowel a = elem a "aeiouAEIOU"

-- isPar
isPar :: Int -> Bool
isPar a = (mod a 2) == 0

-- replaceWhen
replaceWhen :: (a -> Bool) -> ([a] ,[a]) -> [a]
replaceWhen f ((h1:t1) ,l2@(h2:t2)) = 
    if f h1 then
        h2:(replaceWhen f (t1,t2)) 
    else 
        h1:(replaceWhen f (t1,l2))
replaceWhen _ (l1,_) = l1

replaceWhen_pointFree1 :: (a -> Bool) -> ([a],[a]) -> [a]
replaceWhen_pointFree1 f = (either g h) . alpha
    where alpha = coassocr.(distr-|-distr).distl.(coswap><coswap).(outList><outList)
          g = cons.(cond (f.p1.p1) true' false')  
          true' =  (split (p1.p2) ((replaceWhen_pointFree1 f).(split (p2.p1) (p2.p2))))
          false' = (split (p1.p1) ((replaceWhen_pointFree1 f).(split (p2.p1) (cons.(split (p1.p2) (p2.p2))))))
          h = inList . either (i2.p1) (either (i1.p1) (i1.p1))

-- Functor dos pares de listas

type ListPair a  = ([a] , [a])

outListPair :: ListPair a -> Either [a] (a, ListPair a) -- A* x A'* -> A'* + (Ax(A*xA'*))
outListPair ([],l) = Left l
outListPair ((h:t),l) = Right (h,(t,l))

inListPair :: Either [a] (a, ListPair a) -> ListPair a
inListPair = either (split (const []) id) ((cons >< id). assocl)

recListPair :: (ListPair a -> ListPair c) -> Either [a] (a, ListPair a) -> Either [a] (a , ListPair c)
recListPair  f = id -|- id >< f

anaListPair f = inListPair . recListPair (anaListPair f) . f

cataListPair g   = g . recListPair (cataListPair g) . outListPair   

hyloListPair f g = cataListPair f . anaListPair g

-- ReplaceWhen usando o functor dos pares de listas

replaceWhen_ana_aux :: (a -> Bool) -> ([a], [a]) -> ([a], [a])
replaceWhen_ana_aux f = anaListPair ((id -|- (aux_)) . outListPair)
    where aux_ (a, (as, (b:bs))) = if  f a then (b,(as,bs)) else (a, (as, b:bs))
          aux_ _ = error "lista B mais pequena que lista A"

replaceWhen_ana :: (a -> Bool) -> ([a], [a]) -> [a]
replaceWhen_ana f  = (p1 . replaceWhen_ana_aux f)

-- Solução que usa a replaceWhen

reverseByPredicate_pointWise :: (a -> Bool) -> [a] -> [a]
reverseByPredicate_pointWise _ [] = []
reverseByPredicate_pointWise f l = replaceWhen f (l ,(reverse $ filter f l) )

reverseByPredicate_pointFree :: (a -> Bool) -> [a] -> [a]
reverseByPredicate_pointFree f = (replaceWhen f) . split id (reverse. (filter f))

-- Solução num loop apenas

splitOn :: (a -> Bool) -> [a] -> (a,[a])
splitOn _ [x] = (x,[])
splitOn f (h:t) = if f h then (h,t) else (left,right) where (left,right) = splitOn f t
splitOn _ _ = error "Lista vazia"

replaceWhenReversed :: (a -> Bool) -> ([a], [a]) -> ([a], [a])
replaceWhenReversed f = cataListPair gene
    where
        gene = inListPair . (id -|- (cond (f.p1) aux  id ) )  
        aux (_,(y,z)) = (h,(y,t)) where (h,t) = splitOn f z

reverseByPredicate :: (a -> Bool) -> [a] -> [a]
reverseByPredicate g = p1.(replaceWhenReversed g).dup 

-- End Utils -----------------------
