class ChartsController < ApplicationController
  def index
    @properties = Property.all
  end
end
