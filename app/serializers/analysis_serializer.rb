class AnalysisSerializer < ActiveModel::Serializer
  attributes :name
  attributes *Analysis::FIELDS
end
