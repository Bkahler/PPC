class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :apn
      t.float :acres
      t.float :GIS_acres
      t.float :build_acres
      t.integer :year_sold
      t.float :sale_price
      t.float :assesment

      t.timestamps
    end
  end
end
