$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/slib"))

# only in debug environment
require 'ruby-debug'
require 'pp'


# base requires
require 'json'
require 'yaml'
require 'logger'
require 'rack/request'
require 'rack/response'
require 'handler/base'
require 'handler/error'require 'lib/rack'


# rack setup
use Rack::ContentLength
use Rack::Chunked
use Rack::Deflater
use Rack::Static

use Rack::ShowExceptions
use Rack::CommonLogger, STDOUT
Handler::Base.logger = Logger.new(STDERR)


# some memcache action
require 'memcache'
memcache_options = {
    :compression => false,
    :debug => false,
    :namespace => "sidetrack",
    :readonly => false,
    :urlencode => false
}
memcache_uri = ['127.0.0.1:11211']
CACHE = MemCache.new(memcache_uri,memcache_options)
CACHE["test"]

# Sample app
require 'rack/lobster'
map '/lobster' do
    run Rack::Lobster.new
end


# Example app
require 'example'
map '/hello' do
    run Example.new
end
