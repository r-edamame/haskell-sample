-- sample2-5.hs

-- 値が一つのリストの最大値はその一つの値
maximum' [x] = x
-- それ以外(値が二つ以上)のリストでの最大値は
maximum' (x:xs) =
  -- もし先頭の値xがそれ以降の値xsの最大値mよりも
  if x > m
    -- 大きければx
    then x
    -- そうでなければm
    else m
  -- where句でこの関数の中でのみ使える変数を定義する
  where
    -- 先頭以外の要素xsの最大値m
    m = maximum' xs


main = do
  line <- getLine
  -- 入力lineを空白区切りで分けたものに対して
  -- それぞれread関数(文字から別の型の値へ変換する関数)
  -- を適用する
  let nums = map read ( words line ) :: [Int]
  -- 与えられた数値のリストの中から一番大きい値を出力
  print (maximum' nums)
