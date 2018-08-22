class WelcomeController < ApplicationController
  layout "landing"

  def index
    @last_projects = last_projects
    @last_realties = last_realties
  end

  private

  def last_projects
    Project.all.limit(3)
  end

  def last_realties
    Realty.all.limit(3)
  end
end
