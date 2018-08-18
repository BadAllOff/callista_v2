class Realty < ApplicationRecord
  belongs_to :country
  has_one_attached :preview_img
  has_many_attached :images

  def main_preview_img
    self.preview_img.variant(combine_options: {thumbnail: "652X360^", gravity: "center", extent: "652x357"}).processed
  end

  def main_preview_img_header_variant
    self.preview_img.variant(resize: '750X484^').processed
  end

  def gallery_thumbnail image
    image.variant(combine_options: {thumbnail: "270x200^", gravity: "center", extent: "270x200"}).processed
  end

  def gallery_image image
    image.variant(combine_options: {thumbnail: "1280x800^", gravity: "center", extent: "1280x800"}).processed
  end

end
