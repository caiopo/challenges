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


countLetter :: Char -> String -> Int
countLetter letter string = length $ filter (== letter) string


validatePassword1 :: Password -> Bool
validatePassword1 password =
    minRepeats password <= count && count <= maxRepeats password
    where
        count = countLetter (letter password) (content password)


validatePassword2 :: Password -> Bool
validatePassword2 password =
    _letter == letter1 && _letter /= letter2 || _letter /= letter1 && _letter == letter2
    where
        _content = content password
        _letter = letter password
        letter1 = _content !! (minRepeats password - 1)
        letter2 = _content !! (maxRepeats password - 1)


main :: IO ()
main = do 
    input <- readFile "inputs/day02.txt"
    let passwords = map parseLine $ lines input
    print $ length $ filter validatePassword1 passwords
    print $ length $ filter validatePassword2 passwords

