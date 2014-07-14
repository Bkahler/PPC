class Shape < ActiveRecord::Base

  attr_accessible :geojson,:feature_type
  belongs_to :property

  def updatecolor(shape_id,color)
    shape = Shape.find(shape_id)
    geojson1 = shape.geojson
    geojson1["properties"]["color"] = color
    shape.geojson= geojson1
    shape.geojson_will_change!
    shape.save
  end

end
