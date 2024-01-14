import Probability
import Cp
import List
import Data.List
import Data.Maybe


data Stop = S0 | S1 | S2 | S3 | S4 | S5 deriving (Show, Eq, Ord, Enum)
type Segment = (Stop, Stop)

-- dados :: [(Segment, Delay)]
-- db :: [(Segment, Dist Delay)]
-- mkdist :: Eq a ⇒ [a] → Dist a
-- pdelay :: Stop → Stop → Dist Delay

type Delay = Int
type Dados = [(Segment, Delay)]
type Db = [(Segment, Dist Delay)]

-- mkDist :: Eq a => [a] -> Dist a
-- mkDist = uniform --faz a distribuição uniforme dos dados

dados :: [(Segment, Delay)]
dados = [((S0, S1), 0), ((S0, S1), 2), ((S0, S1), 0), ((S0, S1), 3), ((S0, S1), 3),
         ((S1, S2), 0), ((S1, S2), 2), ((S1, S2), 1), ((S1, S2), 1), ((S1, S2), 4),
         ((S2, S3), 2), ((S2, S3), 2), ((S2, S3), 4), ((S2, S3), 0), ((S2, S3), 5),
         ((S3, S4), 2), ((S3, S4), 3), ((S3, S4), 5), ((S3, S4), 2), ((S3, S4), 0),
         ((S4, S5), 0), ((S4, S5), 5), ((S4, S5), 0), ((S4, S5), 7), ((S4, S5), -1)]

mkDB :: Eq a => [(a, b)] -> [(a, Dist b)]
mkDB = map (split (p1 . head) (uniform . map p2)) . groupBy (\x y -> p1 x == p1 y)

hashT = mkDB dados 

delay :: Segment -> Dist Delay
delay = fromJust . uncurry(List.lookup) . (split id conshashT)  