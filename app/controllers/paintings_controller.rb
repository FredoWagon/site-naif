class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def new
    @painting = Painting.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      redirect_to paintings_path, :notice => "Bien joué!"
    else
      redirect_to paintings_path, :notice => "merde!"
    end


  end

  def update
    @painting = Painting.find(params[:id])
    @painting.update(painting_params)

  end

  def open_modal
    @painting = Painting.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
      respond_to do |format|
        format.js
    end

  end


  private

  def painting_params
    params.require(:painting).permit(:photo, :name)
  end
end
