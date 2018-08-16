class Service < ApplicationRecord
  # scope :with_eager_loaded_preview_img, -> { eager_load(preview_img_attachment: :blob) }

  has_one_attached :preview_img

  validates :title, :preview, :description, presence: true
  validate :preview_img_type

  def thumbnail
    # self.preview_img.variant(resize: '360x225!').processed
    self.preview_img.variant(combine_options: {thumbnail: "360X360^", gravity: "center", extent: "360x225"}).processed
  end

  def main_image_header_variant
    self.preview_img.variant(resize: '750X484^').processed
  end

  private

  def preview_img_type
    if preview_img.attached?
      unless preview_img.content_type.in?(%(image/png image/jpeg image/jpg))
        preview_img.purge_later
        errors.add(:preview_img, 'needs to be JPEG JPG or PNG')
      end
    else
      preview_img.purge_later
      errors.add(:preview_img, 'are missing')
    end
  end

end
