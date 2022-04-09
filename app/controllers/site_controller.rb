class SiteController < ApplicationController
  layout 'site'

  def index
    @projects = Project.where(visible_on_home: true)
  end

  def page_project
    @project = Project.find(params[:id])
  end

  def about_me
    @professional_carreers = ProfessionalCarreer.order(start_date: :asc)
    @stacks = Stack.order(name: :asc)
  end

  def projects
    @projects_list = Project.where(visible_on_home: true).includes(:projects_stacks).page(params[:page]).per(3).with_attached_thumbnail
    @lasts_tree_projects = Project.last(3)
  end

  def sendmail
    MailContactMailer.with(name: params[:name], email: params[:email], phone: params[:phone], message: params[:message]).contact_interest.deliver
    redirect_to root_path, notice: "Contato enviado com sucesso, aguarde entrar em contato"
  end
  
end
