class BiosController < ApplicationController

  def index
    @bio_pic = Bio.first
  end

  def update
    @bio_pic = Bio.first
    @bio_pic.update(bio_params)
  end

  def open_text
    @bio_pic = Bio.first
    respond_to do |format|
      format.js
    end
  end

  def open_modal
    @bio_pic = Bio.first
    respond_to do |format|
      format.js
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:photo, :bio)
  end

end
