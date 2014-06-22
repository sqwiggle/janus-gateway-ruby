module JanusGateway
  class Event
    include Virtus.model

    attribute :transaction, String
    attribute :plugin
    attribute :sender
    attribute :jsep, Jsep
  end
end
