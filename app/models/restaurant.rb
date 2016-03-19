class Restaurant < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :reviews, dependent: :destroy

  validates :name, :address, :phone, :website, :image, presence: true
  validates :phone, allow_blank: true, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
    message: "must be in the format (123) 456-7890" }
  validates :website, allow_blank: true, format: { with: /\Ahttps?:\/\/.+\z/,
    message: "must start with https:// or https://" }
  validates :address, allow_blank: true, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
    message: "must be in the format of 350 Firth Avenue, New York, NY 10118"}
end
