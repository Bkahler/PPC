class ChangeFeatureTypetoString < ActiveRecord::Migration
  def change
    change_column :shapes, :feature_type,  :string
  end
end
