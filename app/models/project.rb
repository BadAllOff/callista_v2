class Project < ApplicationRecord
  include PreviewImageValidatable

  translates :title, :preview, :description

  validates :title, :preview, :description, :start_datetime, presence: true
end
