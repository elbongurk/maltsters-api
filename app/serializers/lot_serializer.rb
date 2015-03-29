class LotSerializer < ActiveModel::Serializer
  attributes :id, :code

  has_one :analysis

  protected
  
  def filter(keys)
    keys.delete(:analysis) unless load_analysis?
    keys
  end

  private
  
  def load_analysis?
    object.association(:analysis).loaded?
  end
end
