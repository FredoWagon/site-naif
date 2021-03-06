class Painting < ApplicationRecord
  has_one_attached :photo, dependent: false
  acts_as_list

  validates :name, presence: true
  validate :check_photo_presence

def check_photo_presence
  errors.add(:photo, "no photo added") unless photo.attached?
end
end
