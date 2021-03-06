# frozen_string_literal: true

class ServiceDecorator
  attr_reader :service, :view_context
  delegate :id, :title, :preview, :description, :preview_img, to: :service

  def initialize(service, view_context)
    @service = service
    @view_context = view_context
  end

  def service_preview_img_thumbnail
    if service.preview_img.attached?
      view_context.image_tag service.preview_img.variant(combine_options: { thumbnail: '360X360^', gravity: 'center', extent: '360x225' }).processed, class: 'card-img-top img-responsive box-shadow', alt: service.title, title: service.title, style: 'display: block; margin: 0 auto;'
    else
      %(<img class="card-img-top img-responsive box-shadow" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="#{service.title}" title="#{service.title}" style="height: 225px; width: 100%; display: block; margin: 0 auto;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22348%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20348%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1647fe353a5%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A17pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1647fe353a5%22%3E%3Crect%20width%3D%22348%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22117.5%22%20y%3D%22120.15%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">).html_safe
    end
  end

  def main_image_header_variant
    if service.preview_img.attached?
      view_context.image_tag service.preview_img.variant(resize: '750X484^').processed, class: 'card-img-top box-shadow img-responsive img-rounded', alt: service.title, title: service.title
    else
      %(<img class="card-img-top box-shadow img-responsive img-rounded" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="#{service.title}" title="#{service.title}" style="width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22348%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20348%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1647fe353a5%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A17pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1647fe353a5%22%3E%3Crect%20width%3D%22348%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22117.5%22%20y%3D%22120.15%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">)
    end
  end

  def link_to_show
    view_context.link_to view_context.t('services.view_service'), service, class: 'btn btn-sm btn-outline-danger'
  end

  def link_to_edit
    view_context.link_to view_context.t('shared.edit'), view_context.edit_service_path(service), class: 'btn btn-sm btn-outline-secondary' if view_context.user_signed_in?
  end

  def link_to_destroy
    view_context.link_to view_context.t('shared.destroy'), service, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-sm btn-danger' if view_context.user_signed_in?
  end
end
