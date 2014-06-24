class AddJsonTypeToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :geojson, :column, :json
  end
end
