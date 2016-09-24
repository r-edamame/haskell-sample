-- sample1-5.hs

main = do
  line <- getLine
  -- reverse関数で文字列(リスト)の反転ができる
  putStrLn (reverse line)
