import Cp
import Nat

-- h i = (2*i+1)*(2 * i)
-- ex3_1 x 0 = (x,x,1,x**2)
-- ex3_1 x i = (l+ (a/b),a,b,x_squared ) where (l,a,b,x_squared) =  (l,(x_squared * x_) , (h i)* y_ ,x_squared)  where (l,x_,y_,x_squared) = ex3_1 x (i-1) 

-- ex3_2 :: (Num a) => a -> a -> (a, a)
-- init x = split (const x) (const x) 
-- init x = (x,x)
-- ex3_2 x = (either init x (split id id) ).outNat-- soma,atual

ex3 x = p1 . for loop init' where
    loop (acc,(prev,k)) = (acc+next,(next,succ(k))) where next = prev*(x**2) / ((2*k+2)*(2*k+3))
    init' = (x,(x,0))

-- ex3_2 x i = (acc+prox*prev,prox*prev)
--             where (acc,prox,prev) = (acc,(x**2) / ((2*i+1)*(2 * i)),prev)  where (acc,prev) = (ex3_2 x (i-1) )


-- ex3_3 x 0 = (x,x) -- soma,atual
-- ex3_3 x i = (add(acc,mul(prox,prev)),mul(prox,prev)) 
--     where (acc,(prox,prev)) = (split p1 (split (const((x**2) / ((2*i+1)*(2 * i)))) p2)) . (ex3_3 x (i-1))

