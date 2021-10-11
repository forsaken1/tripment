module Parser
  module Blocks
    class Diagnostic < Block
      def initialize(document)
        super(document)
        @block_title = 'Diagnostic'
      end
    end
  end
end
