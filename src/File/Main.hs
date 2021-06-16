import System.IO

main :: IO ()

main = 
    withFile "greetings.txt" WriteMode $ \h ->
        do
            hPutStrLn h "HELLO"
            hPutStrLn h "IN ALL CAPS"