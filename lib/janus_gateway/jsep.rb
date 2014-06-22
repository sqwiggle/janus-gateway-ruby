module JanusGateway
  class Jsep
    include Virtus.model
    attribute :sdp, String
    attribute :type, String
  end
end
