class Backoffice::ProjectsController < BackofficeController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    unless params[:title]
      @projects = Project.all.order(updated_at: :desc).includes(:projects_stacks).page(params[:page]).with_attached_thumbnail
    else
      @projects = Project.search_project(params[:title], params[:page]) 
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.pictures_carousel.attach(params[:pictures_carousel]) if params[:pictures_carousel]
    @project.photo_principal.attach(params[:photo_principal]) if params[:photo_principal]

    respond_to do |format|
      if @project.save
        format.html { redirect_to backoffice_projects_url, notice: "Projeto criado com sucesso!" }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project.pictures_carousel.attach(params[:pictures_carousel]) if params[:pictures_carousel]
    @project.photo_principal.attach(params[:photo_principal]) if params[:photo_principal]
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to backoffice_projects_url, notice: "Projeto atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_projects_url, notice: "Projeto removido com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :thumbnail, :description, :objectives, :learns, :production_link, :repository_link, pictures_carousel: [], projects_stacks_attributes: [ :id, :stack_id, :_destroy ])
    end
end
