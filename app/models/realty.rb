# frozen_string_literal: true

class Realty < ApplicationRecord
  include PreviewImageValidatable

  belongs_to :country
  has_one_attached :preview_img
  has_many_attached :images

  validates :title, :preview, :description, presence: true
end
