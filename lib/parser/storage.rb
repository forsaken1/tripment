module Parser
  class Storage
    attr_reader :klass

    def initialize(klass)
      @klass = klass
    end

    def save(collection)
      collection.each do |attributes|
        item = klass.find_by title: attributes[:title], block: attributes[:block]

        if item
          item.update attributes
        else
          klass.create! attributes
        end
      end
    end
  end
end
