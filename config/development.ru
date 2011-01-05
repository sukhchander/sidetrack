$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/slib"))

# base requires
require 'pp'
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
