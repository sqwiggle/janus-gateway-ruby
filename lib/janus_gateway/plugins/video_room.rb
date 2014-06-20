module JanusGateway
  module Plugins
    class VideoRoom
      include Virtus.model

      attribute :id, Integer

      def self.name
        "janus.plugin.videoroom"
      end
    end
  end
end
