require 'mime/types'

flv = MIME::Type.new("video/x-flv")
flv.extensions.push("flv")
MIME::Types.add(flv)
