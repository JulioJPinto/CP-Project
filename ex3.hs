import Cp
import Nat




h i = (2*i+1)*(2 * i)
ex3_1 x 0 = (x,x,1,x**2)
ex3_1 x i = (l+ (a/b),a,b,x_squared ) where (l,a,b,x_squared) =  (l,(x_squared * x_) , (h i)* y_ ,x_squared)  where (l,x_,y_,x_squared) = ex3_1 x (i-1) 

ex3_2 x 0 = (x,x) -- soma,atual
ex3_2 x i = (acc+prox*prev,prox*prev)
            where (acc,prox,prev) = (acc,(x**2) / ((2*i+1)*(2 * i)),prev)  where (acc,prev) = ex3_2 x (i-1) 


ex3_3 x 0 = (x,x) -- soma,atual
ex3_3 x i = (acc+prox*prev,prox*prev)
            where (acc,prox,prev) = (acc,(x**2) / ((2*i+1)*(2 * i)),prev)  where (acc,prev) = ex3_2 x (i-1) 


-- vezes = (uncurry (*))
-- ex3_3 x 0 = (x,((x,1),x**2))
-- ex3_3 x i = (l+ (a/b),((a,b),x_squared ))
--     where
--         (l,((a,b),x_squared)) =  (id >< split( (vezes(x_squared, x_) , vezes((h i),y_) ) >< p2 ) ) where (l,((x_,y_),x_squared)) =  ex3_2 x (i-1) 