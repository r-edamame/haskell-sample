-- sample1-3.hs

main = do
  putStrLn "What's your name?"
  -- getLine というIOアクションを実行すると
  -- 標準入力から1行文字列を取得する
  -- その入力された文字列(IOアクションの中身)
  -- は <- を使って名前に束縛することができる
  name <- getLine
  -- 文字列は ++ で連結することができる
  putStrLn ("Hello " ++ name ++ "!")
