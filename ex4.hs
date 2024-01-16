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

dados :: [(Segment, Delay)]
dados = [((S0, S1), 0), ((S0, S1), 2), ((S0, S1), 0), ((S0, S1), 3), ((S0, S1), 3),
         ((S1, S2), 0), ((S1, S2), 2), ((S1, S2), 1), ((S1, S2), 1), ((S1, S2), 4),
         ((S2, S3), 2), ((S2, S3), 2), ((S2, S3), 4), ((S2, S3), 0), ((S2, S3), 5),
         ((S3, S4), 2), ((S3, S4), 3), ((S3, S4), 5), ((S3, S4), 2), ((S3, S4), 0),
         ((S4, S5), 0), ((S4, S5), 5), ((S4, S5), 0), ((S4, S5), 7), ((S4, S5), -1)]


-- mkdist :: Eq a => [a] -> Dist a
-- mkdist = scale 
-- mSet ::  [a] -> [(a,Int)]
mSet :: Eq a => [a] -> ([(a, Int)],Int)
mSet [] = ([],0)
mSet (h:t) = (((h,c):(x)),y+c) 
    where (x,y) = mSet rest
          (c,rest) = (1+ length (filter (h ==) t) , (filter (h /=)) t)

    -- where (c,rest) = (split (succ.length.(filter (h ==))) (filter (h /=))) t 

-- func :: Eq a => [a] -> ([(a, Int)], ([a], [Int]))
relativeFrequence :: (Eq b) => [b] -> [(b, Float)]
relativeFrequence l = map (id><(((/fromIntegral s).fromIntegral))) mset where (mset,s) = mSet l

mkDist :: Eq a => [a] -> Dist a
mkDist = (mkD.relativeFrequence)

mkDB :: [(Segment, Delay)] -> [(Segment, Dist Delay)]
mkDB = map (split (p1 . head) ((mkDist .(map p2)))) . groupBy (\x y -> p1 x == p1 y)

hashT :: [(Segment, Dist Delay)]
hashT  = mkDB dados

delay :: Segment -> Dist Delay
delay = fromJust . uncurry List.lookup . split id (const hashT)

path :: Stop -> Stop -> [Segment]
path s1 s2 = [(s,succ s) | s <- [s1 .. pred s2]]

unit :: Dist Delay
unit = mkD [(0,1)]

lDelay :: [Segment] -> Dist Delay
lDelay (h:t) = (joinWith (+) (lDelay (t)) . delay ) h
lDelay _ = unit

f :: [Segment] -> Dist Delay
f = cataList (either (const unit)  aux)
    where aux = uncurry (joinWith (+)).(delay >< id )

pdelay :: Stop -> Stop -> Dist Delay
pdelay = curry $ f.(uncurry path)