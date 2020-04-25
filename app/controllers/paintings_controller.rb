class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
    respond_to do |format|
    format.js
    end
end

def update
  @painting = Painting.find(params[:id])
  @painting.update(painting_params)
  redirect_to paintings_path

end

def open_modal
  @painting = Painting.find(params[:id])
  respond_to do |format|
    format.js
  end
end

private

def painting_params
  params.require(:painting).permit(:photo)
end
end
