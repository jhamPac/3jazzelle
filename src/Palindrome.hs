import Data.Char

isPalindrome :: String -> Bool
isPalindrome word = 
    word == reverse word

isEmptyWord :: String -> Maybe Bool
isEmptyWord word = 
    case word of 
        "" -> Nothing
        _ -> Just (isPalindrome word)

verbose :: String -> String
verbose word =
    case (isEmptyWord word) of
        Nothing -> "Please enter a word"
        Just False -> "Sorry, this is not a palindrome"
        Just True -> "Palindrome for sure!"

allLowerCase :: String -> String
allLowerCase = map toLower

-- myMap :: (a -> a) -> [a] -> [b]
-- myMap fn [] = []
-- myMap fn (x:xs) = fn x : myMap fn xs

ignoreCase :: String -> Bool
ignoreCase word = 
    isPalindrome (allLowerCase word)

removeSpaces :: String -> String
removeSpaces phrase =
    case phrase of
        [] -> []
        (' ':xs) -> removeSpaces xs
        (x:xs) -> x : removeSpaces xs

sanitizeForPalinDrome :: String -> String
sanitizeForPalinDrome = filter (\x -> not (isSpace x)) . allLowerCase

main :: IO ()
main = 
    do 
        word <- getLine
        print (isPalindrome $ sanitizeForPalinDrome word)