class Country < ApplicationRecord
  has_many :realties, dependent: :destroy
  has_one_attached :flag_img

  validates :name, :description, :flag_img, presence: true
end
