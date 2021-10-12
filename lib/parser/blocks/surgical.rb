module Parser
  module Blocks
    class Surgical < Block
      def initialize(document)
        super(document)
        @block_title = 'Surgical'
      end
    end
  end
end
