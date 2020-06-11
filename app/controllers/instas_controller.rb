require "open-uri"
require "rest-client"
require "dotenv"
require "pry-byebug"

class InstasController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }

  def index
    @instas = Insta.all

  end


  def destroy
    @insta = Insta.find(params[:id])
    @insta.destroy
    respond_to do |format|
      format.js
    end
  end

  def webhook
    media_received = JSON.parse(request.body.read)
    media_url = media_received["media"]
    insta_pic = open(media_url)
    @insta_entrie = Insta.new
    number_name = 10000
    @insta_entrie.photo.attach(io:insta_pic, filename: "insta#{number_name}.jpg", content_type: 'image/jpg')
    if @insta_entrie.save
      number_name += 1
      render :json => {:status => 200}
    end

  end

  def destroy_all
    Insta.destroy_all
  end

  def refresh
    all_pic = Insta.call

    number_name = 0
    all_pic.each do |url|

      insta_pic = open(url)
      insta_entrie = Insta.new
      insta_entrie.photo.attach(io: insta_pic, filename: "insta#{number_name}.jpg", content_type: 'image/jpg')
      insta_entrie.save
      number_name += 1
    end

  end

end

