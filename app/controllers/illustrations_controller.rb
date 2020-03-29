class IllustrationsController < ApplicationController
  def index
    @illustrations = Illustration.all
  end
end
