class SiteController < ApplicationController
  layout 'site'
  def index
    @projects = Project.all
  end
end
