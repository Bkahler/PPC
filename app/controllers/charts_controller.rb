class ChartsController < ApplicationController

  def index
    @properties = Property.all
    @parcels = Shape.where(feature_type:"Parcel")
    @streets = Shape.where(feature_type:"Street")
    @geojson = {parcels: @parcels, streets:@streets}


    respond_to do |format|
      format.html
      format.json {render json: @geojson}
    end

  end

end
