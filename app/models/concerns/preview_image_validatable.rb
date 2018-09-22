# frozen_string_literal: true

module PreviewImageValidatable
  extend ActiveSupport::Concern

  included do
    has_one_attached :preview_img

    validate :preview_img_type

    private

    def preview_img_type
      if preview_img.attached?
        unless preview_img.content_type.in?(%(image/png image/jpeg image/jpg))
          preview_img.purge_later
          errors.add(:preview_img, :needs_to_be_jpg_jpeg_png)
        end
      else
        preview_img.purge_later
        errors.add(:preview_img, :blank)
      end
    end
  end
end
