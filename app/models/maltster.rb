class Maltster < ActiveRecord::Base
  has_many :malts
  has_many :analyzed_malts, -> { analyzed }, class_name: 'Malt'

  def self.analyzed
    where(id: Malt.analyzed.select(:maltster_id))
  end
end
