class GenreDependenciesController < ApplicationController
  before_action :set_genre_dependency, only: [:show, :edit, :update, :destroy]

  # GET /genre_dependencies
  # GET /genre_dependencies.json
  def index
    @genre_dependencies = GenreDependency.all
  end

  # GET /genre_dependencies/1
  # GET /genre_dependencies/1.json
  def show
  end

  # GET /genre_dependencies/new
  def new
    @genre_dependency = GenreDependency.new
  end

  # GET /genre_dependencies/1/edit
  def edit
  end

  # POST /genre_dependencies
  # POST /genre_dependencies.json
  def create
    @genre_dependency = GenreDependency.new(genre_dependency_params)

    respond_to do |format|
      if @genre_dependency.save
        format.html { redirect_to @genre_dependency, notice: 'Genre dependency was successfully created.' }
        format.json { render :show, status: :created, location: @genre_dependency }
      else
        format.html { render :new }
        format.json { render json: @genre_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genre_dependencies/1
  # PATCH/PUT /genre_dependencies/1.json
  def update
    respond_to do |format|
      if @genre_dependency.update(genre_dependency_params)
        format.html { redirect_to @genre_dependency, notice: 'Genre dependency was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre_dependency }
      else
        format.html { render :edit }
        format.json { render json: @genre_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genre_dependencies/1
  # DELETE /genre_dependencies/1.json
  def destroy
    @genre_dependency.destroy
    respond_to do |format|
      format.html { redirect_to genre_dependencies_url, notice: 'Genre dependency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre_dependency
      @genre_dependency = GenreDependency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_dependency_params
      params.require(:genre_dependency).permit(:genre_id, :super_genre_id)
    end
end
