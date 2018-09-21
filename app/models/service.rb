class Service < ApplicationRecord
  include PreviewImageValidatable

  translates :title, :preview, :description

  validates :title, :preview, :description, presence: true
end
