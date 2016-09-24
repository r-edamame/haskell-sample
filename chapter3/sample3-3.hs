-- sample3-3.hs

import Control.Monad

dictionary :: [(String,String)]
dictionary = [("りんご","apple"), ("本","book"), ("犬","dog")]

-- 問題を出すアクションをmainから分離する
-- このアクションでは問題を回答させた後
-- それぞれ正解したかどうか(True,False)
-- のリストを返すアクション
quiz :: [(String,String)] -> IO [Bool]
-- forM の型は [a] -> (a -> IO b) -> IO [b]
-- となり要素のそれぞれに関して実行されるアクション
-- の結果bの集合をリストとして返す
-- ここではforMの第2引数であるラムダ式の型は
-- (String,String) -> IO Bool であり
-- 正解のときTrue,不正解のときFalseを返すアクション
-- となるので結果としてBool型のリストを返すアクションとなる
quiz dic = forM dic $ 
  \(jp,en) -> do
    putStrLn $ jp ++ " は英語で?"
    ans <- getLine
    if ans == en
      then do
        -- 正解した時はTrueを返す
        putStrLn "正解です\n"
        -- return関数はあるaの型の値を(IO a)型に
        -- 変換する (a -> IO a)
        -- do構文では最後に実行されるアクションが
        -- その式の結果となるので
        -- この(return True :: IO Bool)という値が
        -- このラムダ式の結果となる
        return True
      else do
        -- 不正解のときはFalseを返す
        putStrLn "不正解です\n"
        return False

main = do
  -- 辞書[(String,String)]から問題を出題する
  -- アクションquizを実行して
  -- その回答結果((T/F)のリスト)をresに束縛
  res <- quiz dictionary
  -- resは正誤(T/F)のリストである
  -- そこから正答数を求めるために
  -- 1. 正誤(T/F)のリストから正答(True)だけを取り出したリスト
  --    を生成する (filter (==True))
  -- 2. 1で生成されたTrueのリストの長さを求める (length)
  -- この二つの関数を合成(.) したものに res を適用する($)
  let correct = length . filter (==True) $ res
  putStrLn $ "正解数は " ++ show correct ++ "問 です"
