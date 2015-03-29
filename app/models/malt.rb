class Malt < ActiveRecord::Base
  self.inheritance_column = nil
  
  has_many :lots
  has_many :analyzed_lots, -> { analyzed }, class_name: 'Lot'

  has_one :analysis
  belongs_to :maltster

  def self.analyzed
    where(id: Analysis.select(:malt_id))
  end

  def self.unanalyzed
    where.not(id: Analysis.select(:malt_id))
  end
end
