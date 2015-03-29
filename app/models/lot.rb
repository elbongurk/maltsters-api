class Lot < ActiveRecord::Base
  belongs_to :malt
  has_one :analysis

  def self.analyzed
    where(id: Analysis.select(:lot_id))
  end

  def self.unanalyzed
    where.not(id: Analysis.select(:lot_id))
  end
end
