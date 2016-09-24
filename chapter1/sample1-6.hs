-- sample1-6.hs

main = do
  putStrLn "put any sentence."
  s <- getLine
  -- words関数を使うと文字列を空白毎に区切った
  -- 文字列のリストを生成できる
  -- (words "a bb ccc") == ["a", "bb", "ccc"]
  putStrLn ("word count = " ++ show (length (words s) ) )
