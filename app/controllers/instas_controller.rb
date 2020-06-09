require "open-uri"
require "rest-client"
require "dotenv"

class InstasController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }

  def index
    @instas = @data
    test = request.body.read
    puts "salut c'est #{response}"
    response
    puts response

  end

  def create
    response = request.body.read
    puts "salut c'est #{response}"

  end

  def destroy
    @insta = Insta.find(params[:id])
    @insta.destroy
    respond_to do |format|
      format.js
    end
  end

  def webhook
    test = params['hub.challenge']
    render plain: test
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

