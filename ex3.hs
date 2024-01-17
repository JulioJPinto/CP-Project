import Cp
import Nat

-- h i = (2*i+1)*(2 * i)
-- ex3_1 x 0 = (x,x,1,x**2)
-- ex3_1 x i = (l+ (a/b),a,b,x_squared ) where (l,a,b,x_squared) =  (l,(x_squared * x_) , (h i)* y_ ,x_squared)  where (l,x_,y_,x_squared) = ex3_1 x (i-1) 

-- ex3_2 :: (Num a) => a -> a -> (a, a)
-- init x = split (const x) (const x) 
-- init x = (x,x)
-- ex3_2 x = (either init x (split id id) ).outNat-- soma,atual

-- ex3 x = p1 . for loop init' where
--     loop (acc,(prev,k)) = (acc+next,(next,succ(k))) where next = prev*(x**2) / ((2*k+2)*(2*k+3))
--     init' = (x,(x,0))
q :: Int -> ((Integer,Integer),Integer)
q 0 = ((20,6),0)
q n = next_q (q (n-1))

next_q :: ((Integer,Integer),Integer) -> ((Integer,Integer),Integer)
next_q  ((m1 ,m2 ),m3) = (((3*m1)-(3*m2)+m3 , m1 ), m2) 

ex3 :: (Floating p) =>  p -> Int -> p
ex3 x = wrapper . worker 
    where wrapper = p1 
          worker = for loop (start x) 

loop (acc,(prev,prev_q,x_squared)) = (acc + next,(next,(next_q' ),x_squared))
    where next = prev * x_squared / fromInteger (p2 next_q')
          next_q' = next_q prev_q
start x = (x,(x,q 0,x**2))

-- ex3_2 x i = (acc+prox*prev,prox*prev)
--             where (acc,prox,prev) = (acc,(x**2) / ((2*i+1)*(2 * i)),prev)  where (acc,prev) = (ex3_2 x (i-1) )


-- ex3_3 x 0 = (x,x) -- soma,atual
-- ex3_3 x i = (add(acc,mul(prox,prev)),mul(prox,prev)) 
--     where (acc,(prox,prev)) = (split p1 (split (const((x**2) / ((2*i+1)*(2 * i)))) p2)) . (ex3_3 x (i-1))

