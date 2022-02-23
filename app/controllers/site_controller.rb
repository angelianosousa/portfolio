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
  def projects
    @projects_list = Project.all.includes(:projects_stacks).page(params[:page]).per(3).with_attached_photo_principal
    @lasts_tree_projects = Project.last(3)
  end
  
end
