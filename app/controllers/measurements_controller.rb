class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, :expect => [:index, :show]  

  # GET /measurements or /measurements.json
  def index
    @measurements = Measurement.all
  end

  # GET /measurements/1 or /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new(:user_id => current_user.id)
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements or /measurements.json
  def create
    @measurement = Measurement.new(correct_parameters_for_mongo)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: "Measurement was successfully created." }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1 or /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(correct_parameters_for_mongo)
        format.html { redirect_to @measurement, notice: "Measurement was successfully updated." }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1 or /measurements/1.json
  def destroy
    @measurement.destroy
    # unless params[:profile_destroy]
      respond_to do |format|
        format.html { redirect_to measurements_url, notice: "Measurement was successfully destroyed." }
        format.json { head :no_content }
      end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to home_profile_path, notice: "Measurement was successfully destroyed." }
    #     format.json { head :no_content }
    #   end
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurement_params
      params.require(:measurement).permit(:data, :user_id, :type, :dt)
    end

    def correct_parameters_for_mongo
      correct_para = measurement_params
      correct_para[:user_id] = current_user.id
      correct_para[:data] = correct_para[:data].split(/[, \n]+/) - [""]
      correct_para
    end

end

  # Notes
    # separated by commas / spaces / newlines 
      # and remove the "" excess element at the beginning of the array 
        # -> occurs when we have a few whitespace at the beginning.
        # m_para[:data] = m_para[:data].split(/[, \n]+/) - [""]