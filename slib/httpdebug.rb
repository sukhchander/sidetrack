require 'net/http'

module Net
	class HTTP
		alias_method :orig_request, :request
		def request(req, body = nil, &block)
			puts "abcdefghijklmnopqrstuvwxyz"
			orig_request(req, body, &block)
		end
	end
end
