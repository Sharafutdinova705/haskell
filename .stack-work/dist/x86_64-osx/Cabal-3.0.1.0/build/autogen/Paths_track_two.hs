{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_track_two (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/bin"
libdir     = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/lib/x86_64-osx-ghc-8.8.4/track-two-0.1.0.0-IBEmDegV2AkB58Sx41FG8s"
dynlibdir  = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/share/x86_64-osx-ghc-8.8.4/track-two-0.1.0.0"
libexecdir = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/libexec/x86_64-osx-ghc-8.8.4/track-two-0.1.0.0"
sysconfdir = "/Users/guzelsarafutdinova/Desktop/haskell/.stack-work/install/x86_64-osx/d80d98497379690ffa73f06613781c1254d183296b9433d32ddec31dbcc184c7/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "track_two_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "track_two_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "track_two_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "track_two_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "track_two_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "track_two_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
