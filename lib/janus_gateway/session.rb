module JanusGateway
  class Session
    include Virtus.model
    attribute :id, Integer

    def attach(plugin_klass, client, transaction_id)
      client.post(
        plugin_klass,
        "#{client.root}/#{id}", 
        {
          "janus" => "attach",
          "plugin" => plugin_klass.name,
          "transaction" => transaction_id
        }
      )
    end
  end
end
