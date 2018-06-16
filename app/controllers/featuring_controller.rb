class FeaturingController < ApplicationController
  before_action :set_featuring, only: [:show, :edit, :update, :destroy]

  # GET /featuring
  # GET /featuring.json
  def index
    @featuring = Featuring.all
  end

  # GET /featuring/1
  # GET /featuring/1.json
  def show
  end

  # GET /featuring/new
  def new
    @featuring = Featuring.new
  end

  # GET /featuring/1/edit
  def edit
  end

  # POST /featuring
  # POST /featuring.json
  def create
    @featuring = Featuring.new(featuring_params)

    respond_to do |format|
      if @featuring.save
        format.html { redirect_to @featuring, notice: 'Featuring was successfully created.' }
        format.json { render :show, status: :created, location: @featuring }
      else
        format.html { render :new }
        format.json { render json: @featuring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featuring/1
  # PATCH/PUT /featuring/1.json
  def update
    respond_to do |format|
      if @featuring.update(featuring_params)
        format.html { redirect_to @featuring, notice: 'Featuring was successfully updated.' }
        format.json { render :show, status: :ok, location: @featuring }
      else
        format.html { render :edit }
        format.json { render json: @featuring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featuring/1
  # DELETE /featuring/1.json
  def destroy
    @featuring.destroy
    respond_to do |format|
      format.html { redirect_to featuring_index_url, notice: 'Featuring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featuring
      @featuring = Featuring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featuring_params
      params.require(:featuring).permit(:artist_id, :song_id)
    end
end
