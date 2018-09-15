class ProjectDecorator
  attr_reader :project, :view_context

  delegate :id, :title, :preview_img, :preview, :main_image_header_variant, :description, to: :project

  def initialize (project, view_context)
    @project, @view_context = project, view_context
  end

  def start_datetime
    "Дата мероприятия: ".concat(project.start_datetime.strftime("%d.%m.%Y").to_s)
  end

  def thumbnail_image
    if project.preview_img.attached?
      view_context.image_tag project.preview_img.variant(combine_options: {thumbnail: "652x280^", gravity: "center", extent: "652x280"}).processed, class: "img-responsive", style: "padding-top:20px;"
    end
  end

  def landing_page_thumbnail_image
    if project.preview_img.attached?
      view_context.image_tag project.preview_img.variant(combine_options: {thumbnail: "652x280^", gravity: "center", extent: "652x280"}).processed, class: "img-responsive", style: "border: 1px solid #c3c3c3;"
    end
  end

  def main_image
    if project.preview_img.attached?
      view_context.image_tag project.preview_img.variant(resize: '750X484^').processed, class: "img-responsive project_img_top box-shadow img-rounded", style: "width: 100%"
    end
  end

  def preview_text
    preview.html_safe
  end

  def description_text
    description.html_safe
  end

  def link_to_show
    view_context.link_to 'Show', project, class: "btn btn-sm btn-outline-danger"
  end

  def link_to_edit
    view_context.link_to 'Edit',view_context.edit_project_path(project), class: "btn btn-sm btn-outline-secondary" if view_context.user_signed_in?
  end

  def link_to_destroy
    view_context.link_to 'Destroy', project, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-sm btn-danger" if view_context.user_signed_in?
  end
end
