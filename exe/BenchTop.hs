{-# LANGUAGE NoMonomorphismRestriction           #-}
{-# LANGUAGE TemplateHaskell           #-}
module BenchTop where
import           Data.Monoid
import           Test.Tasty.Bench
import           Prelude                               hiding (words)
import qualified Data.ByteString.Lazy as L
import Data.ByteString.Builder
import Control.Monad.IO.Class
import System.Environment


benchTop = let
          benchB' :: String -> a -> (a -> Builder) -> Benchmark
          benchB' name x b = bench name $ whnf b x
         in liftIO (withArgs [] (defaultMain
                [ benchB' "mempty"        ()  (const mempty)
                 ]
              )) >> [| () |]
