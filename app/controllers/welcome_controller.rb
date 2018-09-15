class WelcomeController < ApplicationController
  layout "landing"

  def index
    @last_projects_decorators = last_projects.map { |project| ProjectDecorator.new(project, view_context) }
    @last_realties_decorators = last_realties.map { |realty| RealtyDecorator.new(realty, view_context) }
  end

  private

  def last_projects
    Project.limit(5).order('id desc')
  end

  def last_realties
    Realty.limit(5).order('id desc')
  end
end
