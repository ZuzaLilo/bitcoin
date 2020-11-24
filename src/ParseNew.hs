{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}


module Parse where

import Data.Aeson (eitherDecode)
import qualified Data.ByteString.Lazy.Char8 as L8
import GHC.Generics ( Generic )
import Data.Aeson.Types

-- data Weakness = Weakness [String] deriving (Show, Generic)
data USD = USD {
    code :: String,
    symbol :: String,
    rate :: String,
    description :: String,
    rate_float :: Float
} deriving (Show, Generic)

data GBP = GBP {
    code :: String,
    symbol :: String,
    rate :: String,
    description :: String,
    rate_float :: Float
} deriving (Show, Generic)

data EUR = EUR {
    code :: String,
    symbol :: String,
    rate :: String,
    description :: String,
    rate_float :: Float
} deriving (Show, Generic)

data Bpi = Bpi {
    USD :: USD,
    GBP :: GBP,
    EUR :: EUR
} deriving (Show, Generic)

data Time = Time {
    updated :: String,
    updatedISO ::String,
    updateduk :: String
} deriving (Show, Generic)


data Bitcoin = Bitcoin {
    time :: Time,
    disclaimer :: String,
    chartName :: String,
    bpi :: Bpi
} deriving (Show, Generic)

data BitcoinInfo = BitcoinInfo {
    bitcoinInfo :: Bitcoin
} deriving (Show, Generic)


instance FromJSON Bitcoin
instance ToJSON Bitcoin

instance FromJSON Time
instance ToJSON Time

instance FromJSON Bpi
instance ToJSON Bpi

instance FromJSON USD
instance ToJSON USD

instance FromJSON GBP
instance ToJSON GBP

instance FromJSON EUR
instance ToJSON EUR


parse :: L8.ByteString -> Either String BitcoinInfo
parse json = eitherDecode json :: Either String BitcoinInfo


