{-# LANGUAGE TemplateHaskell #-}
module Main (main) where

import BenchTop


main :: IO ()
main = $(benchTop)
