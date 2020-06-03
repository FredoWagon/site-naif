require "json"
require "rest-client"

class PagesController < ApplicationController
  def index
    # test cscsqc
  end

  def moodboard
    @urls = instaUrl

  end


  private

  def instaUrl

    all_id = instaChildSelec
    all_url = []

    all_id.each do |id|
      response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJXYVgzejUzdGRWdHBmQmRmVHdUQ3pCS21EZAmJ1NnpCa3N1U1FPMVVmWlh2eWQyUjlOUHhVTWl5bTBSSWpvZATZAvMnZAuU3NQc0x5TjdoQzRMcUNHZAmhrOXd5cjQ2ajVyS0JsN2Y2bW5BV2xTNndnUQZDZD"
      repos = JSON.parse(response)
      all_url << repos["media_url"]
    end
    all_url
  end


  def instaChildSelec

    all_id = instaFirstCall
    new_id = []

    all_id.each do |id|
      response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJVMjRiaWp2WVJRRkRROGlpaS1KZAGp2UTVzNUJuZAnJrVmp5dUZASaGQybFBCZAS1UcTJFNDQ4MG15WTQ2cnZAudk5IT05lZAEp1WV9LaWU4b3NVRzBBeG54OU1VQXNzbGpsSGVDdlFwUjRrRnNzMnk3SAZDZD"

      repos = JSON.parse(response)
      if repos["media_type"] != "IMAGE"
        recup = RestClient.get "https://graph.instagram.com/#{id}/children?access_token=IGQVJVMjRiaWp2WVJRRkRROGlpaS1KZAGp2UTVzNUJuZAnJrVmp5dUZASaGQybFBCZAS1UcTJFNDQ4MG15WTQ2cnZAudk5IT05lZAEp1WV9LaWU4b3NVRzBBeG54OU1VQXNzbGpsSGVDdlFwUjRrRnNzMnk3SAZDZD"
        recupe = JSON.parse(recup)
        all_id.delete(id)
        recupe["data"].each do |i|
          new_id << i.values
        end
      end
    end

    all_id << new_id
    all_id = all_id.flatten
    all_id
  end

  def instaFirstCall

    response = RestClient.get "https://graph.instagram.com/me/media?fields=id,caption&access_token=IGQVJVMjRiaWp2WVJRRkRROGlpaS1KZAGp2UTVzNUJuZAnJrVmp5dUZASaGQybFBCZAS1UcTJFNDQ4MG15WTQ2cnZAudk5IT05lZAEp1WV9LaWU4b3NVRzBBeG54OU1VQXNzbGpsSGVDdlFwUjRrRnNzMnk3SAZDZD"
    repos = JSON.parse(response)

    all_id = []
    repos["data"].each do |media|
      media_id = media.slice("id")
      all_id << media_id.values.join
    end
    all_id
  end

end

