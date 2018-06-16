class ProductionTypesController < ApplicationController
  before_action :set_production_type, only: [:show, :edit, :update, :destroy]

  # GET /production_types
  # GET /production_types.json
  def index
    @production_types = ProductionType.all
  end

  # GET /production_types/1
  # GET /production_types/1.json
  def show
  end

  # GET /production_types/new
  def new
    @production_type = ProductionType.new
  end

  # GET /production_types/1/edit
  def edit
  end

  # POST /production_types
  # POST /production_types.json
  def create
    @production_type = ProductionType.new(production_type_params)

    respond_to do |format|
      if @production_type.save
        format.html { redirect_to @production_type, notice: 'Production type was successfully created.' }
        format.json { render :show, status: :created, location: @production_type }
      else
        format.html { render :new }
        format.json { render json: @production_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_types/1
  # PATCH/PUT /production_types/1.json
  def update
    respond_to do |format|
      if @production_type.update(production_type_params)
        format.html { redirect_to @production_type, notice: 'Production type was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_type }
      else
        format.html { render :edit }
        format.json { render json: @production_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_types/1
  # DELETE /production_types/1.json
  def destroy
    @production_type.destroy
    respond_to do |format|
      format.html { redirect_to production_types_url, notice: 'Production type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_type
      @production_type = ProductionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_type_params
      params.require(:production_type).permit(:production_type_id, :name, :super_type)
    end
end
