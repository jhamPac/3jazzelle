module Palindrome where

import Data.Char

isPalindrome :: String -> Bool
isPalindrome word = 
    word == reverse word

isEmptyWord :: String -> Maybe Bool
isEmptyWord word = 
    case word of 
        "" -> Nothing
        _ -> Just (isPalindrome word)

allLowerCase :: String -> String
allLowerCase = map toLower

sanitize :: String -> String
sanitize = filter (\x -> not (isSpace x)) . allLowerCase