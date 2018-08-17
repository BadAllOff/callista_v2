class Project < ApplicationRecord
  has_one_attached :preview_img

  validates :title, :preview, :description, presence: true

  def thumbnail
    self.preview_img.variant(combine_options: {thumbnail: "652x280^", gravity: "center", extent: "652x280"}).processed
  end

  def main_image_header_variant
    self.preview_img.variant(resize: '750X484^').processed
  end
end
