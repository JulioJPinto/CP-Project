import Cp
import Nat

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
          next_q' = (((3*m1)-(3*m2)+m3 , m1 ), m2) where ((m1 ,m2 ),m3) = prev_q
start x = (x,(x,q 0,x**2))
