class CountryDecorator
  attr_reader :country, :view_context

  delegate :id, :name, :description, :flag_img, :realties, to: :country

  def initialize (country, view_context)
    @country, @view_context = country, view_context
  end

  def flag_thumbnail
    if country.flag_img.attached?
      view_context.image_tag country.flag_img.variant(combine_options: {thumbnail: "360x225^", gravity: "center", extent: "360x225"}).processed, class: "img-responsive box-shadow"
    else
      %q{<img class="img-responsive box-shadow" style="height: 360px; width: 225px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22348%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20348%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1647fe353a5%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A17pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1647fe353a5%22%3E%3Crect%20width%3D%22348%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22117.5%22%20y%3D%22120.15%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">}
    end
  end

  def link_to_view_realties
    view_context.link_to 'View realty in this country', view_context.country_realties_path(country), class: "btn btn-sm btn-outline-danger"
  end

  def link_to_show
    view_context.link_to 'About country', country, class: "btn btn-sm btn-outline-danger"
  end

  def link_to_edit
    view_context.link_to 'Edit',view_context.edit_country_path(country), class: "btn btn-sm btn-outline-secondary" if view_context.user_signed_in?
  end

  def link_to_destroy
    view_context.link_to 'Destroy', country, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-sm btn-danger" if view_context.user_signed_in?
  end
end