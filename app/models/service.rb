class Service < ApplicationRecord
  include PreviewImageValidatable

  has_one_attached :preview_img

  validates :title, :preview, :description, presence: true
end
