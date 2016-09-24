-- sample3-2.hs

import Control.Monad

dictionary :: [(String,String)]
dictionary = [("りんご","apple"), ("本","book"), ("犬","dog")]


main = do
  forM_ dictionary $
    -- このラムダ式の型は (String,String) -> IO ()
    -- do構文は複数のIOアクションをひとまとめにする
    -- ための構文なのでこういう風にもかける
    \(jp,en) -> do
      putStrLn $ jp ++ " は英語で？"
      -- 回答を受け付ける
      ans <- getLine
      if ans == en
        then putStrLn "正解です"
        else putStrLn "不正解です"

