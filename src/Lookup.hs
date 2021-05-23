module Lookup where

import qualified Data.Map as Map
import qualified Data.Either

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

locker :: Int -> LockerMap -> Either String Code
locker n ns = 
  case Map.lookup n ns of
     Nothing -> Left $ "Locker number " ++ show n ++ " does not exist!"
     Just (state, code) -> if state == Taken
                              then Left $ "Locker " ++ show n ++ " is already taken"
                              else Right code

lockers :: LockerMap
lockers = Map.fromList [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]