class CreateMalsters < ActiveRecord::Migration
  def up
    create_table :malsters do |t|
      t.string :code, null: false
      t.string :name, null: false
    end
  end

  def down
    drop_table :malsters
  end
end
