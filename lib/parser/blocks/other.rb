module Parser
  module Blocks
    class Other < Block
      def initialize(document)
        super(document)
        @block_title = 'Other'
      end
    end
  end
end
