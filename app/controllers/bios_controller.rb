class BiosController < ApplicationController

  def index
    @bio_pic = Bio.first
  end

  def update
    @bio_pic = Bio.find(params[:id])
    @bio_pic.update(bio_params)
  end

  def modal_text
    respond_to do |format|
      format.js
    end

  end

   def open_modal
    @bio_pic = Bio.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:photo)
  end

end
