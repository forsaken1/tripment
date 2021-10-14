module Api
  module V1
    class ProceduresController < ApiController
      def index
        render json: ProcedureSerializer.new(procedures)
      end

      private

      def procedures
        SearchProceduresService.new(params).call
      end
    end
  end
end
