letterValue c =
    if c `elem` ['T', 'D', 'L', 'F'] then 2 else 1

kamil word =
    product $ map letterValue word

process _ = do
    str <- getLine
    print $ kamil str

main = do
    mapM process [0..9]
