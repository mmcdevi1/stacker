class ChangeFloorsNameInBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :user_id
      t.integer :floors
      t.integer :sf

      t.timestamps
    end
    rename_column :buildings, :floors, :total_floors
  end
end
