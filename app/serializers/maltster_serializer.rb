class MaltsterSerializer < ActiveModel::Serializer
  attributes :id, :code, :name

  has_many :malts

  def malts
    object.analyzed_malts
  end

  protected
  
  def filter(keys)
    keys.delete(:malts) unless load_malts?
    keys
  end

  private
  
  def load_malts? 
    object.association(:analyzed_malts).loaded?
  end
end
