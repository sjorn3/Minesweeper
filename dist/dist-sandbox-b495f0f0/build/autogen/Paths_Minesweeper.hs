module Paths_Minesweeper (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Haskell\\Minesweeper\\.cabal-sandbox\\bin"
libdir     = "D:\\Haskell\\Minesweeper\\.cabal-sandbox\\x86_64-windows-ghc-7.10.2\\Minesweeper-0.1.0.0-L6S6yY4DPfpE1pHeUmw9Ju"
datadir    = "D:\\Haskell\\Minesweeper\\.cabal-sandbox\\x86_64-windows-ghc-7.10.2\\Minesweeper-0.1.0.0"
libexecdir = "D:\\Haskell\\Minesweeper\\.cabal-sandbox\\Minesweeper-0.1.0.0-L6S6yY4DPfpE1pHeUmw9Ju"
sysconfdir = "D:\\Haskell\\Minesweeper\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Minesweeper_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Minesweeper_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Minesweeper_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Minesweeper_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Minesweeper_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
