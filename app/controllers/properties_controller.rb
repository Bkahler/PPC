class PropertiesController < ApplicationController
  rescue_from Exception, :with => :render_new

  def index
    @property_search = Property.search(params[:q])
    @properties = @property_search.result

    # Need to find a better way to persist search results
    # session[:search_results_property] = request.url

    # ransack search object
    @property_search.build_condition

    # action to allow csv download, xls download
    respond_to do |format|
      format.html
      format.csv {send_data text: @properties.to_csv}
      format.xls {send_data text: @properties.to_csv(col_sep:"\t")}
    end
  end

  def import
    Property.import(params[:file])
  end

  def show
    @shapes = Shape.all
    @property = Property.find(params[:id])
    gon.property_id = @property.id

    # Json response
    respond_to do |format|
      format.html
      format.json {render json: @shapes}
    end

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

  def render_new
    flash[:alert] = "Cannot Complete search. please try a different search"
    redirect_to root_path
  end

end
