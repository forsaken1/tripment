module Parser
  module Blocks
    class Block
      attr_reader :document, :block_title

      def initialize(document)
        @document = document
        @block_title = nil
      end

      def run
        title = document.css(title_id).first
        ul = title.parent.next.next
        parse_list ul
      end

      protected

      def parse_list list
        list.css('li').map do |li|
          node = li.children.first
          title = node.name == 'a' ? node['title'] : node.to_s.chop
          { title: title, block: block_title, url: nil, body: nil }
        end
      end

      def title_id
        "##{block_title}"
      end
    end
  end
end
