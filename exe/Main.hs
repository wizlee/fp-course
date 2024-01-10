main :: IO ()
main = welcome

welcome :: IO ()
welcome = print "Welcome to the Seek Haskell Course, 2023!"

askName :: IO ()
askName = do
    print "What is your name?"
    name <- getLine
    print $ "Hello, " ++ name ++ "!"