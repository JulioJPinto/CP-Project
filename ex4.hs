import Probability
import Cp
import List
import Data.List
import Data.Maybe

data Stop = S0 | S1 | S2 | S3 | S4 | S5 deriving (Show, Eq, Ord, Enum)
-- data Stop Int = S Int deriving (Show, Eq, Ord, Enum)
type Segment = (Stop, Stop)

type Delay = Int
type Dados = [(Segment, Delay)]
type Db = [(Segment, Dist Delay)]

-- funções fornecidas

dados :: [(Segment, Delay)]
dados = [((S0, S1), 0), ((S0, S1), 2), ((S0, S1), 0), ((S0, S1), 3), ((S0, S1), 3),
         ((S1, S2), 0), ((S1, S2), 2), ((S1, S2), 1), ((S1, S2), 1), ((S1, S2), 4),
         ((S2, S3), 2), ((S2, S3), 2), ((S2, S3), 4), ((S2, S3), 0), ((S2, S3), 5),
         ((S3, S4), 2), ((S3, S4), 3), ((S3, S4), 5), ((S3, S4), 2), ((S3, S4), 0),
         ((S4, S5), 0), ((S4, S5), 5), ((S4, S5), 0), ((S4, S5), 7), ((S4, S5), -1)]

mkf :: Eq a => [(a, b)] -> a -> Maybe b
mkf = flip Prelude.lookup

instantaneous :: Dist Delay
instantaneous = D [(0, 1)]

-- mkdist

msetplus :: Eq a => [a] -> ([(a, Int)],Int)
msetplus [] = ([],0)
msetplus (h:t) = (((h,c):(x)),y+c) 
    where (x,y) = msetplus rest
          (c,rest) = (1+ length (filter (h ==) t) , (filter (h /=)) t)

relativeFrequence :: (Eq b) => [b] -> [(b, Float)]
relativeFrequence l = map (id><(((/fromIntegral s).fromIntegral))) mset where (mset,s) = msetplus l

mkdist :: Eq a => [a] -> Dist a
mkdist = mkD . relativeFrequence

-- 

db :: [(Segment, Dist Delay)]
db = map (split (p1 . head) ((mkdist .(map p2)))) . groupBy (\x y -> p1 x == p1 y) $  dados

delay :: Segment -> Dist Delay
delay = (either (const instantaneous) id ).outMaybe.mkf db

ana_devide ::  (Stop ,Stop) -> [Segment]
ana_devide = anaList devide

cata_conquer :: [Segment] -> Dist Delay
cata_conquer = cataList conquer 

devide :: (Eq b, Enum b,Ord b) => (b, b) -> Either () ((b, b), (b, b))
devide (s,final) | s >= final = i1 ()
                 | otherwise  = i2 ((s,succ s),(succ s,final))

conquer :: Either a (Segment, Dist Delay) -> Dist Delay
conquer = (either (const instantaneous)  aux)
    where aux = uncurry (joinWith (+) . delay )

pdelay :: Stop -> Stop -> Dist Delay
pdelay = curry $ hyloList conquer devide