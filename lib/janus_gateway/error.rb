module JanusGateway
  class Error < StandardError

    include Virtus.model
    attribute :reason, String
    attribute :code, Integer

    def message
      reason
    end

  end
end
