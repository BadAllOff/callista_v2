class Project < ApplicationRecord
  has_one_attached :preview_img
  validates :title, :preview, :description, :start_datetime, presence: true
end
