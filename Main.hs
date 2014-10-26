{-
TicTacToe/Main.hs

Copyright (c) 2014 Yawar Amin
GitHub, Reddit, Twitter: yawaramin

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-}
import Data.List (find)
import Data.Monoid (Monoid, mappend, mempty)

data Cell = Empty | Computer | Player deriving (Eq, Show)
data Position = P Int Int deriving (Eq, Show)

instance Ord Position where
  compare (P x1 y1) (P x2 y2) =
    (x1 `compare` x2) `mappend` (y1 `compare` y2)

instance Monoid Position where
  -- The Computer's preferred initial position on the Board.
  mempty = P 1 1
  {-
  To join two Positions together means to find the third Position, given
  the original two, that will have the best chance of either winning or
  losing the board, depending on your point of view. E.g., joining (P 1
  1) and (P 1 3) should return (P 1 2).
  -}
  (P x1 y1) `mappend` (P x2 y2) = undefined

{-
Default Board layout:
(1, 1) (1, 2) (1, 3)
(2, 1) (2, 2) (2, 3)
(3, 1) (3, 2) (3, 3)
-}
type Board = [(Position, Cell)]

newGame :: Board
newGame = [(P x y, Empty) | x <- [1..3], y <- [1..3]]
posns = map fst newGame

won, lost :: Cell -> Board -> Bool
won c b =
  any
    (\p3 -> lookup p3 b == Just c)
    [p1 `mappend` p2 | p1 <- posns, p2 <- posns]

Player `lost` b = Computer `won` b
Computer `lost` b = Player `won` b
lost _ _ = False -- Cover the case of the empty cell

canWin, canLose :: Cell -> Board -> Maybe Position
canWin = undefined
canLose = undefined

computerMove :: Board -> Maybe Position
computerMove board
  | Computer `won` board = Nothing
  | Computer `lost` board = Nothing
  | otherwise =
    (Computer `canWin` board) `mappend`
      (Computer `canLose` board) `mappend`
      {-
      If the Computer isn't about to win or lose, or hasn't already won
      or lost, then it's free to pick any position to play in. In this
      case it will pick the first non-empty position.
      -}
      (find (\p -> lookup p board == Just Empty) posns)

main :: IO ()
main = print $ computerMove newGame

