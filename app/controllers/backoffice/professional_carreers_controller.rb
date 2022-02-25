class Backoffice::ProfessionalCarreersController < BackofficeController
  before_action :set_professional_carreer, only: %i[ show edit update destroy ]

  # GET /professional_carreers or /professional_carreers.json
  def index
    @professional_carreers = ProfessionalCarreer.all
  end

  # GET /professional_carreers/1 or /professional_carreers/1.json
  def show
  end

  # GET /professional_carreers/new
  def new
    @professional_carreer = ProfessionalCarreer.new
  end

  # GET /professional_carreers/1/edit
  def edit
  end

  # POST /professional_carreers or /professional_carreers.json
  def create
    @professional_carreer = ProfessionalCarreer.new(professional_carreer_params)

    respond_to do |format|
      if @professional_carreer.save
        format.html { redirect_to professional_carreer_url(@professional_carreer), notice: "Professional carreer was successfully created." }
        format.json { render :show, status: :created, location: @professional_carreer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @professional_carreer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_carreers/1 or /professional_carreers/1.json
  def update
    respond_to do |format|
      if @professional_carreer.update(professional_carreer_params)
        format.html { redirect_to professional_carreer_url(@professional_carreer), notice: "Professional carreer was successfully updated." }
        format.json { render :show, status: :ok, location: @professional_carreer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @professional_carreer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_carreers/1 or /professional_carreers/1.json
  def destroy
    @professional_carreer.destroy

    respond_to do |format|
      format.html { redirect_to professional_carreers_url, notice: "Professional carreer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_carreer
      @professional_carreer = ProfessionalCarreer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professional_carreer_params
      params.require(:professional_carreer).permit(:start_date, :end_date, :occupation, :description)
    end
end
