class OwnerProperty < ActiveRecord::Base
  belongs_to :owner
  belongs_to :property

  attr_accessible :owner_id, :property_id
end
