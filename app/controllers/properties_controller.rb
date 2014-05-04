class PropertiesController < ApplicationController

  def index
    @search = Property.search(params[:q])
    @properties = @search.result
    @search.build_condition
  end

  def show
    @property = Property.find(params[:id])
  end

end
