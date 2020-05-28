class PagesController < ApplicationController
  def index
    # test cscsqc
  end

  def moodboard
    @paramsquery = request.query_parameters
    @test = false
    if @paramsquery != {}
      @test = true
    end

  end
end

