-- sample4-2.hs

-- 値コンストラクタは値を持つことができる
-- Circle 10 とすることで
-- Circle型 の Circle 10aという値を生成できる
-- また型コンストラクタが型引数を持つことで
-- 型コンストラクタが多相的な型を持てる
-- Circle (3 :: Int) とするとその型は Circle Intとなる
data Circle{-型コンストラクタ-} a = Circle{-値コンストラクタ-} a 

-- Circle aからaの部分を取り出すためには
-- パターンマッチを使う
-- 型宣言におけるCircleは型コンストラクタであり，
-- 型を一つ取って新しい型を作る関数みたいなものなので
-- 「型」を記述する宣言内で
-- Circle -> aというように書くことはできない
area :: Floating a => Circle a -> a
area (Circle r) = r ^ 2 * pi

main = do
  l1 <- getLine
  let circle1 = Circle (read l1 :: Float)
  putStrLn $ "area = " ++ show (area circle1)
 
  l2 <- getLine
  let circle2 = Circle (read l2 :: Double)
  putStrLn $ "area = " ++ show (area circle2)
