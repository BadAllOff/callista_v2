class Country < ApplicationRecord
  include PreviewImageValidatable

  has_many :realties, dependent: :destroy
  has_one_attached :flag_img

  translates :name, :description

  validates :name, :description, :flag_img, presence: true
end
