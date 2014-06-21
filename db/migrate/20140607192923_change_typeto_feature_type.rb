class ChangeTypetoFeatureType < ActiveRecord::Migration
  def change
    rename_column :shapes, :type, :feature_type
  end
end
