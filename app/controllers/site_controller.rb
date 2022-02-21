class SiteController < ApplicationController
  layout 'site'
  def index
    @projects = Project.first(3)
  end

  def page_project
    @project = Project.find(params[:id])
  end

  # TODO about me
  def about_me
  end

  # TODO a page with all projects paginate
  def projects_list
    @projects = Project.all
  end
  
end
