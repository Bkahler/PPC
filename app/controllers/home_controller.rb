class HomeController < ApplicationController

  def index
    @owners = Owner.all
    @properties = Property.all

  end
end
