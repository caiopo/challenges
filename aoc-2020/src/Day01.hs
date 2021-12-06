import qualified Data.Set as Set
import Data.List ( find )

target :: Int
target = 2020

findTwoProduct :: [Int] -> Int
findTwoProduct values = 
    first * (target - first)
    where 
        set = Set.fromList $ map (target -) values
        Just first = find (`Set.member` set) values

findThreeProduct :: [Int] -> Int
findThreeProduct values = 
    snd first
    where
        products = [(a+b+c, a*b*c) | a <- values, b <- values, c <- values]
        Just first = find  ((==) target . fst) products

main :: IO ()
main = do 
    input <- readFile "inputs/day01.txt"
    let values = map (\v -> read v :: Int) $ lines input
    print $ findTwoProduct values
    print $ findThreeProduct values
