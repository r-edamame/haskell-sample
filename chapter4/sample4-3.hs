-- sample4-3.hs

import Data.Char (isDigit)

data Optional a = None | Some a

div' :: Int -> Int -> Optional Int
div' _ 0 = None
div' x y = Some (x`div`y)

readInt' :: String -> Optional Int
readInt' str = if all isDigit str
                 then Some (read str)
                 else None

optional :: b -> (a -> b) -> Optional a -> b
optional n _ None = n
optional _ f (Some x) = f x

main = do
  x <- read <$> getLine :: IO Int
  y <- read <$> getLine :: IO Int
  let res = optional 
              "0 divide error!"
              (\x -> "result = " ++ show x) 
              (div' x y)
  putStrLn res
