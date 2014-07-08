class PropertiesController < ApplicationController

  def index
    @property_search = Property.search(params[:q])
    @properties = @property_search.result
    @shapes = Shape.all
    session[:search_results_property] = request.url

    # ransack search object
    @property_search.build_condition

    # action to allow csv download
    respond_to do |format|
      format.html
      format.json {render json: @shapes}
      format.csv {send_data text: @properties.to_csv}
      format.xls {send_data text: @properties.to_csv(col_sep:"\t")}
    end
  end

  def import
    Property.import(params[:file])
  end

  def show
    @property = Property.find(params[:id])
    gon.property_id = @property.id
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end

private
  def property_params
    params.require(:property).permit(:apn,:owner,:acres,:GIS_acres,:build_acres,:year_sold,:sale_price,:assesment,:text)
  end

end
