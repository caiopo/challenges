import Data.List.Split ( splitOn )

data Password = Password {
    minRepeats :: Int,
    maxRepeats :: Int,
    letter :: Char,
    content :: String
} deriving Show


parseLine :: String -> Password
parseLine line =
    Password {
        minRepeats = read _min,
        maxRepeats = read _max,
        letter = head _letter,
        content = _content
    }
    where
        [prefix, _content] = splitOn ": " line
        [numbers, _letter] = splitOn " " prefix
        [_min, _max] = splitOn "-" numbers

main :: IO ()
main = do 
    input <- readFile "inputs/day02.txt"
    let passwords = map parseLine $ lines input
    print passwords

