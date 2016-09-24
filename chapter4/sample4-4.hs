-- sample4-3.hs

import Data.Char (isDigit)

data Optional a = None | Some a


instance Functor Optional where
  fmap _ None = None
  fmap f (Some x) = Some (f x)

instance Applicative Optional where
  pure = Some
  None <*> _ = None
  (Some f) <*> o = fmap f o

instance Monad Optional where
  return = pure
  None >>= f = None
  (Some x) >>= f = f x


div' :: Int -> Int -> Optional Int
div' _ 0 = None
div' x y = Some (x`div`y)

-- 負の数は考えません
readInt' :: String -> Optional Int
readInt' str = if all isDigit str
                 then Some (read str)
                 else None

optional :: b -> (a -> b) -> Optional a -> b
optional n _ None = n
optional _ f (Some x) = f x

main = do
  ox <- readInt' <$> getLine :: IO (Optional Int)
  oy <- readInt' <$> getLine :: IO (Optional Int)
  let res = optional 
              "some error!"
              (\x -> "result = " ++ show x) 
                $ do
                  x <- ox
                  y <- oy
                  div' x y
  
  putStrLn res
