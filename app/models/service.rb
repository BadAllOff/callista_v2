class Service < ApplicationRecord
  has_one_attached :preview_img

  validates :title, :preview, :description, presence: true
  validate :preview_img_type

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
