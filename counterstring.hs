module Main( main ) where
import System( getArgs )
import Test.QuickCheck

-- Written by lundtrj@spotify.com
-- Inspired by James Bach's idea of counter strings

counterString :: Int -> String
counterString x = counterString' x "*"


-- This is the program
counterString' :: Int -> String -> String
counterString' 0 _ = ""
counterString' 1 y = y
counterString' x y | x > 1 = counterString' (x-(length(show(x))+1)) y ++show(x)++y
				   | otherwise = "" -- to always return something


-- This is the code that verifies the conterString'
-- To execute the test (the properties) run quickCheck prop_counterString

-- The length should match the desired length
prop_counterString :: Int -> Bool
prop_counterString x | x > 50000 = True -- Performance goes down after a while
					 | x > -1 = (x == y) && (y == z)
					 | otherwise = True
					where
						y = length(counterString x)
						z = length(counterString' x "x")

-- Read command line arguments
main = do
  args <- getArgs
  putStrLn (counterString (read(head args)::Int))