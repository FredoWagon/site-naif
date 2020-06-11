require "json"
require "rest-client"

class PagesController < ApplicationController
  def index
    # test cscsqc
  end

  def moodboard

  end

  def webhook
  end

  private

  def instaUrl

    all_id = instaChildSelec
    all_url = []

    all_id.each do |id|
      response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"
      repos = JSON.parse(response)
      all_url << repos["media_url"]
    end
    all_url
  end


  def instaChildSelec

    all_id = instaFirstCall
    new_id = []

    all_id.each do |id|
      response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"

      repos = JSON.parse(response)
      if repos["media_type"] != "IMAGE"
        recup = RestClient.get "https://graph.instagram.com/#{id}/children?access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"
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

    response = RestClient.get "https://graph.instagram.com/me/media?fields=id,caption&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"
    repos = JSON.parse(response)

    all_id = []
    repos["data"].each do |media|
      media_id = media.slice("id")
      all_id << media_id.values.join
    end
    all_id
  end

end

