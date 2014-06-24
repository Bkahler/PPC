class AddCoordsToShape < ActiveRecord::Migration
  def change
    add_column :shapes, :coords, :integer, :array => true
  end
end
