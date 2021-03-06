require 'open-uri'

require 'parser/storage'
require 'parser/blocks/block'
require 'parser/blocks/anesthesia'
require 'parser/blocks/diagnostic'
require 'parser/blocks/other'
require 'parser/blocks/propaedeutic'
require 'parser/blocks/surgical'
require 'parser/blocks/therapeutic'

module Parser
  class Procedures
    URL = 'https://en.wikipedia.org/wiki/Medical_procedure'
    BLOCKS = [
      Blocks::Anesthesia,
      Blocks::Diagnostic,
      Blocks::Other,
      Blocks::Propaedeutic,
      Blocks::Surgical,
      Blocks::Therapeutic
    ]

    # the algo runs by blocks on the page
    # and extract a data
    # then storage saves the data
    def run
      html = URI.open(URL).read
      document = Nokogiri::HTML(html)
      storage = Storage.new(Procedure)
      
      Procedure.transaction do
        BLOCKS.each do |block|
          procedures = block.new(document).run
          storage.save procedures
        end
      end
    end
  end
end
