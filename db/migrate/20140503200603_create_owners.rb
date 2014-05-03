class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :doc
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :alternate_phone
      t.string :email
      t.string :notes

      t.timestamps
    end
  end
end
