require 'parser/base'

namespace :parse do
  task procedures: [:environment] do
    parser = Parser::Base.new
    parser.run
  end
end
