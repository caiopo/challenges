import qualified Data.Set as Set
import Data.List ( find )

target :: Int
target = 2020

findProduct :: [Int] -> Int
findProduct values = 
    first * (target - first)
    where 
        set = Set.fromList $ map (target -) values
        Just first = find (`Set.member` set) values

main :: IO ()
main = do 
    input <- readFile "inputs/day011.txt"
    print $ findProduct $ map (\v -> read v :: Int) $ lines input
