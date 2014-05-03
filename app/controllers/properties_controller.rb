class PropertiesController < ApplicationController

  def index
    @search = Property.search(params[:q])
    @properties = @search.result
    @search.build_condition
  end

end
