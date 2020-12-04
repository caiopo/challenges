import Data.List.Split ( splitOn )

data Password = Password {
    min :: Int,
    max :: Int,
    letter :: Char,
    content :: String
} deriving Show


parseLine :: String -> Password
parseLine line =
    Password {
        min = read _min,
        max = read _max,
        letter = _leter,
        content = _content
    }
    where
        [prefix, _content] = splitOn ": " line
        [numbers, _letter] = splitOn " " prefix
        [_min, _max] = splitOn "-" prefix

main :: IO ()
main = do 
    input <- readFile "inputs/day02.txt"
    let passwords = map parseLine $ lines input
    print passwords

