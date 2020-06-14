class Murale < ApplicationRecord
   has_one_attached :photo, dependent: false

  validates :name, presence: true
  validate :check_photo_presence

def check_photo_presence
  errors.add(:photo, "no photo added") unless photo.attached?
end
end
