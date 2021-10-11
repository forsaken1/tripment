module Parser
  module Blocks
    class Therapeutic < Block
      def initialize(document)
        super(document)
        @block_title = 'Therapeutic'
      end

      def run
        title = document.css(title_id).first
        ul = title.parent.next.next.next.next.next
        parse_list ul
      end
    end
  end
end
