-- sample4-5.hs

import Data.Char

{-
 - 計算失敗の状態を持つだけのMaybeとは別に，
 - Eitherという失敗時の情報を持つことができるデータ型もある．
 - Either String Int のようにEither (失敗時の情報の型) (正常時の値)
 - 
 -}

div'' :: Int -> Int -> Either String Int
div'' _ 0 = Left "0 divided error!"
div'' x y = Right (x`div`y)

readInt'' :: String -> Either String Int
readInt'' str = if all isDigit str
                  then Right (read str)
                  else Left "parse error"

main = do
  ex <- readInt'' <$> getLine :: IO (Either String Int)
  ey <- readInt'' <$> getLine :: IO (Either String Int)
  let res = either
              id  
              (\x -> "result = " ++ show x)
              $ do
                -- Either String Int のIntの部分を
                -- 取り出す
                -- この時もしexが(Left _)のときは
                -- その値がこのdo文の最後まで伝播する
                x <- ex
                y <- ey
                -- ex,eyから取り出した整数の商を求める
                -- もしexかeyが(Left _)のときはこの計算は行われず
                -- Left "parse error"というreadInt''の失敗の結果
                -- が返る
                -- またyが0のときこの計算はLeft "0 divided error!"
                -- を返す
                div'' x y
  putStrLn res
