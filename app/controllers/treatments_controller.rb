class TreatmentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  # GET /treatments
  # GET /treatments.json
  def index
    if current_user.type == "Admin"
      @treatments = Treatment.all
    else 
      @treatments = current_user.treatments
    end
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
    @medicines = @treatment.medicines
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
    @medicines = Medicine.all
  end

  # GET /treatments/1/edit
  def edit
    @medicines = Medicine.all
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    @medicines = Medicine.find(params[:treatment][:medicine_ids].drop(1))

    @treatment.medicines << @medicines
    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, success: 'Treatment was successfully created.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    @medicines = Medicine.find(params[:treatment][:medicine_ids].drop(1))
    if @medicines.length == @treatment.medicines.length
      @medicines = @medicines - @treatment.medicines
    else
      @treatment.medicines = @medicines
    end
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, success: 'Treatment was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, success: 'Treatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:dosis, :instructions, :user_id, :medicines)
    end

    def authenticate_user
      if !current_user
        redirect_to root_url
      elsif current_user.type == "Secretary"
        redirect_to root_path, danger: "No tienes permisos para acceder a los tratamientos"
      end
    end
end
