class Analysis < ActiveRecord::Base
  FIELDS = [ :moisture,
             :fine_grind_as_is,
             :fine_grind_dry_basis,
             :coarse_grind_as_is,
             :coarse_grind_dry_basis,
             :fine_coarse_grind_diff,
             :lovibond,
             :diastatic_power,
             :alpha_amylase,
             :total_protein,
             :soluble_nitrogen,
             :viscosity,
             :beta_glucan,
             :assortment_1,
             :assortment_2,
             :assortment_thru ]

  belongs_to :lot
  belongs_to :malt
  
  validates :moisture, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :fine_grind_as_is, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :fine_grind_dry_basis, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :coarse_grind_as_is, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :coarse_grind_dry_basis, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :fine_coarse_grind_diff, format: { with: /\A\d{0,2}(\.\d{1,2})?\Z/ }
  validates :lovibond, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :diastatic_power, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :alpha_amylase, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :total_protein, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :soluble_nitrogen, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :viscosity, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :beta_glucan, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :assortment_1, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :assortment_2, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }
  validates :assortment_thru, format: { with: /\A\d{0,3}(\.\d{1,2})?\Z/ }

  validates_with AnyPresenceValidator, fields: FIELDS
end
