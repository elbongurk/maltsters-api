class CreateLots < ActiveRecord::Migration
  def up
    create_table :lots do |t|
      t.string :code, null: false
      t.string :sku, null: false
      t.integer :malt_id, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :lots
  end
end
