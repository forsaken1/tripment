module Parser
  module Blocks
    class Anesthesia < Block
      def initialize(document)
        super(document)
        @block_title = 'Anesthesia'
      end
    end
  end
end
