class ApplicationController < ActionController::Base
  before_action :layout_by_resource

  def layout_by_resource
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
  end
  
end
