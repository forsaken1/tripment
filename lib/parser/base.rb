require 'parser/procedures'

module Parser
  class Base
    DEBUG = true

    def run
      Procedures.new.run
    end
  end
end
