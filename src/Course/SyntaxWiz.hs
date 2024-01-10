{-# LANGUAGE NoImplicitPrelude #-}
module Course.Syntax where

import Course.Core
import Prelude (Double, sqrt)

-- Write a constant approximating Pi
pi' :: Double
pi' = 3.14

data Circle = MkCircle Double
data Rectangle = MkRectangle Double Double
data Triangle = MkTriangle Double Double

-- Write a data type called 'Shape' that can hold either Circle, Rectangle, or Triangle
data Shape = Circle Circle | Rectangle Rectangle | Triangle Triangle

-- Write a function that takes a Shape, and calculates the area of that shape
area :: Shape -> Double
area (Circle (MkCircle r)) = 2 * pi' * r
area (Rectangle (MkRectangle w h)) = w * h
area (Triangle (MkTriangle w h)) = w * h / 2

-- Circle' :: Double -> Double
-- Circle' r = 2 * pi' * r

-- Rectangle' :: Double -> Double -> Double
-- Rectangle' w h = w * h

-- Triangle' :: Double -> Double -> Double
-- Triangle' w h = w * h / 2

data Shape' = Circle' Double | Rectangle' Double Double | Triangle' Double Double
area' :: Shape' -> Double
area' (Circle' r) = 2 * pi' * r
area' (Rectangle' w h) = w * h
area' (Triangle' w h) = w * h / 2

-- Josh comment about the above:
-- The second is the more idiomatic version. 
-- In the first case, you would probably end up implementing area with a typeclass (covered in today's session), rather than pattern matching on a type.
-- Neither is inherently wrong though. There are definitely reasons you'd end up doing the first version in more complex programs
-- example of implementing area with a typeclass:
class Area a where
  area'' :: a -> Double
instance Area Shape' where
  area'' (Circle' r) = 2 * pi' * r
  area'' (Rectangle' w h) = w * h
  area'' (Triangle' w h) = w * h / 2
  