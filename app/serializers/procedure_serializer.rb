class ProcedureSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :block, :url, :body
end
