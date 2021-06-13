import Palindrome as P

main :: IO ()
main = 
    do 
        word <- getLine
        print (P.isPalindrome $ sanitize word)

-- verbose :: String -> String
-- verbose word =
--     case (P.isPalindrome word) of
--         Nothing -> "Please enter a word"
--         Just False -> "Sorry, this is not a palindrome"
--         Just True -> "Palindrome for sure!"