class Realty < ApplicationRecord
  belongs_to :country
  has_one_attached :preview_img
  has_many_attached :images

  validates :title, :preview, :description, presence: true
end
