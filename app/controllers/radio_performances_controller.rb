class RadioPerformancesController < ApplicationController
  before_action :set_radio_performance, only: [:show, :edit, :update, :destroy]

  # GET /radio_performances
  # GET /radio_performances.json
  def index
    @radio_performances = RadioPerformance.all
  end

  # GET /radio_performances/1
  # GET /radio_performances/1.json
  def show
  end

  # GET /radio_performances/new
  def new
    @radio_performance = RadioPerformance.new
  end

  # GET /radio_performances/1/edit
  def edit
  end

  # POST /radio_performances
  # POST /radio_performances.json
  def create
    @radio_performance = RadioPerformance.new(radio_performance_params)

    respond_to do |format|
      if @radio_performance.save
        format.html { redirect_to @radio_performance, notice: 'Radio performance was successfully created.' }
        format.json { render :show, status: :created, location: @radio_performance }
      else
        format.html { render :new }
        format.json { render json: @radio_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radio_performances/1
  # PATCH/PUT /radio_performances/1.json
  def update
    respond_to do |format|
      if @radio_performance.update(radio_performance_params)
        format.html { redirect_to @radio_performance, notice: 'Radio performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @radio_performance }
      else
        format.html { render :edit }
        format.json { render json: @radio_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radio_performances/1
  # DELETE /radio_performances/1.json
  def destroy
    @radio_performance.destroy
    respond_to do |format|
      format.html { redirect_to radio_performances_url, notice: 'Radio performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_performance
      @radio_performance = RadioPerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_performance_params
      params.require(:radio_performance).permit(:performance_id, :radio, :time)
    end
end
