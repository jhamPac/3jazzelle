module Main where

import qualified Palindrome as P

main :: IO ()
main = 
    do 
        word <- getLine
        print $ verbose word

verbose :: String -> String
verbose word =
    case (P.isPalindrome word) of
        Nothing -> "Please enter a word"
        Just False -> "Sorry, " ++ word ++ " " ++ "is not a palindrome."
        Just True -> "Congrats " ++ word ++ " " ++ "is a palindrome!"