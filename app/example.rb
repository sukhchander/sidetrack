class Example
    include Handler::Base
    include Handler::Error

    def get(req,resp)
        post(req,resp)
    end

    def post(req,resp)
        resp.status=201
        resp.write("allo. hello. kaixo")
    end
end
