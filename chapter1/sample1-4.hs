-- sample1-4.hs

main = do
  putStrLn "What's your name?"
  name <- getLine
  -- 文字列(文字のリスト)に対してlength関数を
  -- 適用するとその長さを取得できる
  -- showは値(Int)を文字列(String)に変換する関数
  putStrLn ("Length of your name is " ++ show (length name) ++ ".")
