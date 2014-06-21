class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.hstore :type
      t.hstore :properties

      t.timestamps
    end
  end
end
