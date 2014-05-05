class Property < ActiveRecord::Base

  has_many :owner_properties
  has_many :owners, through: :owner_properties

UNRANSACKABLE_ATTRIBUTES = ["id", "published", "created_at"]

def self.ransackable_attributes auth_object = nil
  (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
end


end
