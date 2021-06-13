module Palindrome where

import Data.Char

isEmptyWord :: String -> Maybe String
isEmptyWord word = 
    case word of 
        [] -> Nothing
        _ -> Just word

allLowerCase :: String -> String
allLowerCase = map toLower

isOwnReverse :: Maybe String -> Maybe Bool
isOwnReverse s = 
    case s of
        Nothing -> Just False
        Just s -> Just (s == reverse s)

isPalindrome :: String -> Maybe Bool
isPalindrome = isOwnReverse . isEmptyWord . filter (\x -> not (isSpace x)) . allLowerCase