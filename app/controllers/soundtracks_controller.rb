class SoundtracksController < ApplicationController
  before_action :set_soundtrack, only: [:show, :edit, :update, :destroy]

  # GET /soundtracks
  # GET /soundtracks.json
  def index
    @soundtracks = Soundtrack.all
  end

  # GET /soundtracks/1
  # GET /soundtracks/1.json
  def show
  end

  # GET /soundtracks/new
  def new
    @soundtrack = Soundtrack.new
  end

  # GET /soundtracks/1/edit
  def edit
  end

  # POST /soundtracks
  # POST /soundtracks.json
  def create
    @soundtrack = Soundtrack.new(soundtrack_params)

    respond_to do |format|
      if @soundtrack.save
        format.html { redirect_to @soundtrack, notice: 'Soundtrack was successfully created.' }
        format.json { render :show, status: :created, location: @soundtrack }
      else
        format.html { render :new }
        format.json { render json: @soundtrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soundtracks/1
  # PATCH/PUT /soundtracks/1.json
  def update
    respond_to do |format|
      if @soundtrack.update(soundtrack_params)
        format.html { redirect_to @soundtrack, notice: 'Soundtrack was successfully updated.' }
        format.json { render :show, status: :ok, location: @soundtrack }
      else
        format.html { render :edit }
        format.json { render json: @soundtrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soundtracks/1
  # DELETE /soundtracks/1.json
  def destroy
    @soundtrack.destroy
    respond_to do |format|
      format.html { redirect_to soundtracks_url, notice: 'Soundtrack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soundtrack
      @soundtrack = Soundtrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soundtrack_params
      params.require(:soundtrack).permit(:song_id, :production_id)
    end
end
