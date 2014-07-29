class AddStatustoProperty < ActiveRecord::Migration
  def change
     add_column :properties, :status, :integer
  end
end
