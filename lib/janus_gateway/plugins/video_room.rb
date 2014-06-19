module JanusGateway
  module Plugins
    class VideoRoom
      include Virtus.model

      def self.name
        "janus.plugin.videoroom"
      end
    end
  end
end
