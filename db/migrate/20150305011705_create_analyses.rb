class CreateAnalyses < ActiveRecord::Migration
  def up
    create_table :analyses do |t|
      t.integer :lot_id
      t.integer :malt_id
      t.string :name
      t.decimal :moisture, precision: 4, scale: 2
      t.decimal :fine_grind_as_is, precision: 4, scale: 2
      t.decimal :fine_grind_dry_basis, precision: 4, scale: 2
      t.decimal :coarse_grind_as_is, precision: 4, scale: 2
      t.decimal :coarse_grind_dry_basis, precision: 4, scale: 2
      t.decimal :fine_coarse_grind_diff, precision: 4, scale: 2
      t.decimal :lovibond, precision: 5, scale: 2
      t.decimal :diastatic_power, precision: 5, scale: 2
      t.decimal :alpha_amylase, precision: 5, scale: 2
      t.decimal :total_protein, precision: 5, scale: 2
      t.decimal :soluble_nitrogen, precision: 5, scale: 2
      t.decimal :viscosity, precision: 5, scale: 2
      t.decimal :beta_glucan, precision: 5, scale: 2
      t.decimal :assortment_1, precision: 5, scale: 2
      t.decimal :assortment_2, precision: 5, scale: 2
      t.decimal :assortment_thru, precision: 5, scale: 2
      t.timestamps null: false
    end
  end

  def down
    drop_table :analyses
  end
end
