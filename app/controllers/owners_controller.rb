class OwnersController < ApplicationController

  def index
    @search = Owner.search(params[:q])
    @owners = @search.result

    # ransack search object
    @search.build_condition

    respond_to do |format|
      format.html
      format.csv {send_data text: @owners.to_csv}
      format.xls {send_data text: @owners.to_csv(col_sep:"\t")}
    end

  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update(owner_params)
      redirect_to @owner
    else
      render 'edit'
    end
  end

private
  def owner_params
    params.require(:owner).permit(:name,:doc,:street,:city,:state,:country,:phone,:alternate_phone,:email,:notes)
  end

end