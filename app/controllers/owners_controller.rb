class OwnersController < ApplicationController

  def index
    @search = Owner.search(params[:q])
    @owners = @search.result
    @search.build_condition
  end

  def show
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