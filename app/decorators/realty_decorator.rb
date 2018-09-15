class RealtyDecorator
  attr_accessor :realty, :view_context
  delegate :id, :country, :title, :preview, :preview_img, :description, :images, to: :realty

  def initialize (realty, view_context)
    @realty, @view_context = realty, view_context
  end

  def main_preview_img
    if realty.preview_img.attached?
      view_context.image_tag realty.preview_img.variant(combine_options: {thumbnail: "652X360^", gravity: "center", extent: "652x357"}).processed, class: "img-responsive"
    end
  end

  # Gallery section
  def link_to_gallery_image (image)
    view_context.link_to gallery_image(realty.images[image]), class: "original-image" do
      view_context.image_tag (gallery_image_thumbnail(realty.images[image])), class: 'img-responsive img-thumbnail', data: {toggle: "lightbox", gallery: realty.id, type: "image"}
    end
  end

  def gallery_image image
    image.variant(combine_options: {thumbnail: "1280x800^", gravity: "center", extent: "1280x800"}).processed
  end

  def gallery_image_thumbnail image
    image.variant(combine_options: {thumbnail: "270x200^", gravity: "center", extent: "270x200"}).processed
  end
  # End of Gallery section

  def main_preview_img_header_variant
    if realty.preview_img.attached?
      view_context.image_tag realty.preview_img.variant(resize: '750X484^').processed, class: "img-responsive project_img_top box-shadow img-rounded"
    end
  end

  def sidebar_preview_image_thumbnail
    if realty.preview_img.attached?
      view_context.image_tag realty.preview_img.variant(resize: '295X195^').processed, class: "img-responsive img-rounded", alt: realty.title
    else
      view_context.image_tag view_context.asset_path('268x150.png'), alt: 'some text', class: 'img-responsive'
    end
  end

  def landing_page_image_thumbnail
    if realty.preview_img.attached?
      view_context.image_tag realty.preview_img.variant(resize: '268x150!').processed, class: "img-responsive", style: 'border: 1px solid #c3c3c3;', alt: realty.title
    else
      view_context.image_tag view_context.asset_path('268x150.png'), alt: 'some text', class: 'img-responsive', style: 'border: 1px solid #c3c3c3;'
    end
  end

  def link_to_show
    view_context.link_to 'Show', [realty.country, realty], class: "btn btn-sm btn-outline-danger"
  end

  def link_to_edit
    view_context.link_to 'Edit', view_context.edit_country_realty_path(realty.country, realty),  class: "btn btn-sm btn-outline-secondary" if view_context.user_signed_in?
  end

  def link_to_destroy
    view_context.link_to 'Destroy', [realty.country, realty], :confirm => 'Are you sure?', :method => :delete, class: "btn btn-sm btn-danger" if view_context.user_signed_in?
  end
end