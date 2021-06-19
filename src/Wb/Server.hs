{-# OPTIONS_GHC -Wall -fno-warn-unused-imports #-}

module Wb.Server where

-- base
import qualified Data.List as List

-- bytestring
import qualified Data.ByteString                as BS
import qualified Data.ByteString.Lazy           as LBS
import qualified Data.ByteString.Char8          as ASCII
import qualified Data.ByteString.Lazy.Char8     as LASCII
import qualified Data.ByteString.Builder        as BSB

-- network
import Network.Socket (Socket)
import qualified Network.Socket.ByteString      as Socket
import qualified Network.Socket.ByteString.Lazy as LSocket

-- network simple
import qualified Network.Simple.TCP as NS

-- application start

server :: (Socket -> IO ()) -> IO a
server f =
    NS.serve NS.HostAny "9000" $ \(socket, _socketAddress) ->
        f socket

helloResponse :: BS.ByteString
helloResponse =
    asciiLines
        [ "HTTP/1.1 200 OK"
        , "Content-Type: text/plain; charset=us-ascii"
        , "Content-Length: 31"
        , ""
        , "Hello World to all Haskellers!\n"
        ]

asciiLines :: [String] -> BS.ByteString
asciiLines xs = 
    ASCII.pack (List.intercalate "\r\n" xs)

sayHello :: Socket -> IO ()
sayHello socket =
    Socket.sendAll socket helloResponse

--------------------------------------
-- HTTP types
--------------------------------------

data Digit = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 
    deriving (Eq, Show, Bounded, Enum, Ord)

-- protocol versioning

data HttpVersion = HttpVersion Digit Digit
    deriving (Eq, Show)

-- message format

data Request = Request RequestLine [HeaderField] (Maybe MessageBody)
    deriving (Eq, Show)

data Response = Response StatusLine [HeaderField] (Maybe MessageBody)
    deriving (Eq, Show)

-- request line

data RequestLine = RequestLine Method RequestTarget HttpVersion
    deriving (Eq, Show)

newtype Method = Method BS.ByteString
    deriving (Eq, Show)

-- status line

data StatusLine = StatusLine HttpVersion StatusCode ReasonPhrase
    deriving (Eq, Show)

data StatusCode = StatusCode Digit Digit Digit
    deriving (Eq, Show)

newtype ReasonPhrase = ReasonPhrase BS.ByteString
    deriving (Eq, Show)

-- header fields

data HeaderField = HeaderField FieldName FieldValue
    deriving (Eq, Show)

newtype FieldName = FieldName BS.ByteString
    deriving (Eq, Show)

newtype FieldValue = FieldValue BS.ByteString
    deriving (Eq, Show)

-- message body

newtype MessageBody = MessageBody LBS.ByteString
    deriving (Eq, Show)

-- request target

newtype RequestTarget = RequestTarget BS.ByteString
    deriving (Eq, Show)

---
-- 4 Response encoding
---

encodingDigit :: Digit -> BSB.Builder
encodingDigit d = BSB.string7 [digitChar d]

digitChar :: Digit -> Char
digitChar d =
    case d of
        D0 -> '0'
        D1 -> '1'
        D2 -> '2'
        D3 -> '3'
        D4 -> '4'
        D5 -> '5'
        D6 -> '6'
        D7 -> '7'
        D8 -> '8'
        D9 -> '9'