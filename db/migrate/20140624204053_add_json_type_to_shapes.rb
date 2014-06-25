class AddJsonTypeToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :geojson, :json
  end
end
