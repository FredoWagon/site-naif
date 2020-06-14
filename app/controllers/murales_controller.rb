class MuralesController < ApplicationController
  def index
    @murales = Murale.all
  end

  def new
    @murales = Murale.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @murale = Murale.new(murale_params)

    if @murale.save
      redirect_to murales_path, :notice => "Bien joué!"
    else
      redirect_to murales_path, :notice => "merde!"
    end


  end

  def update
    @murale = Murale.find(params[:id])
    @murale.update(murale_params)

  end

  def open_modal
    @murale = Murale.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @murale = Murale.find(params[:id])
    @murale.destroy
      respond_to do |format|
        format.js
    end

  end


  private

  def murale_params
    params.require(:murale).permit(:photo, :name)
  end
end
