class EventPerformancesController < ApplicationController
  before_action :set_event_performance, only: [:show, :edit, :update, :destroy]

  # GET /event_performances
  # GET /event_performances.json
  def index
    @event_performances = EventPerformance.all
  end

  # GET /event_performances/1
  # GET /event_performances/1.json
  def show
  end

  # GET /event_performances/new
  def new
    @event_performance = EventPerformance.new
  end

  # GET /event_performances/1/edit
  def edit
  end

  # POST /event_performances
  # POST /event_performances.json
  def create
    @event_performance = EventPerformance.new(event_performance_params)

    respond_to do |format|
      if @event_performance.save
        format.html { redirect_to @event_performance, notice: 'Event performance was successfully created.' }
        format.json { render :show, status: :created, location: @event_performance }
      else
        format.html { render :new }
        format.json { render json: @event_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_performances/1
  # PATCH/PUT /event_performances/1.json
  def update
    respond_to do |format|
      if @event_performance.update(event_performance_params)
        format.html { redirect_to @event_performance, notice: 'Event performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_performance }
      else
        format.html { render :edit }
        format.json { render json: @event_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_performances/1
  # DELETE /event_performances/1.json
  def destroy
    @event_performance.destroy
    respond_to do |format|
      format.html { redirect_to event_performances_url, notice: 'Event performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_performance
      @event_performance = EventPerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_performance_params
      params.require(:event_performance).permit(:performance_id, :appearance_id)
    end
end
