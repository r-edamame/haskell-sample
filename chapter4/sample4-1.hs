-- sample4-1.hs

-- データ型Colorの定義
-- 値(値コンストラクタ)をそれぞれ | で
-- 区切って列挙することできる
-- c言語のenumに相当する
data Color = Red | Green | Blue

-- データ型ColoeをShow型クラスのインスタンスにする
instance Show Color where
  show Red = "Red" -- Redは文字列にすると"Red"
  show Green = "Green" -- Greenは文字列にすると"Green"
  show Blue = "Blue" -- Blueは文字列にすると"Blue"

-- データ型ColorをEq型クラス(等価比較可能な型の集合)
-- のインスタンスにする
instance Eq Color where
  Red   == Red   = True -- RedとRedは等しい
  Green == Green = True -- GreenとGreenは等しい
  Blue  == Blue  = True -- BlueとBlueは等しい
  _     == _     = False -- それ以外は等しくない
  {-
   - Eqの型クラスは他に不等号の関数もあるが
   - デフォルト実装で
   -  (/=) = not (==)
   - というものがあるので実装は必要ない
   -}

main = do
  let red = Red
      green = Green
      blue = Blue
  print Red 
  putStrLn $ show red ++ " " ++ show Green ++ " " ++ show Blue
  let red2 = Red
  putStrLn $ show red ++ "と" ++ show green ++ "は" ++ (if red == green then "等しい" else "等しくない")
  putStrLn $ show red ++ "と" ++ show red2 ++ "は" ++ (if red == red2 then "等しい" else "等しくない")
