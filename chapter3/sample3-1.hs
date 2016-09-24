-- sample3-1.hs

-- forM_ を使うためにインポートするモジュール
import Control.Monad

-- (型1, 型2) という形で複数の型を
-- 一つにまとめるタプル型を定義できる
-- 型1と型2は別のものでもよい
-- 中の値はパターンマッチを使って取り出す
-- dictionaryは二つの文字列のタプルのリスト
dictionary :: [(String,String)]
dictionary = [("りんご","apple"), ("本","book"), ("犬","dog")]

main :: IO ()
main = do
  -- forM_ :: [a] -> (a -> IO b) -> IO ()
  -- [a]の要素それぞれに対して(a -> IO b)のアクション
  -- を実行する(結果bは捨てる)
  forM_ dictionary $
    -- (\引数 -> 式) という形でラムダ式(即時関数)を定義できる
    -- このラムダ式は (String,String) -> IO () という型の関数
    -- (jp,en)というパターンマッチでdictionaryの要素から
    -- 日本語と英語の文字列をそれぞれ取得する
    (\(jp,en)->putStrLn (jp ++ " は英語で " ++ en ++ " です") )

