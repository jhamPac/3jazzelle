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

-- myMap :: (a -> a) -> [a] -> [a]
-- myMap fn [] = []
-- myMap fn (x:xs) = fn x : myMap fn xs

isPalindromeIgnoringCase :: String -> Bool
isPalindromeIgnoringCase word = 
    isPalindrome (allLowerCase word)

main :: IO ()
main = 
    do 
        word <- getLine
        print (isPalindromeIgnoringCase word)