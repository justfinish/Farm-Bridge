class CsasController < ApplicationController
  def show
    @csa = Csa.find(params[:id])
  end
  
  def create
    @csa = Csa.new(params[:csa])
    success = @csa && @csa.save
    if success && @csa.errors.empty?
      redirect_to csa_path(@csa)
    else
      flash.now[:error]  = "Something went wrong."
      render :action => 'new'
    end
  end
end
