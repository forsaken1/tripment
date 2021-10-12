require 'parser/procedures'

module Parser
  class Base
    def run
      Procedures.new.run
    end
  end
end
