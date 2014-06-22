module JanusGateway
  module Plugins
    class VideoRoom
      include Virtus.model

      attribute :id, Integer

      def self.name
        "janus.plugin.videoroom"
      end

      def join(room, ptype, publisher, transaction_id)
        #TODO
      end

      def start(room, jsep, transaction_id)
        #TODO
      end

      def configure(id, audio, cideo, jsep, transaction_id)
        #TODO
      end

      def leave()
        #TODO
      end

    end
  end
end
