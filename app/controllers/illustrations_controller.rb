class IllustrationsController < ApplicationController
  def index
    @illustrations = Illustration.all
  end

  def new
    @illustrations = Illustration.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @illustration = Illustration.new(illustration_params)

    if @illustration.save
      redirect_to illustrations_path, :notice => "Bien joué!"
    else
      redirect_to illustrations_path, :notice => "merde!"
    end


  end

  def update
    @illustration = Illustration.find(params[:id])
    @illustration.update(illustrations_params)

  end

  def open_modal
    @illustration = Illustration.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @illustration = Illustration.find(params[:id])
    @illustration.destroy
      respond_to do |format|
        format.js
    end

  end


  private

  def illustration_params
    params.require(:illustration).permit(:photo, :name)
  end
end
