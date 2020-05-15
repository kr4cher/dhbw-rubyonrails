class InfectionsController < ApplicationController
  before_action :set_infection, only: [:show, :edit, :update, :destroy]

  # GET /infections
  # GET /infections.json
  def index
    @infections = Infection.all
  end

  # GET /infections/1
  # GET /infections/1.json
  def show
  end

  # GET /infections/new
  def new
    @infection = Infection.new
  end

  # GET /infections/1/edit
  def edit
  end

  # POST /infections
  # POST /infections.json
  def create
    @infection = Infection.new(infection_params)

    respond_to do |format|
      if @infection.save
        format.html { redirect_to @infection, notice: 'Infection was successfully created.' }
        format.json { render :show, status: :created, location: @infection }
      else
        format.html { render :new }
        format.json { render json: @infection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infections/1
  # PATCH/PUT /infections/1.json
  def update
    respond_to do |format|
      if @infection.update(infection_params)
        format.html { redirect_to @infection, notice: 'Infection was successfully updated.' }
        format.json { render :show, status: :ok, location: @infection }
      else
        format.html { render :edit }
        format.json { render json: @infection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infections/1
  # DELETE /infections/1.json
  def destroy
    @infection.destroy
    respond_to do |format|
      format.html { redirect_to infections_url, notice: 'Infection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infection
      @infection = Infection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def infection_params
      params.require(:infection).permit(:name, :patient_id)
    end
end
