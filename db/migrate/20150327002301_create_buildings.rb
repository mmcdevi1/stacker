class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :user_id
      t.integer :floors
      t.integer :sf

      t.timestamps
    end
  end
end
