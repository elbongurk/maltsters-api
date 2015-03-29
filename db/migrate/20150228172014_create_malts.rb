class CreateMalts < ActiveRecord::Migration
  def up
    create_table :malts do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :type, null: false
      t.integer :maltster_id, null: false
    end
  end

  def down
    drop_table :malts
  end
end
