$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/slib"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))

# base requires
require 'pp'
require 'logger'
require 'yaml'
require 'racklib'
require 'handler/base'

require 'memcache'
# init memcache client
memcache_options = {
    :compression => false,
    :debug => false,
    :namespace => "sidetrack",
    :readonly => false,
    :urlencode => false
}
memcache_uri = ['127.0.0.1:11211']
CACHE = MemCache.new(memcache_uri,memcache_options)
CACHE.get('test')

Handler::Base.logger = Logger.new(STDERR)

use Rack::CommonLogger, STDOUT
use Rack::ShowExceptions

# Sample app
require 'rack/lobster'

map '/lobster' do
    run Rack::Lobster.new
end
