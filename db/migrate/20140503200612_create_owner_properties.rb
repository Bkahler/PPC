class CreateOwnerProperties < ActiveRecord::Migration
  def change
    create_table :owner_properties do |t|

      t.timestamps
    end
  end
end
