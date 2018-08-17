class Country < ApplicationRecord
  has_many :realties, dependent: :destroy
  has_one_attached :flag_img

  def flag_thumbnail
    self.flag_img.variant(combine_options: {thumbnail: "360x225^", gravity: "center", extent: "360x225"}).processed
  end
end
