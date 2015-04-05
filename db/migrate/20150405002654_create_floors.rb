class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.integer :user_id
      t.integer :building_id
      t.string :tenant
      t.integer :sf
      t.integer :floor

      t.timestamps
    end
  end
end
