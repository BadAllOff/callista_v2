class Project < ApplicationRecord
  include PreviewImageValidatable

  has_one_attached :preview_img

  translates :title, :preview, :description

  validates :title, :preview, :description, :start_datetime, presence: true
end
