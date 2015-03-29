class MaltSerializer < ActiveModel::Serializer
  attributes :id, :type, :code, :name

  has_many :lots
  has_one :analysis

  def lots
    object.analyzed_lots
  end

  protected

  def filter(keys)
    keys.delete(:lots) unless load_lots?
    keys.delete(:analysis) unless load_analysis?
    keys
  end

  private
  
  def load_lots?
    object.association(:analyzed_lots).loaded?
  end

  def load_analysis?
    object.association(:analysis).loaded?
  end
end
