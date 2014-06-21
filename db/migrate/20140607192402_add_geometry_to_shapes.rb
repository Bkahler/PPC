class AddGeometryToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :geometry, :hstore
  end
end
