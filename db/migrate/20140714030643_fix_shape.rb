class FixShape < ActiveRecord::Migration
  def change
    change_table :shapes do |t|
      t.remove :coords
      t.remove :geometry
      t.remove :properties
      t.integer :property_id


    end

  end
end
