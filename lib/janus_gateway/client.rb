module JanusGateway
  class Client

    attr_reader :domain, :port, :root, :ssl

    def initialize(domain:'localhost', port:8088, root:'janus', ssl:false)
      @domain, @port, @root, @ssl = domain, port, root, ssl
    end

    def session(transaction_id)
      post Session, root, { janus:"create", transaction:transaction_id }
    end

    def session!(transaction_id)
      post! Session, root, { janus:"create", transaction:transaction_id }
    end

    private

    def post(klass, path, attrs)
      parse_response_for Session, raw_post(path, attrs)
    end

    def post!(klass, path, attrs)
      post(klass, path, attrs).tap do |response|
        raise response if response.kind_of?(::JanusGateway::Error)
      end
    end

    def raw_post(path, attrs)
      connection.post do |req|
        req.url "/#{path}"
        req.headers['Content-Type'] = 'application/json'
        req.body = attrs.to_json
      end
    end

    def parse_response_for(klass, response)
      attrs = JSON.parse response.body
      attrs["janus"] == "success" ? klass.new(attrs["data"]) : Error.new(attrs["error"])
    end

    def protocol
      ssl ? 'https' : 'http'
    end

    def url
      "#{protocol}://#{domain}:#{port}"
    end

    def connection
      @conn ||= Faraday.new(url:url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end
end
