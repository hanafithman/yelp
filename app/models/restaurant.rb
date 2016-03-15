class Restaurant < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  has_many :reviews
end
