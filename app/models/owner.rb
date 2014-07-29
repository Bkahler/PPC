class Owner < ActiveRecord::Base

  has_many :owner_properties
  has_many :properties, through: :owner_properties

  attr_accessible :name, :doc,:street,:city,:country, :phone, :alternative_phone, :email, :notes

  def self.to_csv(options = {} )
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |owner|
        csv << owner.attributes.values_at(*column_names)
      end
    end
  end

end
