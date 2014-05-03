class CreateOwnerProperties < ActiveRecord::Migration
  def change
    create_table :owner_properties do |t|
      t.references :property
      t.references :owner

      t.timestamps
    end
  end
end
