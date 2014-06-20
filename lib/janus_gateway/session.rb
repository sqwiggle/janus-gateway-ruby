module JanusGateway
  class Session
    include Virtus.model
    attribute :id, Integer

    def poll(client)
      JSON.parse client.raw_get(path(client)).body
    end

    def attach(plugin_klass, client, transaction_id)
      client.post(
        plugin_klass,
        path(client), 
        {
          "janus" => "attach",
          "plugin" => plugin_klass.name,
          "transaction" => transaction_id
        }
      )
    end

    private

    def path(client)
      "#{client.root}/#{id}"
    end
  end
end
