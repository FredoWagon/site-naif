require "rest-client"

class Insta < ApplicationRecord
  has_one_attached :photo

  validate :check_photo_presence

def check_photo_presence
  errors.add(:photo, "no photo added") unless photo.attached?
end

# self.call fait un call api instagram et retourne toutes les urls des photos du compte associé au token.
def self.call

    response = RestClient.get "https://graph.instagram.com/me/media?fields=id,caption&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"
    repos = JSON.parse(response)

    all_id = []
    repos["data"].each do |media|
      media_id = media.slice("id")
      all_id << media_id.values.join
    end

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

      all_url2 = []

      all_id.each do |id|
        response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"
        repos = JSON.parse(response)
        all_url2 << repos["media_url"]
      end
      all_url2
    end

# self.newrepo prend en paramètre l'id media d'une photo instagram et renvoi l'url de cette image
    def self.newrepo(id)
      response = RestClient.get "https://graph.instagram.com/#{id}?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYUFdTUVE0eVBfcWg3ZAGx2Y0dsWFJ4WGZAUamF3cmpDNGNXZA3BDTXVZAZAXAydkxRV2kyVFJaMUtZAU1ZAxZAVBTMWdBRG1xVkpuTmVLTVRFMFN6cXIyLUJ5QV9XSFBXYlVtTzRCWmppVTU5RU02S21uTAZDZD"

      repos = JSON.parse(response)
    end

end
