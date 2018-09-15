class Country < ApplicationRecord
  has_many :realties, dependent: :destroy
  has_one_attached :flag_img
end
