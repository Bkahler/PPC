class Property < ActiveRecord::Base

  has_many :owner_properties
  has_many :owners, through: :owner_properties
  has_one :shapes
  accepts_nested_attributes_for :shapes

  UNRANSACKABLE_ATTRIBUTES = ["id", "published", "created_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def self.to_csv(options = {} )
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |property|
        csv << property.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      params = {:apn=>row["apn"],:acres=>row["acres"],:GIS_acres=>row["GIS_acres"],:build_acres=>row["build_acres"],:year_sold=>row["year_sold"],:sale_price=>row["sale_price"],:assesment=>row["assesment"]}
      prop = Property.create! params
      prop.owners << Owner.find_by_id(row["owner_id"])
    end
  end


end
