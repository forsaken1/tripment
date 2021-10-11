module Parser
  module Blocks
    class Propaedeutic < Block
      def initialize(document)
        super(document)
        @block_title = 'Propaedeutic'
      end
    end
  end
end
