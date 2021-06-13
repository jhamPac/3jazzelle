isPalindrome :: String -> Bool
isPalindrome word = 
    word == reverse word

isEmptyWord :: String -> Maybe Bool
isEmptyWord word = 
    case word of 
        "" -> Nothing
        _ -> Just (isPalindrome word)

main :: IO ()
main = 
    do 
        word <- getLine
        print (isEmptyWord word)